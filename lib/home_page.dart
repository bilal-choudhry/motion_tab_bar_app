import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:motion_tab_bar_app/tab_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(TabControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motion Tab Bar"),
        centerTitle: true,
      ),
      body: Obx(() => controller.getIndex() == 0 ?
      myPage("Dashboard", Colors.redAccent):
      controller.getIndex() == 1 ?
      myPage("Chit Chat", Colors.purple):
      myPage('Delete', Colors.pinkAccent)),
      bottomNavigationBar: MotionTabBar(
        icons: [
          Icons.dashboard_rounded,
          Icons.voice_chat,
          Icons.delete_sweep_rounded
        ],
        tabIconColor: Colors.orange,
        tabSelectedColor: Colors.yellow,
        labels: ["Dashboard", "Chit Chat", "Delete"],
        initialSelectedTab: "Dashboard",
        textStyle: TextStyle(color: Colors.green, fontSize: 20),
        onTabItemSelected: (int val)=>controller.setIndex(val),

      ),
    );
  }

  myPage(String fashion, Color color) =>
      Container(
        color: color,
        width: double.infinity,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(fashion,
          style: TextStyle(color: color.computeLuminance() < 0.5 ?
          Colors.black:
          Colors.pinkAccent, fontSize: 25))
        ],
      )

  ,

  );
}
