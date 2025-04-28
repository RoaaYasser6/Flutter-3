import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final String hittext;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Color? hitcolor;

  const CustomTextFiled({
    super.key,
    required this.hittext,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.hitcolor, required String hintText, required Color hintColor,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hittext,
        hintStyle: TextStyle(color: widget.hitcolor ?? Colors.grey),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}