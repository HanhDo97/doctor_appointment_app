import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/widgets/booking/booking_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    Const.init(context);
    return Scaffold(
        appBar: BookingAppBar(
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: Container(
          width: Const.mediaWidth,
          height: Const.mediaHeight,
          child: Column(
            children: [
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.now(),
                lastDay: DateTime(2024, 12, 31),
                calendarFormat: _format,
                currentDay: _currentDay,
                rowHeight: 40,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(
                    color: Const.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.red),
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                onDaySelected: (selectedDay, focusedDay) => {
                  setState(() {
                    _currentDay = selectedDay;
                    _focusedDay = focusedDay;
                    _dateSelected = true;
                    if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
                      _isWeekend = true;
                      _timeSelected = false;
                      _currentIndex = null;
                    } else {
                      _isWeekend = false;
                    }
                  })
                },
              ),
              _isWeekend
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      child: Text(
                        'Weekend is not available, please select another date',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                  _timeSelected = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _currentIndex == index
                                            ? Colors.white
                                            : Colors.black),
                                    borderRadius: BorderRadius.circular(15),
                                    color: _currentIndex == index
                                        ? Const.primaryColor
                                        : null),
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _currentIndex == index
                                          ? Colors.white
                                          : null),
                                ),
                              ),
                            );
                          }),
                    ),
              Center(
                child: Container(
                  height: 50,
                  width: Const.mediaWidth,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('booking_success');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Const.primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                    ),
                    child: Text(
                      'Make an appointment',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
