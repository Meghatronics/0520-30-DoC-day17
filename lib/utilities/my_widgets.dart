import 'package:day17_30doc/utilities/styles_and_constants.dart';
import 'package:flutter/material.dart';
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

