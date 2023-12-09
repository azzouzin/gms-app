import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rate/rate.dart';

import '../View/Compenents/app_bar.dart';
import '../View/constants.dart';

class RateUS extends StatefulWidget {
  const RateUS({super.key});

  @override
  State<RateUS> createState() => _RateUSState();
}

class _RateUSState extends State<RateUS> {
  int? _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBare(
              scaffoldKey: _scaffoldKey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: title('التقييم', Iconsax.star),
            ),
            body('تقييمك يساعدنا في تحسين خدماتنا'),
            verticalSpace,
            SizedBox(
              width: Get.width * 0.9,
              height: Get.height * 0.4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.35,
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
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Container()),
                            RadioListTile(
                              title: Text('ضعيفة '),
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('مقبولة '),
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('جيدة '),
                              value: 3,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('ممتازة '),
                              value: 4,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                            ),
                          ],
                        )),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Get.width * 0.7,
                      height: Get.height * 0.1,
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
                        child: Rate(
                          iconSize: 40,
                          color: Colors.amber,
                          allowHalf: true,
                          allowClear: true,
                          initialValue: 3.5,
                          readOnly: false,
                          onChange: (value) => print(value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace,
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
                  'تم إرسال تقييمك بنجاح ',
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
              ),
            ),
            verticalSpace,
          ],
        ),
      ),
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Column mainWidget() {
    return Column(
      children: [
        MyAppBare(
          scaffoldKey: _scaffoldKey,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: title('التقييم', Iconsax.star),
        ),
        body('تقييمك يساعدنا في تحسين خدماتنا'),
        verticalSpace,
        SizedBox(
          width: Get.width * 0.9,
          height: Get.height * 0.4,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.35,
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
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Container()),
                        RadioListTile(
                          title: Text('ضعيفة '),
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('مقبولة '),
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('جيدة '),
                          value: 3,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('ممتازة '),
                          value: 4,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: Get.width * 0.7,
                  height: Get.height * 0.1,
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
                    child: Rate(
                      iconSize: 40,
                      color: Colors.amber,
                      allowHalf: true,
                      allowClear: true,
                      initialValue: 3.5,
                      readOnly: false,
                      onChange: (value) => print(value),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace,
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
              'تم إرسال تقييمك بنجاح ',
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
