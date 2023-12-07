import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gms_app/View/constants.dart';
import 'package:iconsax/iconsax.dart';

import '../Compenents/app_bar.dart';

class AbooutUs extends StatefulWidget {
  const AbooutUs({super.key});

  @override
  State<AbooutUs> createState() => _AbooutUsState();
}

class _AbooutUsState extends State<AbooutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBare(),
              verticalSpace,
              whoAreWe(),
              verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: title('موقعنا', Iconsax.location),
              ),
              verticalSpace,
              Center(
                child: Container(
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
                  height: Get.height * 0.2,
                  width: Get.width * 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/location.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              verticalSpace,
              verticalSpace,
              verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: title('تواصل معنا', Icons.phone),
              ),
              verticalSpace,
              ContactUs(
                logo: AssetImage('assets/logo.png'),
                email: 'adoshi26.ad@gmail.com',
                companyName: 'Gms',
                phoneNumber: '+213562413935',
                dividerThickness: 2,
                dividerColor: const Color.fromARGB(255, 117, 116, 116),
                website: 'https://abhishekdoshi.godaddysites.com',
                //  githubUserName: 'AbhishekDoshi26',
                companyFontSize: 30,
                tagLine: 'General Maintanance Service',
                //  twitterHandle: 'AbhishekDoshi26',
                cardColor: maink,
                companyColor: maink,
                taglineColor: maink,
                textColor: Colors.white,
              ),
              verticalSpace,
              verticalSpace,
              verticalSpace,
              verticalSpace,
              verticalSpace,
              verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Row title(String t, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          t,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: maink),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          iconData,
          color: maink,
        ),
      ],
    );
  }

  Container whoAreWe() {
    return Container(
      height: Get.height * 0.75,
      width: Get.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: Get.height * 0.65,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              decoration: BoxDecoration(
                  // border: Border.all(width: 0.5, color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 5))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'كمقدم خدماتGMS  للصيانة العامة ،\n مؤسستنا تسعى جاهدة باستمرار. ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    'لتقديم خدمات آمنة و فعالة من حيث التكلفة للعملاء . ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  verticalSpace,
                  Text(
                    ' في سعينا للتميز في الخدمات و نحن كمؤسسة قائمة بحد ذاتها قد شرعنا في إيجاد حلول متكاملة لخدمات الصيانة و الإصلاح و الترميم التي أدت إلى التوصل لحل لمشكلتين أولهما صعوبة إيجاد المصلح و ثانيهما العجز في نقل الجهاز المعطل نحن نقدم دائما لعملائنا خدمة ذات جودة عالية ، سهرا منا لتسهيل حياتكم من خلال إرسال فريق مختص في الصيانة بأنواعها إلى مكان حدوث العطل فإننا نقدم لكم خدمات متعددة تساعدكم على تلبية احتياجاتكم بمهنية ,كفاءة و ضمان إن كنت تريد الاستفادة من خدمات مؤسستنا ، إليك هذا التطبيق للتعرف على المزيد. ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: maink,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                SizedBox(
                  height: Get.width * 0.4,
                  width: Get.width * 0.4,
                  child: Image.asset('assets/logo.png'),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: title('من نحن ؟', Iconsax.info_circle),
              ))
        ],
      ),
    );
  }
}
