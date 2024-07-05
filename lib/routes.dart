import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';

extension WidgetRoute on Widget {
  Route get route => MaterialPageRoute(builder: (context) => this);
}

Route<dynamic>? onGenerateRoute(settings) {
  switch (settings.name) {
    case Home.path:
      return const Home().route;
    default:
      return null;
  }
}
