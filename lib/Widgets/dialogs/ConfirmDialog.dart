import 'package:flutter/material.dart';

import '../../base/BaseStateless.dart';

class ConfirmDialog extends BaseStateless {
  ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    init(context);

    return AlertDialog(
      title: Text("Gracias por confirmar", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
    );
  }
}
