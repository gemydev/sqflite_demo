import 'package:finalsqflite/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'user_dialog.dart';
import 'home_presenter.dart';

class UserList extends StatelessWidget {
  final List<User> items;
  final HomePresenter homePresenter;

  UserList(
    this.items,
    this.homePresenter, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items == null ? 0 : items.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            elevation: 3,
            child: new Container(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 30.0,
                        child: new Text(
                          getShortName(items[index]),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                items[index].firstName +
                                    " " +
                                    items[index].lastName,
                                // set some style to text
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              new Text(
                                "DATE: " + items[index].dob,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () => edit(items[index], context),
                          ),
                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: Colors.blue),
                            onPressed: () => homePresenter.delete(items[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(left: 10)),
          );
        });
  }

  displayRecord() {
    homePresenter.updateScreen();
  }

  edit(User user, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, true, user),
    );
    homePresenter.updateScreen();
  }

  String getShortName(User user) {
    String shortName = "";
    if (user.firstName.isNotEmpty) {
      shortName = user.firstName.substring(0, 1) + ".";
    }

    if (user.lastName.isNotEmpty) {
      shortName = shortName + user.lastName.substring(0, 1);
    }
    return shortName;
  }
}
