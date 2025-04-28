import 'package:day3/models/customTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:day3/Screans/addtasks.dart';
import 'package:day3/Screans/register.dart';
import 'package:day3/models/customButtom.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is Empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 38),
              Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 24),
              _InputField(
                label: 'Username',
                controller: _usernameController,
                hintText: 'Full Name',
                validator: _validateUsername,
                prefixIcon: Icon(Icons.person, color: Colors.white),
              ),
              SizedBox(height: 16),
              _InputField(
                label: 'Password',
                controller: _passwordController,
                hintText: 'Password',
                isPassword: true,
                validator: _validatePassword,
                prefixIcon: Icon(Icons.lock, color: Colors.white),
              ),
              SizedBox(height: 26),
              CustomButton(
                text: 'Login',
                backgroundColor: Color.fromRGBO(136, 117, 255, 1),
                textColor: Colors.white,
                textcolor: Colors.white,
                color: Colors.grey,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTasks(username: _usernameController.text),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 17),
              _Separator(),
             CustomButton(
  text: 'Continue With Google',
  backgroundColor: Colors.white,
  textColor: Colors.black,
  textcolor: Colors.white,
  color: Colors.grey,
  iconPath: 'assets/images/Google.png',
  onPressed: () {
    
  },
),

const SizedBox(height: 16),

CustomButton(
  text: 'Continue with Apple',
  backgroundColor: Colors.white,
  textColor: Colors.black,
  textcolor: Colors.white,
  color: Colors.grey,
  iconPath: 'assets/images/Apple.png',
  onPressed: () {
 
  },
),
              SizedBox(height: 8),
              _RegisterPrompt(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  const _InputField({
    required this.label,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        CustomTextFiled(
          controller: controller,
          isPassword: isPassword,
          validator: validator,
          prefixIcon: prefixIcon as Icon?, hittext: '', hintText: '', hintColor: Colors.transparent,
        ),
      ],
    );
  }
}

class _Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white,
            margin: EdgeInsets.only(right: 10),
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white,
            margin: EdgeInsets.only(left: 10),
          ),
        ),
      ],
    );
  }
}

class _RegisterPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
          child: Text(
            "Register",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}