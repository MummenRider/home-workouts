import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalWillScope extends StatelessWidget {
  ModalWillScope({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
      onWillPop: () async {
        bool shouldClose = true;
        await showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
                  title: Text('Discard changes?'),
                  actions: <Widget>[
                    CupertinoButton(
                      child: Text('Yes'),
                      onPressed: () {
                        shouldClose = true;
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('No'),
                      onPressed: () {
                        shouldClose = false;
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
        return shouldClose;
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Add new story'),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () => print('add'),
            child: Text('Select Image'),
          ),
        ),
      ),
    ));
  }
}
