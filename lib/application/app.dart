import 'package:flutter/material.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/utility/app_color.dart';

class AiChatBot extends StatelessWidget {
  const AiChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          colorSchemeSeed: AppColor.primaryColor,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                )
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                )
            ),
          ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xff303030)
          )
        )
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
