import 'package:app/models/user_account.dart';
import 'package:app/public_widgets/busy_overlay.dart';
import 'package:app/public_widgets/circular_btn.dart';
import 'package:app/public_widgets/text_fields.dart';
import 'package:app/public_widgets/text_form_field.dart';
import 'package:app/screens/profile_edit/user_profile_edit_viewmodel.dart';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:stacked/stacked.dart';

class UserProfileEditView extends StatelessWidget {
  final UserAccount account;

  UserProfileEditView({@required this.account});
  final _globalFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _aboutMeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileEditViewModel>.reactive(
      viewModelBuilder: () => UserProfileEditViewModel(),
      onModelReady: (model) {
        _firstNameController.text = account?.firstName ?? '';
        _lastNameController.text = account?.lastName ?? '';
        _emailController.text = account?.email ?? '';
        _phoneNumberController.text = account?.phoneNumber ?? '';
        _aboutMeController.text = account?.aboutMe ?? '';
        model.setUserProfile(account);
      },
      builder: (context, model, child) => BusyOverlayScreen(
        show: model.isBusy,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => model.cancelEditProfile(),
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          body: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Editting Account',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: model.selectedImage == null
                              ? ExtendedImage.network(
                                  model.accounts.displayProfileURL,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                  shape: BoxShape.circle,
                                  loadStateChanged: (ExtendedImageState state) {
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
                                      return SpinKitPouringHourglass(
                                          color: Colors.teal);
                                    } else {
                                      return null;
                                    }
                                  },
                                )
                              : ExtendedImage.file(
                                  model.selectedImage,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                  shape: BoxShape.circle,
                                  loadStateChanged: (ExtendedImageState state) {
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
                                      return SpinKitPouringHourglass(
                                          color: Colors.teal);
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                (LineariconsFree.upload),
                                size: 23,
                              ),
                              onPressed: () => model.selectImage(),
                            ),
                            const SizedBox(
                              height: 13.0,
                            ),
                            IconButton(
                              icon: Icon(
                                (LineariconsFree.trash),
                                size: 23,
                                color: Colors.red[700],
                              ),
                              onPressed: () => model.selectImage(),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Information',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 350.0,
                  padding: const EdgeInsets.only(left: 15),
                  child: Form(
                    key: _globalFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TemplateFormField(
                              controller: _firstNameController,
                              icon: LineariconsFree.user_1,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TemplateFormField(
                              controller: _lastNameController,
                              icon: LineariconsFree.user_1,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TemplateFormField(
                              controller: _emailController,
                              icon: FontAwesome.mail,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  //  when the TextFormField in unfocused
                                ),
                                prefixIcon: Icon(
                                  LineariconsFree.phone,
                                  color: Colors.teal,
                                  size: 18,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                PhoneInputFormatter(),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_globalFormKey.currentState.validate()) {
                          model.saveUserAccount(
                            fname: _firstNameController.text.trim(),
                            lname: _lastNameController.text.trim(),
                            aboutMe: _aboutMeController.text.trim(),
                            email: _emailController.text.trim(),
                            phoneNumber: _phoneNumberController.text.trim(),
                          );
                        }
                      },
                      child: CircularButton(
                        textLabel: 'SAVE',
                        color: Colors.teal,
                        width: 250,
                        textSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
