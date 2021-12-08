import 'package:flutter/material.dart';
import 'package:flutter_pga_assignment/home/business_logic/home_controller.dart';
import 'package:flutter_pga_assignment/home/presentation/session_list_view_item.dart';
import 'package:get/get.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({Key? key}) : super(key: key);

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        _buildAvailableSessionsList(context),
        _buildBookedSessionsList(context),
      ],
    );
  }

  Widget _buildAvailableSessionsList(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _homeController.availableSessions.length,
        itemBuilder: (context, index) => SessionListViewItem(
          index,
          session: _homeController.availableSessions[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
    });
  }

  Widget _buildBookedSessionsList(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _homeController.bookedSessions.length,
        itemBuilder: (context, index) => SessionListViewItem(
          index,
          session: _homeController.bookedSessions[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
    });
  }
}
