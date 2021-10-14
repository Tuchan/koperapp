import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:koperapp/screens/home/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.switch_account),
            onPressed: () {
              LoginScreen();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.workWeek,
          firstDayOfWeek: 1,
          timeSlotViewSettings: TimeSlotViewSettings(
              nonWorkingDays: <int>[DateTime.sunday, DateTime.saturday]),
        ),
      ),
    );
  }
}
