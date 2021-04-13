import 'package:app/models/user_account.dart';
import 'package:app/public_widgets/busy_overlay.dart';
import 'package:app/public_widgets/text_form_field.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:stacked/stacked.dart';

import 'add_post_viewmodel.dart';

class AddPostView extends StatelessWidget {
  final UserAccount userAccount;
  const AddPostView({Key key, @required this.userAccount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalFormKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    return ViewModelBuilder<AddPostViewModel>.reactive(
      builder: (context, model, child) => BusyOverlayScreen(
        show: model.isBusy,
        child: Scaffold(
          body: Form(
            key: _globalFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFD2FBD2),
                      Color(0xFFA9F8F8),
                    ], begin: Alignment.topCenter),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => model.cancelPost()),
                          Text(
                            'STORIES',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: 1.2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: IconButton(
                                  icon: Icon(Entypo.paper_plane),
                                  onPressed: () {
                                    if (_globalFormKey.currentState
                                        .validate()) {
                                      model.uploadImage(
                                        title: _titleController.text,
                                        description:
                                            _descriptionController.text,
                                        author:
                                            '${userAccount.firstName} ${userAccount.lastName}',
                                        datePosted: formatDate(
                                          DateTime.now(),
                                          [yyyy, '-', mm, '-', dd],
                                        ),
                                      );
                                    } else {
                                      print('oopsie');
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 30,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TemplateFormField(
                                          controller: _titleController,
                                          icon: Icons.title_sharp,
                                          inputType: TextInputType.text,
                                          hintText: 'Title',
                                          textSize: 20,
                                        ),
                                      ),
                                      Container(
                                        width: 280,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TemplateFormField(
                                              controller:
                                                  _descriptionController,
                                              icon: Typicons.edit,
                                              inputType: TextInputType.text,
                                              hintText: 'Add caption',
                                              textSize: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.selectImage(),
                              child: Card(
                                margin: EdgeInsets.symmetric(horizontal: 0),
                                elevation: 4,
                                child: Container(
                                  height: 300.0,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey[300],
                                  child: model.selectedImage == null
                                      ? Center(
                                          child: Text(
                                            'Tap to add post image',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 25),
                                          ),
                                        )
                                      : Image.file(
                                          model.selectedImage,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddPostViewModel(),
    );
  }
}
