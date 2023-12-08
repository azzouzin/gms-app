import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gms_app/FormPages/work_with_us_page.dart';

import '../constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: Get.width * 0.8,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: Get.height * 0.1),
          child: SizedBox(
            height: Get.height * 0.6,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(WorkWithUs());
                  },
                  child: Container(
                    width: Get.width * 0.7,
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "للعمل معانا ",
                      style: TextStyle(
                          color: maink,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    )),
                  ),
                ),
                verticalSpace,
                Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "للعمل معانا ",
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )),
                ),
                verticalSpace,
                Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "للعمل معانا ",
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )),
                ),
                verticalSpace,
                Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "للعمل معانا ",
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )),
                ),
                verticalSpace,
                Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "للعمل معانا ",
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )),
                ),
                Expanded(child: SizedBox()),
                Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "للعمل معانا ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
