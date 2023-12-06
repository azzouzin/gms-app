import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gms_app/View/Compenents/app_bar.dart';
import 'package:gms_app/View/NavPages/home_page.dart';
import 'package:iconsax/iconsax.dart';

import '../constants.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            const MyAppBare(),
            verticalSpace,
            searchbare(),
            verticalSpace,
            card('200.00')
          ],
        ),
      ),
    );
  }

  Container card(String e) {
    return Container(
      width: Get.width * 0.4,
      height: Get.width * 0.3,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        children: [
          Expanded(
            //width: Get.width * 0.4,
            child: Container(
              width: Get.width * 0.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/pipe.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            width: Get.width * 0.4,
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(0.5),
                  maink,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Iconsax.heart5,
                  size: 15,
                  color: Colors.redAccent,
                ),
                Text(
                  e,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container searchbare() {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.075,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 5))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.77,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'الة ثقب, الة قطع ',
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.search,
              size: 25,
              color: maink,
            ),
          ],
        ),
      ),
    );
  }
}
