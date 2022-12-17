import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  const CustomButton({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      color: Colors.purple,
      child: Text(
        title ?? "",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
