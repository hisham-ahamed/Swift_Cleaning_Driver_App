import 'package:flutter/material.dart';

class SnackBarService {
  static void _boilerPlate(
      {required BuildContext context,
      required String message,
      Color? color,
      IconData? iconData}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        duration: Duration(seconds: 2),
        content: Row(
          children: [
            Icon(
              iconData,
              color: color,
            ),
            SizedBox(width: 5.0),
            Text(
              message,
              style: TextStyle(color: color, fontSize: 17.0),
            ),
          ],
        ),
      ),
    );
  }

//   static void _initBoilerPlate(
//       {required GlobalKey<ScaffoldState> key,
//         required String message,
//         Color? color,
//         IconData? iconData}) {
//     key.currentState.showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.white.withOpacity(0.8),
//         duration: Duration(seconds: 2),
//         content: Row(
//           children: [
//             Icon(
//               iconData,
//               color: color,
//             ),
//             SizedBox(width: 5.0),
//             Text(
//               message,
//               style: TextStyle(color: color, fontSize: 17.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
  static void success(
      {required BuildContext context, required String message}) {
    _boilerPlate(
        context: context,
        message: message,
        color: Colors.green,
        iconData: Icons.verified);
  }

  static void warning(
      {required BuildContext context, required String message}) {
    _boilerPlate(
        context: context,
        message: message,
        color: Colors.orange,
        iconData: Icons.warning);
  }

//
  static void alert({required BuildContext context, required String message}) {
    _boilerPlate(
        context: context,
        message: message,
        color: Colors.red,
        iconData: Icons.error);
  }
//
//   static void initSuccess(
//       {@required GlobalKey<ScaffoldState> key, @required String message}) {
//     _initBoilerPlate(
//         key: key,
//         message: message,
//         color: Colors.green,
//         iconData: Icons.verified);
//   }
//
//   static void initWarning(
//       {@required GlobalKey<ScaffoldState> key, @required String message}) {
//     _initBoilerPlate(
//         key: key,
//         message: message,
//         color: Colors.orange,
//         iconData: Icons.warning);
//   }
//
//   static void initAlert(
//       {@required GlobalKey<ScaffoldState> key, @required String message}) {
//     _initBoilerPlate(
//         key: key, message: message, color: Colors.red, iconData: Icons.error);
//   }
}
