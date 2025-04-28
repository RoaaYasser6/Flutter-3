import 'package:flutter/material.dart';
import 'package:day3/Screans/home.dart';
import 'package:day3/Screans/login.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  _OnBording createState() => _OnBording();
}

class _OnBording extends State<OnBording> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Text(
            "Skip",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _OnboardingPage(
                  image: 'assets/images/Group 182.png',
                  title: 'Manage your tasks',
                  subtitle:
                      'You can easily manage all of your daily tasks in DoMe for free',
                ),
                _OnboardingPage(
                  image: 'assets/images/Frame 162.png',
                  title: 'Create daily routine',
                  subtitle:
                      'In Uptodo  you can create your personalized routine to stay productive',
                ),
                _OnboardingPage(
                  image: 'assets/images/Frame 161.png',
                  title: 'Organize your tasks',
                  subtitle:
                      'You can organize your daily tasks by adding your tasks into separate categories',
                ),
              ],
            ),
          ),
          // Indicators and Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _totalPages,
                    (index) => _Indicator(
                      isActive: _currentPage == index,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: _currentPage > 0
                          ? () {
                              _controller.animateToPage(
                                _currentPage - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                      child: Text('Back'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(136, 117, 255, 1),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage < _totalPages - 1) {
                          _controller.animateToPage(
                            _currentPage + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        }
                      },
                      child: Text(
                        _currentPage == _totalPages - 1 ? 'Get Started' : 'Next',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _OnboardingPage({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 18),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 18),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isActive;

  const _Indicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 24 : 8,
      height: 8,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isActive ? Color.fromRGBO(136, 117, 255, 1) : Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}