import 'package:flutter/material.dart';

void showCustomToast(BuildContext context, String message, Color background,
    Color textColor) async {
  OverlayEntry? overlayEntry;

  if(overlayEntry==null){
    overlayEntry = OverlayEntry(
    builder: (BuildContext context) => Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: _ToastAnimatedWidget(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Text(
                  message,
                  softWrap: true,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    ),
  );
  Overlay.of(context)!.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 6), (() {
    overlayEntry?.remove();
  }));
  }
}

class _ToastAnimatedWidget extends StatefulWidget {
  const _ToastAnimatedWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _ToastWidgetState createState() => _ToastWidgetState(child);
}

class _ToastWidgetState extends State<_ToastAnimatedWidget>
    with SingleTickerProviderStateMixin {
  final Widget childContent;
  //bool isCompleted = false;

  late final AnimationController _forwardController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<Offset> _forwardOffsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(_forwardController);

  @override
  initState() {
    _forwardController.forward();
    _forwardController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 3), () {
          _forwardController.reverse();
          // }
        });
      }
    });
    super.initState();
  }

  _ToastWidgetState(this.childContent);

  @override
  void dispose() {
    if (_forwardController.isCompleted) {
      _forwardController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _forwardOffsetAnimation,
      child: childContent,
    );
  }
}

