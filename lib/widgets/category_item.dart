import 'package:custom_toast_flutter_app/custom_toast/custom_toast_widget.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  late bool isCompleted;

  @override
  void initState() {
    isCompleted = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isCompleted) {
          setState(() {
            isCompleted = false;
          });
          showCustomToast(context, 'All your future needs are here!',
              const Color.fromARGB(255, 96, 205, 220), Colors.white);
          Future.delayed(const Duration(seconds: 3), (() {
            setState(() {
              isCompleted = true;
            });
          }));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 90,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 219, 208, 208),
                blurRadius: 4,
                offset: Offset(0, 2), // Shadow position
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(
              widget.icon,
              color: const Color.fromARGB(255, 179, 173, 173),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 55, 53, 53),
                  fontSize: 11,
                  fontWeight: FontWeight.w300),
            )
          ]),
        ),
      ),
    );
  }
}
