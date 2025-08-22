import 'package:flutter/material.dart';
import 'package:personal_expense_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: Colors.purpleAccent,
              brightness: Brightness.light,
            ).copyWith(
              primary: Colors.purple,
              secondary: Colors.black, // override if needed
            ),
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors
                .purple, // fixed (was Theme.of(context).colorScheme.primary)
          ),
          titleSmall: const TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.grey, // fixed (was Theme.of(context)...)
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white, // ensures consistent white icons/text
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      home: HomeScreen(),
    );
  }
}
