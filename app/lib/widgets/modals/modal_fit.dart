import 'package:app/app/app.router.dart';
import 'package:app/widgets/modals/modal_will_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Upload an image'),
            leading: Icon(Icons.upload_sharp),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.addPostView);
            },
          ),
          ListTile(
            title: Text('Upload a video'),
            leading: Icon(Icons.videocam),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    ));
  }
}
