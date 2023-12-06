import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:gms_app/View/constants.dart';
import 'package:gms_app/View/NavPages/home_page.dart';
import 'package:gms_app/View/NavPages/products_page.dart';

import 'View/NavPages/courses_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Colors.white,
        selectedIconColor: maink,
        unselectedIconColor: Colors.grey.withOpacity(0.6),
        borderRadius: 50,
        items: [
          FloatingNavBarItem(
              iconData: Icons.home_outlined, page: HomePage(), title: 'Home'),
          FloatingNavBarItem(
              iconData: Icons.production_quantity_limits,
              page: ProductsPage(),
              title: 'Products'),
          FloatingNavBarItem(
              iconData: Icons.alarm, page: CoursesPage(), title: 'Courses'),
          FloatingNavBarItem(
              iconData: Icons.pending_actions_outlined,
              page: HomePage(),
              title: 'Records'),
        ],
        horizontalPadding: 20.0,
        hapticFeedback: true,
        showTitle: false,
      ),
    );
  }
}
