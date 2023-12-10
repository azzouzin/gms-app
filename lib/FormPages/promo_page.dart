import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../View/Compenents/app_bar.dart';
import '../View/constants.dart';

class PromoPage extends StatelessWidget {
  PromoPage({super.key});

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
          child: title('إسأل  الصيانة', Iconsax.dollar_circle),
        ),
        Container(
          width: 500 * 0.9,
          height: Get.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              ".يتحصل الزبون لتخفيض في سعر الخدمة لثالث طلب \nالزبون الوفي لمؤسستنا يحصل على صيانة وقائية مجانية بالكامل \nتوفير متابعة ما بعد الصيانة   \n  الحصول على ضمان للخدمة لمدة معينة \n",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: maink,
                fontSize: 18,
              ),
            ),
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
}
