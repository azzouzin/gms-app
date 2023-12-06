import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gms_app/View/Compenents/app_bar.dart';
import 'package:gms_app/View/constants.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const MyAppBare(),
            corseCard(),
          ],
        ),
      ),
    );
  }

  Align corseCard() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: Get.width * 0.9,
        //height: Get.height * 0.25,
        decoration: BoxDecoration(
          // border: Border.all(width: 0.5, color: Colors.grey),

          //  color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: Get.width * 0.9,
              height: Get.height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/pipe.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width * 0.9,
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 5))
                  ],
                ),
                child: const Center(
                  child: Text(
                    'دورة صيانة الاجهزة الكهرومنزلية',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: maink),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
