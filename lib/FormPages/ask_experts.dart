import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../View/Compenents/app_bar.dart';
import '../View/constants.dart';

class AskExperts extends StatefulWidget {
  const AskExperts({super.key});

  @override
  State<AskExperts> createState() => _ASkExpertsState();
}

class _ASkExpertsState extends State<AskExperts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: mainWidget(),
      ),
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Column mainWidget() {
    TextEditingController name = TextEditingController();
    TextEditingController birthdate = TextEditingController();
    TextEditingController email = TextEditingController();
    return Column(
      children: [
        MyAppBare(
          scaffoldKey: _scaffoldKey,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: title('إسأل  الصيانة', Iconsax.message_question),
        ),
        Container(
          width: Get.width * 0.9,
          height: Get.height * 0.25,
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
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 10,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'أكتب  سؤالك هنا ',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        verticalSpace,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: maink,
              fixedSize: Size(Get.width * 0.9, Get.height * 0.075),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            Get.back();
            Get.snackbar(
              'تم إرسال طلبك بنجاح ',
              'سنقوم برد عليك في أقرب  وقت',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.greenAccent.withOpacity(0.5),
            );
          },
          child: Text(
            'إرسال',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
          ),
        ),
        verticalSpace,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: title('أو إتصل على الارقام التالية', Icons.phone),
        ),
        verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              body('0552320255'),
              Icon(Iconsax.forward_item),
            ],
          ),
        ),
        verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              body('0659977490'),
              Icon(Iconsax.forward_item),
            ],
          ),
        ),
      ],
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

  Text body(String t) {
    return Text(
      t,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: maink),
    );
  }
}
