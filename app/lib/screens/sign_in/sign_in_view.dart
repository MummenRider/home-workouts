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
          appBar: AppBar(
            title: Text('Sign In'),
          ),
          body: Form(
            key: _globalFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      ElevatedButton(
                        onPressed: () {
                          if (_globalFormKey.currentState.validate()) {
                            model.signIn(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim());
                          }
                        },
                        child: Text('Sign In'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[200]),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}
