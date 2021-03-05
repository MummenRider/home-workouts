import 'package:app/screens/welcome/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lets Get Physical'),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Text('Sign In'),
                      onPressed: () => model.goToSignInScreen(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Text('Sign Up'),
                      onPressed: () => model.goToSignUpScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => WelcomeViewModel(),
    );
  }
}
