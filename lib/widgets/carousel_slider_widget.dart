import 'package:custom_toast_flutter_app/custom_toast/custom_toast_widget.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  late PageController _pageController;
  int activePage = 1;

  List<String> images = [
    "https://wallpaperaccess.com/full/2076139.jpg",
    "https://media.istockphoto.com/id/889463880/photo/colorful-living-room.jpg?s=612x612&w=0&k=20&c=FhbicKdU-JI7iTrT2h6Ym0KZy3AhrYGDG_L1j5ii-5k=",
    "https://c4.wallpaperflare.com/wallpaper/480/897/69/room-blue-furniture-couch-wallpaper-preview.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
    // showCustomToast(context, 'test', Colors.blueAccent, Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: PageView.builder(
              itemCount: images.length,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return AnimatedContainer(
                  margin: const EdgeInsets.all(20),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        images[pagePosition],
                        fit: BoxFit.cover,
                      )),
                );
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
