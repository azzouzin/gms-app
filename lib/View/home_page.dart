import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listofService = ['سباك', 'كهربائي', 'منظف'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.5,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: Get.width,
                    height: Get.height * 0.45,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 71, 129),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                  ),
                  Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.075,
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      height: Get.height * 0.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            fit: BoxFit.fill,
                          ),
                          const Text(
                            "General Maintanance Service",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_horiz_sharp))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.4,
              child: Flex(
                direction: Axis.vertical,
                clipBehavior: Clip.hardEdge,
                children: [
                  ...listofService.map((e) => card()).toList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container card() {
    return Container(
      width: Get.width * 0.3,
      height: Get.width * 0.25,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.white,
            Colors.white,
            Colors.transparent,
          ],
        ),
      ),
      child: Stack(children: [
        Container(
          width: Get.width * 0.3,
          height: Get.width * 0.25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/pipe.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: Get.width * 0.3,
          height: Get.width * 0.25,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.2),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text('سباك'),
        ),
      ]),
    );
  }
}
