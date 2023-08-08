import 'package:flutter/material.dart';
import 'package:notes_app/shared/component/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is requird';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          border: buildOutline(), //const OutlineInputBorder()
          enabledBorder: buildOutline(),
          focusedBorder: buildOutline(kPrimaryColor)),
    );
  }

  OutlineInputBorder buildOutline([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
