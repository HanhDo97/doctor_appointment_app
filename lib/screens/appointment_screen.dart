import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/widgets/appointment/schedule_appointment_widget.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentScreenState extends State<AppointmentScreen> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<dynamic> schedules = [
      {
        "doctor_name": "Doctor name 1",
        "doctor_profile": "assets/images/doctor_2.jpg",
        "category": "Dental",
        "status": FilterStatus.upcoming,
      },
      {
        "doctor_name": "Doctor name 2",
        "doctor_profile": "assets/images/doctor_3.jpg",
        "category": "Cardiology",
        "status": FilterStatus.complete,
      },
      {
        "doctor_name": "Doctor name 3",
        "doctor_profile": "assets/images/doctor_4.jpg",
        "category": "Respiration",
        "status": FilterStatus.complete,
      },
      {
        "doctor_name": "Doctor name 4",
        "doctor_profile": "assets/images/doctor_5.jpg",
        "category": "General",
        "status": FilterStatus.cancel,
      }
    ];
    List<dynamic> filterSchedule = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Const.spaceSmall,
            buildFilterStack(),
            Expanded(
                child: ListView.builder(
              itemCount: filterSchedule.length,
              itemBuilder: (context, index) {
                var _schedule = filterSchedule[index];
                return Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(_schedule['doctor_profile']),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _schedule['doctor_name'] ?? 'Doctor Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(_schedule['category'] ?? 'Doctor category')
                              ],
                            )
                          ],
                        ),
                        Const.spaceSmall,
                        ScheduleAppointmentWidget()
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget buildFilterStack() {
    String capitalize(String s) {
      if (s == null || s.isEmpty) {
        return s;
      }
      return s[0].toUpperCase() + s.substring(1);
    }

    return Stack(
      children: [
        Container(
          width: Const.mediaWidth,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              for (FilterStatus filterStatus in FilterStatus.values)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (filterStatus == FilterStatus.upcoming) {
                          status = FilterStatus.upcoming;
                          _alignment = Alignment.centerLeft;
                        } else if (filterStatus == FilterStatus.complete) {
                          status = FilterStatus.complete;
                          _alignment = Alignment.center;
                        } else if (filterStatus == FilterStatus.cancel) {
                          status = FilterStatus.cancel;
                          _alignment = Alignment.centerRight;
                        }
                      });
                    },
                    child: Center(child: Text(capitalize(filterStatus.name))),
                  ),
                ),
            ],
          ),
        ),
        AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Const.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                status.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
