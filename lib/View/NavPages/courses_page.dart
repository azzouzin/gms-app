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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final listOfCourses = [
    'دورة تكوينية شاملة في السباكة',
    'دورة تكوينية شاملة في الكهرباء',
    'دورة تكوينية شاملة في الصباغة',
    'دورة تكوينية شاملة في البناء',
    'دورة تكوينية شاملة في الجبس',
    'دورة تكوينية شاملة في الحدادة',
    'دورة تكوينية شاملة في النجار',
    'دورة تكوينية شاملة في البستنة',
    'دورة تكوينية شاملة في صيانة وتركيب كاميرات المراقبة',
  ];
  final listOfImgs = [
    'assets/sibaka.jpg',
    'assets/kahraba2.jpg',
    'assets/painter.jpg',
    'assets/bana2.png',
    'assets/jabs.jpg',
    'assets/hadad.jpg',
    'assets/njar.jpg',
    'assets/bostan.jpg',
    'assets/camera.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBare(
                scaffoldKey: _scaffoldKey,
              ),
              ...listOfCourses
                  .map(
                      (e) => corseCard(e, listOfImgs[listOfCourses.indexOf(e)]))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Align corseCard(String title, String imgpath) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
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
                    imgpath,
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
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: maink),
                    ),
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
