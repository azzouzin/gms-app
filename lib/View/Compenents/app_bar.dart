import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBare extends StatelessWidget {
  const MyAppBare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        width: Get.width,
        height: Get.height * 0.1,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 5))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.fill,
            ),
            const Text(
              "General Maintanance Service",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_horiz_sharp))
          ],
        ),
      ),
    );
  }
}
