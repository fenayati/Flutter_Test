import 'package:flutter_pga_assignment/home/data/student_info.dart';

class Session {
  const Session({
    required this.id,
    required this.time,
    this.booked = false,
    this.studentInfo,
  });

  final int id;
  final String time;
  final bool booked;
  final StudentInfo? studentInfo;

  Session copyWith({
    int? id,
    String? time,
    bool? booked,
    StudentInfo? studentInfo,
  }) {
    return Session(
      id: id ?? this.id,
      time: time ?? this.time,
      booked: booked ?? this.booked,
      studentInfo: studentInfo ?? this.studentInfo,
    );
  }
}
