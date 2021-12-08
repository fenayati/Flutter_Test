import 'package:flutter/material.dart';
import 'package:flutter_pga_assignment/home/business_logic/student_info_controller.dart';
import 'package:flutter_pga_assignment/home/data/student_info.dart';
import 'package:get/get.dart';

class StudentInfoDialog extends StatelessWidget {
  StudentInfoDialog({Key? key}) : super(key: key);

  final _studentInfoController = Get.put(StudentInfoController());

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      title: _buildTitleText(context),
      children: [
        _buildNameField(context),
        const SizedBox(height: 16),
        _buildPhoneNumberField(context),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSubmitButton(context),
            const SizedBox(width: 16),
            _buildDiscardButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return const Text('Student Info');
  }

  Widget _buildNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Name',
      ),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        _studentInfoController.changeName(value);
      },
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Phone Number',
      ),
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        _studentInfoController.changePhoneNumber(value);
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.green,
        ),
      ),
      onPressed: () {
        Navigator.pop(
          context,
          StudentInfo(
            name: _studentInfoController.name.value,
            phoneNumber: _studentInfoController.phoneNumber.value,
          ),
        );
      },
      child: const Text('Submit'),
    );
  }

  Widget _buildDiscardButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.red,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Discard'),
    );
  }
}
