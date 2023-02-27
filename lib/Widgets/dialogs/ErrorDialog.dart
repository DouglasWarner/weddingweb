import 'package:flutter/material.dart';

import '../../Values/MyColors.dart';
import '../../base/BaseStateless.dart';

class ErrorDialog extends BaseStateless {
  ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: Container(
          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("An error have been occurred please try again later.",
                  style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center
              )
          )
      )
  );
}
