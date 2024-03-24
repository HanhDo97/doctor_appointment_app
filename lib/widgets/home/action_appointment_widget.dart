import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/config/lang.dart';
import 'package:flutter/material.dart';

class ActionAppointmentWidget extends StatelessWidget {
  final String dateMeet;
  final String timeMeet;
  const ActionAppointmentWidget(
      {super.key, required this.dateMeet, required this.timeMeet});

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  'Today, ' + dateMeet,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.access_alarm,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  timeMeet,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
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
