import 'package:flutter/material.dart';

import 'coffeepage.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

const TextStyle textTop = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const TextStyle textTop2 = TextStyle(fontSize: 20);

class _WelcomePageState extends State<WelcomePage> {
// *********************************Method*****************************************\\
  Widget showLogo() {
    return SizedBox(
        width: 120,
        height: 120,
        child: Image.asset('images/icon/logo/LogoCoffee.png'));
  }

  Widget showWelcome() {
    return SizedBox(
        width: 1200,
        height: 350,
        child: Image.asset('images/icon/logo/welcome.png'));
  }

  Widget getstartButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 88, 70, 50),
          fixedSize: const Size(120, 50),
          primary: const Color.fromARGB(255, 88, 70, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PageCoffee()));
        },
        child: const Text(
          'Get Started',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ));
  }

// *********************************Method*****************************************\\
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Choose From Our Best Menu",
                  style: textTop,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'we will make your coffee on order.',
                  style: textTop2,
                ),
                const SizedBox(
                  height: 10,
                ),
                showWelcome(),
                const SizedBox(
                  height: 10,
                ),
                getstartButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
