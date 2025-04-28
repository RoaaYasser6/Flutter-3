import 'package:day3/Screans/addtasks.dart';
import 'package:day3/Screans/login.dart';
import 'package:day3/models/customButtom.dart';         
import 'package:day3/models/customTextfiled.dart';   
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
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
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Username', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
               CustomTextFiled(
                hintText: 'Full Name',
                hintColor: Colors.white,
                controller: _usernameController,
                prefixIcon: Icon(Icons.person, color: Colors.white),
                validator: (value) => (value == null || value.isEmpty) ? "Username is Empty" : null, hittext: '',
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Password', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFiled(
                hintText: 'Password',
                hintColor: Colors.white,
                controller: _passwordController,
                isPassword: true,
                validator: _validatePassword,
                prefixIcon: Icon(Icons.lock, color: Colors.white), hittext: '',
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Confirm Password', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFiled(
                hintText: 'Confirm Password',
                hintColor: Colors.white,
                controller: _confirmPasswordController,
                isPassword: true,
                validator: _validateConfirmPassword,
                prefixIcon: Icon(Icons.lock, color: Colors.white), hittext: '',
              ),
              SizedBox(height: 24),
              CustomButton(
                text: 'Register',
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
              SizedBox(height: 16),
              Row(
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
              ),
              SizedBox(height: 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}