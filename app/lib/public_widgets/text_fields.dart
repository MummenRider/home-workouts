import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemplateTextField extends StatelessWidget {
  TemplateTextField(
      {Key key,
      @required TextEditingController controller,
      @required String textLabel,
      this.inputType,
      this.inputFormatters,
      this.maxLength})
      : _controller = controller,
        _textLabel = textLabel,
        super(key: key);

  final TextEditingController _controller;
  final String _textLabel;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLength;
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
      maxLength: maxLength ?? null,
    );
  }
}
