import 'package:flutter_pga_assignment/home/data/session.dart';
import 'package:flutter_pga_assignment/home/data/student_info.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Session> sessions = [
    const Session(
      id: 1,
      time: '8:00 AM',
    ),
    const Session(
      id: 2,
      time: '8:30 AM',
    ),
    const Session(
      id: 3,
      time: '9:00 AM',
    ),
    const Session(
      id: 4,
      time: '9:30 AM',
    ),
    const Session(
      id: 5,
      time: '10:00 AM',
    ),
    const Session(
      id: 6,
      time: '10:30 AM',
    ),
    const Session(
      id: 7,
      time: '11:00 AM',
    ),
    const Session(
      id: 8,
      time: '11:30 AM',
    ),
    const Session(
      id: 9,
      time: '12:00 PM',
    ),
    const Session(
      id: 10,
      time: '12:30 PM',
    ),
    const Session(
      id: 11,
      time: '1:00 PM',
    ),
    const Session(
      id: 12,
      time: '1:30 PM',
    ),
    const Session(
      id: 13,
      time: '2:00 PM',
    ),
    const Session(
      id: 14,
      time: '2:30 PM',
    ),
    const Session(
      id: 15,
      time: '3:00 PM',
    ),
    const Session(
      id: 16,
      time: '3:30 PM',
    ),
  ].obs;

  List<Session> get availableSessions {
    return sessions.where((session) => !session.booked).toList();
  }

  List<Session> get bookedSessions {
    return sessions.where((session) => session.booked).toList();
  }

  void bookSession({
    required int id,
    required StudentInfo studentInfo,
  }) {
    sessions.value = sessions.map((session) {
      if (session.id == id) {
        return session.copyWith(
          booked: true,
          studentInfo: studentInfo,
        );
      } else {
        return session;
      }
    }).toList();
  }

  void cancelBookedSession({required int id}) {
    sessions.value = sessions.map((session) {
      if (session.id == id) {
        return session.copyWith(
          booked: false,
          studentInfo: null,
        );
      } else {
        return session;
      }
    }).toList();
  }
}
