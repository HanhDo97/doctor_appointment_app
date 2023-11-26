import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/layouts/main_layout.dart';
import 'package:doctor_appointment/screens/booking_screen.dart';
import 'package:doctor_appointment/screens/detail_screen.dart';
import 'package:doctor_appointment/screens/home_screen.dart';
import 'package:doctor_appointment/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Doctor Appointment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: Const.primaryColor,
            border: Const.outlinedBorder,
            focusedBorder: Const.focusBorder,
            errorBorder: Const.errorBorder,
            enabledBorder: Const.outlinedBorder,
            floatingLabelStyle: TextStyle(color: Const.primaryColor),
            prefixIconColor: Colors.black38,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Const.primaryColor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
                backgroundColor: MaterialStateProperty.all(Const.primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
          ),
          useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        'main': (context) => const MainLayout(),
        'doctor_detail': (context) => const DetailScreen(),
        'booking':(context)=> const BookingScreen()
      },
    );
  }
}
