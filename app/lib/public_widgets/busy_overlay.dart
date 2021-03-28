import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BusyOverlayScreen extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;

  const BusyOverlayScreen({
    this.child,
    this.title = 'Loading...',
    this.show = false,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: <Widget>[
          child,
          IgnorePointer(
            child: Opacity(
                opacity: show ? .6 : 0.0,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  alignment: Alignment.center,
                  color: Colors.white10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SpinKitPouringHourglass(color: Colors.black),
                      Text(title,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
