import 'package:flutter/material.dart';
import 'package:work_ex1/Database/coffeedatabase.dart';
import './Page/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CoffeeDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
