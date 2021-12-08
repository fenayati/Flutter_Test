import 'package:flutter/material.dart';
import 'package:flutter_pga_assignment/home/business_logic/home_controller.dart';
import 'package:flutter_pga_assignment/home/presentation/home_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_pga_assignment/home/presentation/home_body_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: HomeBodyWidget(),
      ),
    );
  }
}
