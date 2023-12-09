import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gms_app/FormPages/ask_experts.dart';
import 'package:gms_app/FormPages/rate_us.dart';
import 'package:gms_app/FormPages/work_with_us_page.dart';
import 'package:gms_app/View/NavPages/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../FormPages/promo_page.dart';
import '../constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: Get.width * 0.9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Container(
              height: Get.height * 0.6,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const WorkWithUs());
                    },
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
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
                  InkWell(
                    onTap: () {
                      Get.to(PromoPage());
                    },
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "عروض و تخفيضات",
                        style: TextStyle(
                            color: maink,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                    ),
                  ),
                  verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.to(const AskExperts());
                    },
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "إسأل  الصيانة",
                        style: TextStyle(
                            color: maink,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                    ),
                  ),
                  verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.to(const RateUS());
                    },
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "التقييم",
                        style: TextStyle(
                            color: maink,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                    ),
                  ),
                  verticalSpace,
                  InkWell(
                    onTap: () => Get.to(const AbooutUs()),
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "من نحن",
                        style: TextStyle(
                            color: maink,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () async {
                      final Uri call = Uri(
                        scheme: 'tel',
                        path: '+213552320255',
                      );
                      if (await launchUrl(call)) {
                        await launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "اتصل بنا",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
