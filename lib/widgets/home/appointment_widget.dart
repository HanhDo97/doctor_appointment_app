import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/services/data_service.dart';
import 'package:doctor_appointment/widgets/home/action_appointment_widget.dart';
import 'package:doctor_appointment/widgets/home/home_doctor_widget.dart';
import 'package:flutter/material.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({
    super.key,
  });

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  final DataService dataService = DataService();

  List<dynamic> appointments = [];

  @override
  void initState() {
    super.initState();

    // Get top doctors
    getTodayAppointments(context);
  }

  Future getTodayAppointments(BuildContext context) async {
    try {
      final response = await dataService.getTodayAppointments();
      setState(() {
        appointments = response.data;
      });
    } catch (e) {
      print('Get appointments error: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Const.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  HomeDoctorWidget(),
                  Const.spaceSmall,
                  ActionAppointmentWidget()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
