import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitleText(context),
      bottom: _buildBottomTabBar(context),
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Text(_date);
  }

  PreferredSizeWidget _buildBottomTabBar(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          text: 'Available Sessions',
        ),
        Tab(
          text: 'Booked Sessions',
        ),
      ],
    );
  }

  String get _date {
    final now = DateTime.now();
    final dateFormat = DateFormat(DateFormat.YEAR_MONTH_DAY);

    return dateFormat.format(now);
  }
}
