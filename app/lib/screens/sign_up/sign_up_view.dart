import 'package:app/screens/sign_up/sign_up_viewmodel.dart';
import 'package:app/widgets/busy_overlay.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final _globalFormKey = GlobalKey<FormState>();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _phoneNumberController = TextEditingController();

    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => BusyOverlayScreen(
        show: model.isBusy,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sign In'),
          ),
          body: Form(
            key: _globalFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TemplateTextField(
                        controller: _firstNameController,
                        textLabel: 'First Name',
                      ),
                      const SizedBox(height: 16),
                      TemplateTextField(
                        controller: _lastNameController,
                        textLabel: 'Last Name',
                      ),
                      const SizedBox(height: 16),
                      TemplateTextField(
                        controller: _emailController,
                        textLabel: 'Email address',
                      ),
                      const SizedBox(height: 16),
                      TemplateTextField(
                        controller: _passwordController,
                        textLabel: 'Password',
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          PhoneInputFormatter(),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (_globalFormKey.currentState.validate()) {
                            model.signUp(
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              emailAddress: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              phoneNumber: _phoneNumberController.text.trim(),
                            );
                          }
                        },
                        child: Text('Sign Up'),
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
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
