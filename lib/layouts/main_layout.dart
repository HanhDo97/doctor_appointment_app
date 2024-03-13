import 'package:doctor_appointment/config/lang.dart';
import 'package:doctor_appointment/core/exceptions/unauthenticated_exception.dart';
import 'package:doctor_appointment/core/notifiers/user_change_notifier.dart';
import 'package:doctor_appointment/core/widgets/messages/dialog_show_error.dart';
import 'package:doctor_appointment/screens/appointment_screen.dart';
import 'package:doctor_appointment/screens/home_screen.dart';
import 'package:doctor_appointment/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  dynamic _userData;
  int _currentPage = 0;
  final PageController _page = PageController();
  final UserService userService = UserService();
  bool isTokenValid = false;

  @override
  void initState() {
    super.initState();

    // get user info
    getUserInformation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            _currentPage = value;
          });
        }),
        // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
        children: [HomeScreen(), const AppointmentScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
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
            icon: const Icon(Icons.other_houses),
            label: Lang.enText['homeTLayoutText'] ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.calendar_month,
            ),
            label: Lang.enText['appointmentLayoutText'] ?? 'Apointments',
          )
        ],
      ),
    );
  }

  Future getUserInformation(context) async {
    final userModel = Provider.of<UserChangeNotifier>(context, listen: false);

    try {
      await userService.getUserInformation().then((response) {
        setState(() {
          userModel.setUser(response.data['user']);
        });
      });
    } on UnauthenticatedException catch (e) {
      Navigator.of(context).pushNamed('/');
      DialogShowError.show(context, e.toString());
    }
  }
}
