import 'package:flutter/material.dart';
const kLabelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xff8d8e98)
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

class IconandTextCard extends StatelessWidget {
  final IconData icon;
  final String text;
  IconandTextCard(this.icon,this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
