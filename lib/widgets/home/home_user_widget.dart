import 'package:doctor_appointment/core/notifiers/user_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeUserWidget extends StatefulWidget {
  const HomeUserWidget({super.key});

  @override
  State<HomeUserWidget> createState() => _HomeUserWidgetState();
}

class _HomeUserWidgetState extends State<HomeUserWidget> {
  late UserChangeNotifier userModel;

  @override
  void initState() {
    super.initState();
    userModel = Provider.of<UserChangeNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          userModel.user.name!,
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile1.jpg'),
          ),
        )
      ],
    );
  }
}
