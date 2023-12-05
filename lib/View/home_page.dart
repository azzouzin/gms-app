import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          //  _controller.pause();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<String> listofService = [
    'السباكة',
    'الكهرباء',
    'الصباغة',
    'البناء',
    'الجبس',
    'الحدادة',
    'النجار',
    'البستنة',
    'كاميرات المراقبة',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BottomBar(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "This is the floating widget",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: (context, controller) => mainWidget(),
          ),
        ),
      ),
      /* bottomNavigationBar: BottomBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "This is the floating widget",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: (context, controller) =>
              InfiniteListPage(controller: controller, color: Colors.blue,),
    ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  Column mainWidget() {
    return Column(
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
              searchbare(),
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _controller.value.isInitialized
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        )
                      : Container(),
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
        Container(
          // color: Colors.deepOrange,
          // height: Get.height * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...listofService.map((e) {
                    return listofService.indexOf(e) % 2 == 0
                        ? card(e)
                        : Container();
                  }).toList(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...listofService.map((e) {
                    return listofService.indexOf(e) % 2 != 0
                        ? card(e)
                        : Container();
                  }).toList(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Container searchbare() {
    return Container(
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
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.77,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'السباكة,كاميرات المراقبة... ',
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.search,
              size: 25,
              color: maink,
            ),
          ],
        ),
      ),
    );
  }

  Container card(String e) {
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
          child: Text(e),
        ),
      ]),
    );
  }
}
