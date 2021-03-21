import 'package:app/models/user_account.dart';
import 'package:app/screens/profile_edit/user_profile_edit_viewmodel.dart';
import 'package:app/widgets/busy_overlay.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:stacked/stacked.dart';

class UserProfileEditView extends StatelessWidget {
  final UserAccount account;

  UserProfileEditView({@required this.account});
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
      builder: (context, model, child) => BusyOverlayScreen(
        show: model.isBusy,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => model.cancelEditProfile()),
          ),
          body: Form(
            key: _globalFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // GestureDetector(
                      //   onTap: () => model.selectImage(),
                      //   child: ExtendedImage.network(
                      //     model.imageUrl,
                      //     width: 120,
                      //     height: 120,
                      //     fit: BoxFit.cover,
                      //     border: Border.all(color: Colors.grey[800], width: 3.0),
                      //     shape: BoxShape.circle,
                      //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      // loadStateChanged: (ExtendedImageState state) {
                      //   if (state.extendedImageLoadState ==
                      //       LoadState.failed) {
                      //     return Container(
                      //       decoration: BoxDecoration(
                      //         color: Colors.grey[300],
                      //         borderRadius: BorderRadius.circular(50),
                      //       ),
                      //       width: 100,
                      //       height: 100,
                      //       child: Icon(
                      //         Icons.camera_alt,
                      //         color: Colors.grey[800],
                      //       ),
                      //     );
                      //   } else if (state.extendedImageLoadState ==
                      //       LoadState.loading) {
                      //     return Image.asset(
                      //       'assets/loading.gif',
                      //       scale: .5,
                      //       fit: BoxFit.contain,
                      //     );
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () => model.selectImage(),
                        child: CircleAvatar(
                          child: model.selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: ExtendedImage.file(
                                    model.selectedImage,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    loadStateChanged:
                                        (ExtendedImageState state) {
                                      if (state.extendedImageLoadState ==
                                          LoadState.failed) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          width: 100,
                                          height: 100,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey[800],
                                          ),
                                        );
                                      } else if (state.extendedImageLoadState ==
                                          LoadState.loading) {
                                        return Image.asset(
                                          'assets/loading.gif',
                                          scale: .5,
                                          fit: BoxFit.contain,
                                        );
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                          radius: 53.0,
                          backgroundColor: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 50),
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
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[200]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
