import 'package:flutter/material.dart';
import 'package:day3/Screans/login.dart';
import 'package:day3/Screans/register.dart';
import 'package:day3/models/customButtom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Header(),
              SizedBox(height: 32),
              _ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to UpTodo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Please login to your account or create new account to continue',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Login',
          backgroundColor: Color.fromRGBO(136, 117, 255, 1),
          textColor: Colors.white,
          textcolor: Colors.white,
          color: Colors.grey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
        SizedBox(height: 16),
        CustomButton(
          text: 'Create account',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          textcolor: Colors.white,
          color: Colors.grey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
        ),
      ],
    );
  }
}