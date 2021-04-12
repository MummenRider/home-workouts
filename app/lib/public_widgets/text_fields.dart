import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TemplateTextField extends StatelessWidget {
  TemplateTextField(
      {Key key,
      @required TextEditingController controller,
      @required String textLabel,
      this.obsecureText = false,
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
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      validator: (String value) =>
          value.isEmpty ? '$_textLabel should not be empty' : null,
      decoration: InputDecoration(
        labelText: _textLabel,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 2.0,
          ),
        ),
      ),
      cursorColor: Colors.black,
      controller: _controller,
      maxLength: maxLength ?? null,
    );
  }
}
