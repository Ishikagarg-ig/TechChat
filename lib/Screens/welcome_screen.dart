import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    
    controller
    =AnimationController(duration: Duration(seconds: 3), vsync:this, );

    //animation=CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation
    =ColorTween(begin: Colors.red[300],end: Colors.indigo[100]).animate(controller);

    controller.forward();

//    animation.addStatusListener((status){
//      if(status == AnimationStatus.completed){
//        controller.reverse(from: 1.0);
//      }
//      else if(status == AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });

    controller.addListener((){
      setState(() {});
      print(animation.value);
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 100.0,
                    ),
                  ),
                ),
//                SizedBox(
//                  width: 20.0,
//                ),
                TypewriterAnimatedTextKit(
                  text:[' Tech Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    //fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color:Colors.lightBlue[600],
                title: 'Log In',
                onPressed: (){Navigator.pushNamed(context,LoginScreen.id);},
                ),
            RoundedButton(
              color:Colors.lightBlue[700],
              title: 'Register',
              onPressed: (){Navigator.pushNamed(context,RegistrationScreen.id);},
            ),
          ],
        ),
      ),
    );
  }
}