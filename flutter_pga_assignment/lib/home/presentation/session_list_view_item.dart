import 'package:flutter/material.dart';
import 'package:flutter_pga_assignment/home/business_logic/home_controller.dart';
import 'package:flutter_pga_assignment/home/data/session.dart';
import 'package:flutter_pga_assignment/home/data/student_info.dart';
import 'package:flutter_pga_assignment/home/presentation/student_info_dialog.dart';
import 'package:get/get.dart';

class SessionListViewItem extends StatelessWidget {
  SessionListViewItem(
    this.index, {
    Key? key,
    required this.session,
  }) : super(key: key);

  final int index;
  final Session session;

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            color: Colors.black.withOpacity(0.125),
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      height: 100,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildTimeText(context),
          const SizedBox(width: 16),
          if (session.booked)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStudentNameText(context),
                const SizedBox(height: 4),
                _buildStudentPhoneNumberText(context),
              ],
            ),
          Expanded(child: Container()),
          if (session.booked)
            _buildCancelBookingButton(context)
          else
            _buildBookSessionButton(context),
        ],
      ),
    );
  }

  Widget _buildTimeText(BuildContext context) {
    return Text(session.time);
  }

  Widget _buildStudentNameText(BuildContext context) {
    return Text(session.studentInfo!.name);
  }

  Widget _buildStudentPhoneNumberText(BuildContext context) {
    return Text(session.studentInfo!.phoneNumber);
  }

  Widget _buildBookSessionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final studentInfo = await showDialog<StudentInfo?>(
          context: context,
          builder: (context) => StudentInfoDialog(),
        );
        if (studentInfo != null) {
          _homeController.bookSession(
            id: session.id,
            studentInfo: studentInfo,
          );
        }
      },
      child: const Text('Book Session'),
    );
  }

  Widget _buildCancelBookingButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
      onPressed: () {
        _homeController.cancelBookedSession(id: session.id);
      },
      child: const Text('Cancel Booking'),
    );
  }
}
