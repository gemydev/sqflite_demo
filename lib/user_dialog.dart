import 'dart:async';
import 'package:finalsqflite/user_model.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddUserDialog {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final birthDate = TextEditingController();
  User user;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget buildAboutDialog(
      BuildContext context, _myHomePageState, bool isEdit, User user) {
    if (user != null) {
      this.user = user;
      firstName.text = user.firstName;
      lastName.text = user.lastName;
      birthDate.text = user.dob;
    }

    return new AlertDialog(
      title: new Text(isEdit ? 'Edit' : 'Add new User'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getTextField("Enter first name", firstName),
          getTextField("Enter last name", lastName),
          getTextField("DD-MM-YYYY", birthDate),
          new GestureDetector(
            onTap: () {
              addRecord(isEdit);
              _myHomePageState.displayRecord();
              Navigator.of(context).pop();
            },
            child: new Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: getAppBorderButton(
                  isEdit ? "Edit" : "Add", EdgeInsets.only(top: 10)),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Future addRecord(bool isEdit) async {
    var db = new DatabaseHelper();
    var user = new User(firstName.text, lastName.text, birthDate.text);
    if (isEdit) {
      user.setUserId(this.user.id);
      await db.update(user);
    } else {
      await db.saveUser(user);
    }
  }
}
