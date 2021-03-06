import 'package:flutter/material.dart';

class TemplateTextField extends StatelessWidget {
  TemplateTextField({
    Key key,
    @required TextEditingController controller,
    @required String textLabel,
  })  : _controller = controller,
        _textLabel = textLabel,
        super(key: key);

  final TextEditingController _controller;
  final String _textLabel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String value) =>
          value.isEmpty ? '$_textLabel should not be empty' : null,
      decoration: InputDecoration(
        labelText: _textLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      controller: _controller,
    );
  }
}
