import 'package:flutter/material.dart';
import 'dart:io';
import './profile_class.dart';
import './image.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String name = '';
  File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: this._formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                maxLines: 6,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter a name';
                  }
                },
                onSaved: (String value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration:
                    InputDecoration(hintText: 'name', labelText: 'Name'),
              ),
              ImageInput(image),
              Container(
                child: Center(
                  child: RaisedButton(
                    child: Text('Creat'),
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      print(name);
                      print(image);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
