import 'package:app/models/new_story.dart';
import 'package:app/public_widgets/circular_btn.dart';
import 'package:app/public_widgets/text_fields.dart';
import 'package:app/screens/story_edit/edit_story_viewmodel.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditStoryView extends StatelessWidget {
  final Story story;
  const EditStoryView({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalFormKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    return ViewModelBuilder<EditStoryViewModel>.reactive(
      onModelReady: (model) {
        _titleController.text = story?.title ?? '';
        _descriptionController.text = story?.description ?? '';
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Update Post',
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
                      maxLength: 25,
                    ),
                    const SizedBox(height: 16),
                    TemplateTextField(
                      controller: _descriptionController,
                      textLabel: 'Description',
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      // When we tap we call selectImage
                      onTap: () => model.selectImage(),
                      child: Container(
                        height: 150,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(1)),
                        alignment: Alignment.center,
                        // If the selected image is null we show "Tap to add post image"
                        child: model.selectedImage == null
                            ? Image.network(story.imageURL)
                            // If we have a selected image we want to show it
                            : Image.file(model.selectedImage),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        if (_globalFormKey.currentState.validate()) {
                          model.uploadImage(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            author: story.author,
                            storyId: story.storyId,
                            imageUrl: story.imageURL,
                            datePosted: formatDate(
                              DateTime.now(),
                              [yyyy, '-', mm, '-', dd],
                            ),
                          );
                        }
                      },
                      child: CircularButton(
                          textLabel: 'Update Post', color: Colors.teal[400]),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => EditStoryViewModel(),
    );
  }
}
