import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'add_page.dart';
import 'homepage.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeRight,
  //   DeviceOrientation.landscapeLeft,
  //   // DeviceOrientation.portraitUp,
  //   // DeviceOrientation.portraitDown,
  // ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}