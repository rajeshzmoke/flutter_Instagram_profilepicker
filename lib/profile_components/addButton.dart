import 'package:flutter/material.dart';

class AddImageButton extends StatelessWidget {
  final Function getImage;
  AddImageButton({Key key, this.getImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 159.0,
      left: 200.0,
      right: 136.0,
      child: GestureDetector(
        onTap: getImage,
        child: Container(
          width: 26.0,
          height: 26.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(width: 1.0, color: Colors.white)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
