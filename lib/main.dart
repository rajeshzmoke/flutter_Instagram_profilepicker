import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_profilepic/profile_components/addButton.dart';
import 'package:flutter_instagram_profilepic/profile_components/profilePic.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyProfilePicker(),
    );
  }
}

class MyProfilePicker extends StatefulWidget {
  @override
  _MyProfilePickerState createState() => new _MyProfilePickerState();
}

class _MyProfilePickerState extends State<MyProfilePicker> {
  File _img;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    setState(() {
      _img = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(fit: StackFit.loose, children: <Widget>[
        PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 139.0),
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 115.0,
              pinned: true,
              title: Text('Profile'),
              centerTitle: false,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _img = null;
                    });
                  },
                )
              ],
            ),
          ]),
        ),
        ProfilePic(
          img: _img,
        ),
        AddImageButton(
          getImage: () {
            getImage();
          },
        ),
      ]),
    );
  }
}
