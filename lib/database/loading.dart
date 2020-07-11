import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: SpinKitRotatingPlain(
             color: Colors.black54,
              size: 80.0,
           ),
        ),
    );
  }
}
