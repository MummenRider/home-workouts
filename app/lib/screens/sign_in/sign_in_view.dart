import 'package:app/config/color_palette.dart';
import 'package:app/public_widgets/busy_overlay.dart';
import 'package:app/public_widgets/text_fields.dart';
import 'package:app/screens/sign_in/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalFormKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    return ViewModelBuilder<SignInViewModel>.nonReactive(
      builder: (context, model, child) => BusyOverlayScreen(
        show: model.isBusy,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: Form(
                              key: _globalFormKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Column(
                                  children: [
                                    TemplateTextField(
                                      controller: _emailController,
                                      textLabel: 'Email address',
                                    ),
                                    const SizedBox(height: 16),
                                    TemplateTextField(
                                      controller: _passwordController,
                                      textLabel: 'Password',
                                      obsecureText: true,
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      width: 200,
                                      height: 45,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          if (_globalFormKey.currentState
                                              .validate()) {
                                            model.signIn(
                                                email: _emailController.text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim());
                                          }
                                        },
                                        child: Text(
                                          'SIGN IN',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: ColorPalette.buttonColor),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          side: BorderSide(
                                              width: 3.0,
                                              color: ColorPalette.buttonColor),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text('No account yet?'),
                                        TextButton(
                                          child: Text(
                                            "Press to create one",
                                            style:
                                                TextStyle(color: Colors.teal),
                                          ),
                                          onPressed: () => model.goToSignUp(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}


/*

Form(
                    key: _globalFormKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          TemplateTextField(
                            controller: _emailController,
                            textLabel: 'Email address',
                          ),
                          const SizedBox(height: 16),
                          TemplateTextField(
                            controller: _passwordController,
                            textLabel: 'Password',
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: 200,
                            height: 45,
                            child: OutlinedButton(
                              onPressed: () {
                                if (_globalFormKey.currentState.validate()) {
                                  model.signIn(
                                      email: _emailController.text.trim(),
                                      password:
                                          _passwordController.text.trim());
                                }
                              },
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: ColorPalette.buttonColor),
                              ),
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 3.0,
                                    color: ColorPalette.buttonColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
 */