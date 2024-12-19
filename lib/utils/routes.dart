// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:purveshxdev/homepage.dart';
import 'package:purveshxdev/screens/admin_login_screen.dart';
import 'package:purveshxdev/screens/all_project_screen.dart';
import 'package:purveshxdev/screens/project_detail_screen.dart';
import 'package:purveshxdev/screens/project_edit_screen.dart';

class Routes {
  static var webRoutes = {
    RouteName.HOMEPAGE: (context) => Homepage(),
    RouteName.ADMIN_LOGIN: (context) => const AdminLoginScreen(),
    RouteName.PROJECT_EDIT: (context) => const ProjectEditScreen(),
    RouteName.PROJECT_DETAILS: (context) => const ProjectDetailScreen(),
    RouteName.ALL_PROJECT: (context) => const AllProjectScreen(),
  };

  // Route generation function
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';
    final builder = webRoutes[routeName];

    // If no route is found, navigate to the homepage by default
    if (builder != null) {
      return MaterialPageRoute(builder: (context) => builder(context));
    }

    return MaterialPageRoute(
        builder: (context) => webRoutes[RouteName.HOMEPAGE]!(context));
  }
}

class RouteName {
  static const String HOMEPAGE = '/';
  static const String ADMIN_LOGIN = '/admin-login';
  static const String PROJECT_EDIT = '/project-edit';
  static const String PROJECT_DETAILS = '/project-details';
  static const String ALL_PROJECT = '/all-projects';
}
