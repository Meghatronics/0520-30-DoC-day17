import 'package:day17_30doc/utilities/styles_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor2,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(kScreenSize),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 50,
                left: 30,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Explore',
                        style: kMainTextStyle.copyWith(
                            fontWeight: FontWeight.w700)),
                    Text(
                      'Book',
                      style: kMainTextStyle.copyWith(
                        color: kFadedWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 80,
                right: 30,
                width: 130,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: kMainTextStyle.copyWith(
                        fontSize: 18, color: kFadedWhiteColor),
                    prefixIcon: Icon(
                      FontAwesomeIcons.search,
                      color: kFadedWhiteColor,
                      size: 15,
                    ),
                    fillColor: kFadedWhiteColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                bottom: 0,
                child: ContainerWithHorizontalGridScroll(
                  heading: 'Categories',
                  paintColor: kBackgroundColor3,
                  optionAction: () {
                    print('Categories options requested');
                  },
                  scrollChildren: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kActiveCardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.bowlingBall, size: 100),
                          Text('Something')
                        ],
                      ),
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 450,
                left: 0,
                right: 0,
                bottom: 0,
                child: ContainerWithHorizontalGridScroll(
                  heading: 'Trending Books',
                  scrollChildren: <Widget>[
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                    Placeholder(
                      fallbackHeight: 120,
                      fallbackWidth: 0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerWithHorizontalGridScroll extends StatelessWidget {
  const ContainerWithHorizontalGridScroll({
    Key key,
    this.heading,
    this.scrollChildren,
    this.optionAction,
    this.paintColor,
  }) : super(key: key);

  final String heading;
  final List<Widget> scrollChildren;
  final Function optionAction;
  final Color paintColor;
  final alternateColor = kBackgroundColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: paintColor ?? Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.zero,
            trailing: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  FontAwesomeIcons.ellipsisV,
                  color: paintColor == null ? alternateColor : Colors.white,
                  size: 16,
                ),
                onPressed: optionAction),
            title: Text(
              heading ?? '',
              style: kMainTextStyle.copyWith(
                  fontSize: 25,
                  color: paintColor == null ? alternateColor : Colors.white),
            ),
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: kScreenSize.width, height: 180),
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 120,
              children: scrollChildren ?? [],
            ),
          )
        ],
      ),
    );
  }
}
