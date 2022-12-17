import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textC;
  final IconData? icon;
  const CustomTextField({Key? key, this.hintText, this.textC, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? "Ga boleh kosong" : null,
      controller: textC,
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.deepPurple[100],
          hintText: hintText,
          suffixIcon: Icon(icon)),
    );
  }
}
