import 'package:app/screens/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.hasLoggedInBefore(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Start'),
        ),
        body: Text('Hello'),
      ),
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
