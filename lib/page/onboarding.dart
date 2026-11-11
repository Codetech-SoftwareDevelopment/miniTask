import 'package:flutter/material.dart';
import 'package:onboarding/model/onboarding_data.dart';
import 'package:onboarding/page/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final item = onboardingData[index];
                return Column(
                  children: [
                    SizedBox(height: 50),
                    Image.asset(item.image, width: 350),
                    SizedBox(height: 50),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 26,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(onboardingData.length, (
                              index,
                            ) {
                              return Container(
                                margin: EdgeInsets.only(right: 7),
                                height: 10,
                                width: _currentPage == index ? 28 : 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _currentPage == index
                                      ? Color(0xffFF4B4B)
                                      : Colors.black,
                                ),
                              );
                            }),
                          ),

                          GestureDetector(
                            onTap: () {
                              if (_currentPage == onboardingData.length - 1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (c) => Login()),
                                );
                              } else {
                                _controller.nextPage(
                                  duration: Duration(microseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Image.asset("assets/btn.png", width: 97),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
