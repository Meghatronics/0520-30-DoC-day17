import 'dart:math';

import 'package:day17_30doc/screens/main_page.dart';
import 'package:day17_30doc/utilities/my_widgets.dart';
import 'package:day17_30doc/utilities/styles_and_constants.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final ValueNotifier currentPage = ValueNotifier(0);
  final PageController onboardingController = PageController();
  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Transform.rotate(
                angle: 1.9 * pi,
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: kBackgroundColor,
                  constraints: BoxConstraints.tightFor(
                      width: kScreenSize.width + 50,
                      height: kScreenSize.height / 3),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 30,
              child: kBookLogo(Logosize.medium),
            ),
            PageView.builder(
              itemBuilder: (context, page) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 20, 170),
                  alignment: Alignment.bottomLeft,
                  constraints: BoxConstraints.tight(kScreenSize),
                  decoration: BoxDecoration(
//color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: kOnboardingImage[page],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        kOnboardingHeading[page],
                        style: kOnboardingTextStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20),
                      Text(
                        kOnboardingText[page],
                        style: kOnboardingTextStyle,
                      ),
                    ],
                  ),
                );
              },
              itemCount: kOnboardingText.length,
              controller: onboardingController,
              onPageChanged: (page) {
                currentPage.value = page;
              },
            ),
            Positioned(
                bottom: 70,
                right: 50,
                child: ValueListenableBuilder(
                    valueListenable: currentPage,
                    builder: (context, currentPage, child) {
                      return SlideIndicatorPane(currentPage: currentPage);
                    })),
            Positioned(
              bottom: 40,
              left: 50,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
                child: Container(
                  constraints: BoxConstraints.tightFor(width: 150, height: 60),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFC3400A),
                  ),
                  child: Text(
                    'Start Books',
                    style: kOnboardingTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

///Display Animated dot component for
///```
///SlideIndicatorPane ```
class SlideIndicatorDot extends StatelessWidget {
  final bool isActive;
  SlideIndicatorDot(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.only(right: 8.0),
      constraints: BoxConstraints.tightFor(width: 7, height: 7),
      decoration: BoxDecoration(
        color: isActive ? kBackgroundColor : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

///Display a row of ```
///SlideIndicatorDot``` 's and indicate which page is active.
///
class SlideIndicatorPane extends StatelessWidget {
  SlideIndicatorPane({@required this.currentPage});

  final int currentPage;
  final List<SlideIndicatorDot> _slideIndicators = [
    SlideIndicatorDot(false),
    SlideIndicatorDot(false),
    SlideIndicatorDot(false),
  ];
  List<SlideIndicatorDot> _slideIndicatorsBlank = [
    SlideIndicatorDot(false),
    SlideIndicatorDot(false),
    SlideIndicatorDot(false),
  ];

  void prepIndicators() {
    //  _slideIndicators.clear();
    _slideIndicators.setAll(0, _slideIndicatorsBlank);
    _slideIndicators[currentPage] = SlideIndicatorDot(true);
  }

  @override
  Widget build(BuildContext context) {
    prepIndicators();
    return Container(
      child: Row(
        children: _slideIndicators,
      ),
    );
  }
}
