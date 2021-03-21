import 'package:app/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_post_viewmodel.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalFormKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    return ViewModelBuilder<AddPostViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Add post',
              style: TextStyle(color: Colors.black87),
            ),
            leading: GestureDetector(
              onTap: () => model.cancelPost(),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black87,
                  ),
                ),
              ),
            )),
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
                      controller: _titleController,
                      textLabel: 'Title',
                    ),
                    const SizedBox(height: 16),
                    TemplateTextField(
                      controller: _descriptionController,
                      textLabel: 'Description',
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: GestureDetector(
                        // When we tap we call selectImage
                        onTap: () => model.selectImage(),
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          // If the selected image is null we show "Tap to add post image"
                          child: model.selectedImage == null
                              ? Text(
                                  'Tap to add post image',
                                  style: TextStyle(color: Colors.grey[400]),
                                )
                              // If we have a selected image we want to show it
                              : Image.file(model.selectedImage),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_globalFormKey.currentState.validate()) {
                          model.uploadImage(
                              title: _titleController.text,
                              description: _descriptionController.text);
                        }
                      },
                      child: Text('Add Post'),
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
      viewModelBuilder: () => AddPostViewModel(),
    );
  }
}