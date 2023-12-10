import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gms_app/keys.dart';

import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../View/Compenents/app_bar.dart';
import '../View/constants.dart';

class DemandForm extends StatefulWidget {
  const DemandForm({super.key, required this.khidma});
  final String khidma;
  @override
  State<DemandForm> createState() => _DemandFormState();
}

class _DemandFormState extends State<DemandForm> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController wasf = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? imageFile = null;
  final List<String> listOfTypes = [
    'المنازل',
    'المؤسسات العمومية ',
    'المصانع',
    'مستشفيات',
    'المرافق العمومية ',
    'الفنادق',
  ];
  String value = 'المنازل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyAppBare(
              scaffoldKey: _scaffoldKey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: title(' طلب خدمة ${widget.khidma}', Iconsax.wallet),
            ),
            textField('الاسم و اللقب', name, Iconsax.personalcard),
            verticalSpace,
            textField('رقم الهاتف', phone, Icons.phone),
            verticalSpace,
            textField('وصف العطل', wasf, Iconsax.pen_tool),
            verticalSpace,
            InkWell(
              onTap: () {
                setState(() {
                  _openImagePicker();
                });
                setState(() {});
              },
              child: Container(
                width: 500 * 0.9,
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
                      ? 'اظغط هنا لتحميل صورة العطل'
                      : 'تم تحميل الصورة'),
                ),
              ),
            ),
            verticalSpace,
            Container(
              width: 500 * 0.9,
              child: DropdownButton(
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  value: value,
                  items: listOfTypes
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(color: maink),
                            ),
                          ))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      value = v!;
                    });
                  }),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: maink,
                    fixedSize: Size(500 * 0.9, Get.height * 0.075),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  // await sendSimpleMessage();
                  //   await sendEmail();
                  /*   var body = {
                'from': 'Jane Smith <jane.smith@somecompany.com>',
                'to': [
                  'john.smith@somedomain.com',
                  'alice.smith@somedomain.com',
                ],
                'replyTo': 'all.replies@somedomain.com',
                'subject': 'Mail subject text and placeholder ph1',
                'text':
                    'Dear {{name}}, this is mail body text with placeholders in body {{ph1}} and {{ph2}}',
              };
        
              var resp = await http.post(
                  Uri.parse('https://xlr8x3.api.infobip.com/email/3/send'),
                  headers: {
                    //"Accept": "application/json",
                    "Content-Type": "multipart/form-data",
                    'Authorization': 'App $key'
                  },
                  body: json.encode(body));
              print(resp.body);
              print(resp.statusCode);*/
                  //  Get.back();
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  /* final Email email = Email(
                    body:
                        'رقم هاتفك هو : ${phone.text}\n الاسم و اللقب   : ${name.text} \n وصف العطل هو : ${wasf.text}',
                    subject: 'طلب خدمة ${widget.khidma}  لل$value ',
                    recipients: ['maintenancegeneral2024@gmail.com'],
                    // cc: ['cc@example.com'],
                    //bcc: ['bcc@example.com'],
                    attachmentPaths: imageFile == null ? [] : [imageFile!.path],
                    isHTML: false,
                  );
        
                  await FlutterEmailSender.send(email);*/

                  // ···
                  await sendEmailurlLuncher(
                      phone, encodeQueryParameters, name, wasf);

                  /*    bool b = await canLaunchUrl(emailLaunchUri);
              if (b) {
                await launchUrl(emailLaunchUri);
              } else {
                log(b.toString());
              }
            */
                  Get.snackbar(
                    'تم إرسال طلبك بنجاح ',
                    'سنقوم برد عليك في أقرب  وقت',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.greenAccent.withOpacity(0.5),
                  );
                  Get.back();
                },
                child: const Text(
                  'إرسال',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                )),
            verticalSpace,
          ],
        ),
      ),
    );
  }

  Future<void> sendEmailurlLuncher(
      TextEditingController phone,
      String? encodeQueryParameters(Map<String, String> params),
      TextEditingController name,
      TextEditingController email) async {
    print(phone.text);
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'gmsmaintenance2024@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'طلب خدمة ${widget.khidma}  لل$value ',
        'body':
            'رقم هاتفك هو : ${phone.text}\n الاسم و اللقب   : ${name.text} \n وصف العطل هو : ${email.text}',
      }),
    );
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      log(e.toString());
    }
  }

  Row title(String t, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          t,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: maink),
        ),
        const SizedBox(
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
            width: 500 * 0.9,
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
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
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

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      // Do something with the image file
    }
  }
}
