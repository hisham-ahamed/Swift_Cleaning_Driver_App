import 'dart:convert';

import 'package:driverapp/config/constants.dart';
import 'package:driverapp/config/url.dart';
import 'package:driverapp/models/driver-model.dart';
import 'package:driverapp/models/global-data.dart';
import 'package:driverapp/models/login-data.dart';
import 'package:driverapp/screens/home-screen.dart';
import 'package:driverapp/services/http-functions.dart';
import 'package:driverapp/services/screen-service.dart';
import 'package:driverapp/services/snackbar-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String userName;
  late String password;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Screen.height * 0.08),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(200.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      width: 106.0,
                      height: 106.0,
                    ),
                  ),
                ),
                SizedBox(height: Screen.height * 0.08),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: kPrimaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Enter your credential to continue',
                  style: kSubTitle,
                ),
                SizedBox(height: Screen.height * 0.065),
                TextField(
                  obscureText: false,
                  onChanged: (username) {
                    this.userName = username;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    hintText: 'Username',
                    hintStyle: kSubTitle,
                    prefixIcon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: Screen.height * 0.05),
                TextField(
                  obscureText: true,
                  onChanged: (password) {
                    this.password = password;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    hintText: 'Password',
                    hintStyle: kSubTitle,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: Screen.height * 0.035),
                Row(
                  children: [
                    Text(
                      'Remember Next time',
                      style: kSubTitle,
                    ),
                    Spacer(),
                    Checkbox(value: true, onChanged: (value) {})
                  ],
                ),
                SizedBox(height: Screen.height * 0.022),
                Visibility(
                  visible: !visible,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        this.visible = true;
                      });
                      final _storage = FlutterSecureStorage();
                      LoginRequest _body = LoginRequest(
                          phoneNumber: userName, password: password);
                      LoginResponse response =
                          await DriverFunctions.getStaffDetails(
                              Url.driverLogin, _body);
                      setState(() {
                        this.visible = false;
                      });
                      if (response.status) {
                        SnackBarService.success(
                            context: context, message: response.message);
                        await _storage.write(
                            key: 'Driver',
                            value: jsonEncode(DriverToJson.toJson(
                                response.driver as Driver)));
                        GlobalData.driver = response.driver;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else
                        SnackBarService.alert(
                            context: context, message: response.message);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: kPrimaryColor,
                      ),
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: Screen.height * 0.065,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: kPrimaryColor,
                    ),
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    height: Screen.height * 0.065,
                    child: Center(
                      child: Text(
                        'Loading..',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Screen.height * 0.02),
                Text(
                  'Forgot Password ? Contact Admin',
                  style: kSubTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
