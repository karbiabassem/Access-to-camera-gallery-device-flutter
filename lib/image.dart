import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  File image;
  ImageInput(this.image);
  @override
  State<StatefulWidget> createState() {
    return _ImageInputState(this.image);
  }
}

class _ImageInputState extends State<ImageInput> {
  File imageFile;
  _ImageInputState(this.imageFile);
  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        this.imageFile = image;
      });
      Navigator.pop(context);
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text('Pick an image'),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Use Camera'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Use Gallery'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = Theme.of(context).accentColor;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            OutlineButton(
              borderSide: BorderSide(width: 2.0, color: buttonColor),
              onPressed: () {
                _openImagePicker(context);
                print(imageFile);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.camera_alt, color: buttonColor),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Add image',
                    style: TextStyle(color: buttonColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            this.imageFile == null
                ? Text('Please pick an image')
                : Image.file(
                    this.imageFile,
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter,
                  )
          ],
        ));
  }
}
