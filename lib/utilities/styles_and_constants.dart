import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Size kScreenSize;
enum Logosize { large, medium, small }

const Icon kBookLogoBlue = Icon(
  FontAwesomeIcons.bookReader,
  size: 60,
  color: kBackgroundColor,
);
final TextStyle kOnboardingTextStyle = GoogleFonts.montserrat(
  fontWeight: FontWeight.w300,
  color: kBackgroundColor,
  fontSize: 20,
);

final TextStyle kMainTextStyle = GoogleFonts.montserrat(
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontSize: 40,
);

const Color kBackgroundColor = Color(0xFF335577);
const Color kBackgroundColor2 = Color(0xFF161A34);
const Color kBackgroundColor3 = Color(0xFF292e53);
const Color kActiveCardColor = Color(0xFF806EBF);
const Color kInactiveCardColor = Color(0xFF323960);
const Color kFadedWhiteColor = Color(0xFFB7B8BD);

const Duration kSplashScreenAnimationDuration = Duration(milliseconds: 1000);

List<String> kOnboardingText = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
  " nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut"
];

List<String> kOnboardingHeading = [
  "This app won't suddenly make you a reader.",
  "See! You didn't read what was written under there.",
  "Well, don't deceive yourself. Nobody reads beyond Ipsum"
];

const List<ImageProvider> kOnboardingImage = [
  AssetImage('assets/floating leaves.png'),
  AssetImage('assets/floating leaves only.png'),
  AssetImage('assets/windy tree.png'),
];
