import 'package:doctor_appointment/config/lang.dart';
import 'package:doctor_appointment/screens/appointment_screen.dart';
import 'package:doctor_appointment/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    int _currentPage = 0;
    final PageController _page = PageController();
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            _currentPage = value;
          });
        }),
        children: const [HomeScreen(), AppointmentScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (page) {
          setState(() {
            _currentPage = page;
            _page.animateToPage(page,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCirc);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.other_houses, color: Colors.black38,),
            label: Lang.enText['homeTLayoutText'] ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month, color: Colors.black38,),
            label: Lang.enText['appointmentLayoutText'] ?? 'Apointments',
          )
        ],
      ),
    );
  }
}
