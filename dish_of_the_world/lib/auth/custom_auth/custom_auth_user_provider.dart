import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class DishOfTheWorldAuthUser {
  DishOfTheWorldAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<DishOfTheWorldAuthUser> dishOfTheWorldAuthUserSubject =
    BehaviorSubject.seeded(DishOfTheWorldAuthUser(loggedIn: false));
Stream<DishOfTheWorldAuthUser> dishOfTheWorldAuthUserStream() =>
    dishOfTheWorldAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
