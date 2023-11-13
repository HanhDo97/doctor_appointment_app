import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:flutter/material.dart';

class ActionAppointmentWidget extends StatelessWidget {
  const ActionAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
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
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  'Today, 13/11/2023',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.access_alarm,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  '02:00 PM',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                )
              ],
            ),
            Const.spaceSmall,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: Text(Lang.enText['acceptText'] ?? "Accept"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: Text(Lang.enText['rejectText'] ?? "Reject"),
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
