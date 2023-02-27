
import 'package:flutter/cupertino.dart';

import '../Values/ResponsiveApp.dart';

abstract class BaseStateless extends StatelessWidget {

  late ResponsiveApp responsiveApp;

  BaseStateless({super.key});

  void init(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
  }
}