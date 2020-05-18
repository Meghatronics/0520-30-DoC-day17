import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Size kScreenSize;
enum Logosize { large, medium, small }

class kBookLogo extends StatelessWidget {
  kBookLogo(Logosize size) {
    switch (size) {
      case Logosize.large:
        this.size = 150;
        break;
      case Logosize.medium:
        this.size = 90;
        break;
      case Logosize.small:
        this.size = 70;
        break;
      default:
        this.size = 150;
    }
  }

  double size;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: size, height: size),
      child: Image(
        image: AssetImage('assets/bookAppLogo.png'),
      ),
    );
  }
}

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

const Color kBackgroundColor = Color(0xFF335577);

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
