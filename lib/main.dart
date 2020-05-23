import 'package:flutter/material.dart';
import 'package:flash_chat/Screens/welcome_screen.dart';
import 'package:flash_chat/Screens/login_screen.dart';
import 'package:flash_chat/Screens/registration_screen.dart';
import 'package:flash_chat/Screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      },
    );
  }
}
