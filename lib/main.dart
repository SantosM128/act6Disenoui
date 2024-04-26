import 'package:flutter/material.dart';
import 'package:santos0415/pantalla0415/inicio_screen.dart';

void main(List<String> args) {
  runApp(MyApp0415());
}

class MyApp0415 extends StatelessWidget {
  const MyApp0415({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InicioScreen(),
    );
  }
}
