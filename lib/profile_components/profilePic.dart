import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final File img;
  ProfilePic({this.img});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return PositionedDirectional(
      start: screenWidth * 133.5 / 360,
      top: 81.0,
      end: screenWidth * 133.5 / 360,
      child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(85, 96, 128, 1.0),
          ),
          child: Padding(
            padding: img == null
                ? EdgeInsets.only(top: 13.0, left: 20.0, right: 20.0)
                : EdgeInsets.all(0.0),
            child: ClipRRect(
              borderRadius: img == null
                  ? BorderRadius.circular(0.0)
                  : BorderRadius.circular(50.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/ic_default.png'),
                image: img == null
                    ? AssetImage('assets/ic_default.png')
                    : FileImage(img),
              ),
            ),
          )),
    );
  }
}
