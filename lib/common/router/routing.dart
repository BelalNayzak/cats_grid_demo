import 'package:flutter/material.dart';

import '../../features/cats/presentation/screens/home_screen.dart';

class Routing {
  static Map<String, Widget Function(BuildContext context)> routes() {
    return {
      HomeScreen.id: (_) => const HomeScreen(),
      // ...
    };
  }
}