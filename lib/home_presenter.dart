import 'dart:async';

import 'package:finalsqflite/user_model.dart';

import 'database_helper.dart';

  abstract class HomeContract {
    void screenUpdate();
  }

  class HomePresenter {
    HomeContract _view;
    var db = new DatabaseHelper();
    HomePresenter(this._view);
    delete(User user) {
      var db = new DatabaseHelper();
      db.deleteUsers(user);
      updateScreen();
    }

    Future<List<User>> getUser() {
      return db.getUser();
    }

    updateScreen() {
      _view.screenUpdate();
    }
  }
