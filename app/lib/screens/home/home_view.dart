import 'package:app/screens/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          leading: GestureDetector(
            onTap: model.goToProfile,
            child: Icon(Icons.account_circle_outlined),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Screen'),
              ElevatedButton(
                  onPressed: model.goToWelcomeScreen, child: Text('Sign out'))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
