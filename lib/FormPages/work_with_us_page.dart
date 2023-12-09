import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../View/Compenents/app_bar.dart';
import '../View/constants.dart';

class WorkWithUs extends StatefulWidget {
  const WorkWithUs({super.key});

  @override
  State<WorkWithUs> createState() => _WorkWithUsState();
}

class _WorkWithUsState extends State<WorkWithUs> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: mainWidget(),
      ),
    );
  }

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
          child: title('طلب  العمل ', Iconsax.activity),
        ),
        textField('الاسم و اللقب', name, Icons.person),
        verticalSpace,
        textField('رقم الهاتف', birthdate, Icons.phone),
        verticalSpace,
        textField('الايمايل', email, Icons.email),
        verticalSpace,
        InkWell(
          onTap: () {
            setState(() {
              _openImagePicker();
            });
            setState(() {});
          },
          child: Container(
            width: Get.width * 0.9,
            height: Get.height * 0.15,
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
              child: Text(imageFile == null
                  ? 'اظغط هنا لتحميل الشهادات ان وجدت '
                  : 'تم تحميل الشهادات'),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
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
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            )),
        verticalSpace,
      ],
    );
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      // Do something with the image file
    }
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

  Padding textField(
      String tit, TextEditingController editingController, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          title(tit, iconData),
          Container(
            width: Get.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: maink,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
