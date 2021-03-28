import 'package:app/config/color_palette.dart';
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
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage("assets/lgp_logo.png"),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () => model.goToSignInScreen(),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: ColorPalette.buttonColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              width: 3.0, color: ColorPalette.buttonColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        onPressed: () => model.goToSignUpScreen(),
                        style: ElevatedButton.styleFrom(
                          primary: ColorPalette.buttonColor,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
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
