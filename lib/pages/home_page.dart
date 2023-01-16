import 'package:custom_toast_flutter_app/widgets/carousel_slider_widget.dart';
import 'package:custom_toast_flutter_app/widgets/category_item.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),

          ///Discover title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Discover",
                  style: TextStyle(
                      color: Color.fromARGB(255, 131, 126, 126),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 70,
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const CarouselSliderWidget(),
          const SizedBox(
            height: 15,
          ),

          //categories title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Color.fromARGB(255, 131, 126, 126),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      color: Color.fromARGB(255, 55, 53, 53),
                      fontSize: 12,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),

          //categories
          SizedBox(
            height: 90,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryItem(icon: Icons.light_outlined, text: "Light"),
                CategoryItem(icon: Icons.chair_outlined, text: "Arm Chair"),
                CategoryItem(icon: Icons.bed_outlined, text: "Bed"),
                CategoryItem(icon: Icons.tv_outlined, text: "Cupboard"),
              ],
            ),
          ),

          //Featured
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Featured Concept",
              style: TextStyle(
                  color: Color.fromARGB(255, 131, 126, 126),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2),BlendMode.dstIn),
                    fit: BoxFit.cover,
                    image: const NetworkImage(
                      "https://assets.architecturaldigest.in/photos/60084dd6cce5700439e12bf7/16:9/w_2560%2Cc_limit/modern-living-room-decor-1366x768.jpg",
                    ))),
          )
        ],
      ),
    );
  }
}
