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
  File? imageFile = null;
  Column mainWidget() {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    return Column(
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
        textField('وصف العطل', email, Iconsax.pen_tool),
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
                  ? 'اظغط هنا لتحميل صورة العطل'
                  : 'تم تحميل الصورة'),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: maink,
                fixedSize: Size(Get.width * 0.9, Get.height * 0.075),
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

              final Email email = Email(
                body: 'Email body',
                subject: 'Email subject',
                recipients: ['gmsmaintenance2024@gmail.com'],
                // cc: ['cc@example.com'],
                //bcc: ['bcc@example.com'],
                attachmentPaths: [imageFile!.path],
                isHTML: false,
              );

              await FlutterEmailSender.send(email);

// ···
              //   await sendEmailurlLuncher(phone, encodeQueryParameters, name, email);

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
        'subject': 'طلب خدمة ${widget.khidma}',
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

  Future<void> sendEmail() async {
    final String BASE_URL = "https://xlr8x3.api.infobip.com";
    final String API_KEY =
        "App b5cd4bf881bf69bd5271fe714b9466b7-678bf070-36bc-4875-b1b8-eb5edaf937fe";

    final String SENDER_EMAIL = "merouaniadh@gmail.com";
    final String RECIPIENT_EMAIL = "azzouzmerw@gmail.com";
    final String EMAIL_SUBJECT = "This is a sample email subject";
    final String EMAIL_TEXT = "This is a sample email message.";

    final String BASE_FILE_PATH = "/home/infobip/project/src/email/files";
    final String file_name = "infobip.png";

    final File file = File('$BASE_FILE_PATH/$file_name');
    final http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$BASE_URL/email/3/send'));

    request.headers.addAll({'Authorization': API_KEY});
    request.fields.addAll({
      'from': SENDER_EMAIL,
      'to': RECIPIENT_EMAIL,
      'subject': EMAIL_SUBJECT,
      'text': EMAIL_TEXT,
    });
    request.files
        .add(await http.MultipartFile.fromPath('attachment', imageFile!.path));

    final http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('Email sent successfully!');
      print(response.headers);
      print(response.reasonPhrase);
    } else {
      print('Failed to send email. Error code: ${response.statusCode}');
    }
  }

  Future<void> sendSimpleMessage() async {
    final String BASE_URL = "https://api.mailgun.net/v3/$domain/messages";
    final String API_KEY = mailgunKey;

    final String SENDER_EMAIL = "Excited User <azzouzmerw@gmail>";
    final List<String> RECIPIENT_EMAILS = [
      "azzouzmerw@gmail.com",
      //"YOU@$domain"
    ];
    final String EMAIL_SUBJECT = "Hello";
    final String EMAIL_TEXT = "Testing some Mailgun awesomeness!";

    final http.Response response = await http.post(
      Uri.parse(BASE_URL),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('api:$API_KEY')),
      },
      body: {
        'from': SENDER_EMAIL,
        'to': RECIPIENT_EMAILS.join(','),
        'subject': EMAIL_SUBJECT,
        'text': EMAIL_TEXT,
      },
    );

    if (response.statusCode == 200) {
      print('Email sent successfully!');
    } else {
      print('Failed to send email. Error code: ${response.body}');
    }
  }
}
