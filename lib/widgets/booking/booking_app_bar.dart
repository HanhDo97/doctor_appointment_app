import 'package:flutter/material.dart';
import 'package:doctor_appointment/config/const.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBack;

  const BookingAppBar({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Appointment',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Container(
        decoration: BoxDecoration(
          color: Const.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          hoverColor: Const.primaryColor,
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
