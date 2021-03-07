import 'package:app/models/user_account.dart';
import 'package:app/screens/profile_edit/user_profile_edit_viewmodel.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:stacked/stacked.dart';

class UserProfileEditView extends StatelessWidget {
  final UserAccount account;
  UserProfileEditView({this.account});
  final _globalFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileEditViewModel>.reactive(
      viewModelBuilder: () => UserProfileEditViewModel(),
      onModelReady: (model) {
        _firstNameController.text = account?.firstName ?? '';
        _lastNameController.text = account?.lastName ?? '';
        _emailController.text = account?.email ?? '';
        _phoneNumberController.text = account?.phoneNumber ?? '';
        model.setUserProfile(account);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                          model.saveUserAccount(
                            fname: _firstNameController.text.trim(),
                            lname: _lastNameController.text.trim(),
                            email: _emailController.text.trim(),
                            phoneNumber: _phoneNumberController.text.trim(),
                          );
                        }
                      },
                      child: Text('Save'),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.purple[200]),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
