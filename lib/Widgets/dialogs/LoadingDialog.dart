import 'package:flutter/material.dart';

import '../../Values/MyColors.dart';
import '../../base/BaseStateless.dart';

class LoadingDialog extends BaseStateless {
  LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: Container(
          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: CircularProgressIndicator(
                color: secondaryColor,
              ))));
}
