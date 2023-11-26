import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:flutter/material.dart';

class ScheduleAppointmentWidget extends StatelessWidget {
  const ScheduleAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Colors.black87,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  'Today, 13/11/2023',
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.access_alarm,
                  color: Colors.black87,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  '02:00 PM',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                )
              ],
            ),
            Const.spaceSmall,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Const.primaryColor),
                    onPressed: () {},
                    child: Text(Lang.enText['reScheduleText'] ?? "Rechedule"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Text(
                      Lang.enText['cancelText'] ?? "Cancel",
                      style: TextStyle(color: Const.primaryColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
