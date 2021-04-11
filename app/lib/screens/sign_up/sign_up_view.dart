import 'package:app/config/color_palette.dart';
import 'package:app/public_widgets/busy_overlay.dart';
import 'package:app/public_widgets/text_fields.dart';
import 'package:app/screens/sign_up/sign_up_viewmodel.dart';
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
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                                      textLabel: 'Email Address',
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
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        PhoneInputFormatter(),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
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
                                        onPressed: () => {
                                          if (_globalFormKey.currentState
                                              .validate())
                                            {
                                              model.signUp(
                                                firstName: _firstNameController
                                                    .text
                                                    .trim(),
                                                lastName: _lastNameController
                                                    .text
                                                    .trim(),
                                                emailAddress: _emailController
                                                    .text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                                phoneNumber:
                                                    _phoneNumberController.text
                                                        .trim(),
                                              )
                                            }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorPalette.buttonColor,
                                          onPrimary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Already have an account?'),
                                        TextButton(
                                          child: Text(
                                            "Sign In",
                                            style:
                                                TextStyle(color: Colors.teal),
                                          ),
                                          onPressed: () =>
                                              model.goToSignInScreen(),
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
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}


/*


 */