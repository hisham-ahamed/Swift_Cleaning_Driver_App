import 'dart:convert';

import 'package:driverapp/models/driver-model.dart';
import 'package:driverapp/models/global-data.dart';
import 'package:driverapp/screens/home-screen.dart';
import 'package:driverapp/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _storage = FlutterSecureStorage();

  @override
  void initState() {
    initStatesFn();
    super.initState();
  }

  Future<void> initStatesFn() async {
    String? _data = await _storage.read(key: 'Driver');
    if (_data != null) {
      Map<String, dynamic> json = jsonDecode(_data);
      GlobalData.driver = Driver.fromJson(json);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
