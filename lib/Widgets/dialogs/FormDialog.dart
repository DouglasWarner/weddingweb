import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_wedding_web/Values/MyColors.dart';

import '../../base/BaseStateless.dart';
import '../common/CustomTextField.dart';
import 'ConfirmDialog.dart';
import 'ErrorDialog.dart';
import 'LoadingDialog.dart';

class FormDialog extends BaseStateless {
  FormDialog({super.key});

  String nameText = "";
  String guesses = "1";
  String messageText = "";

  @override
  Widget build(BuildContext context) {
    init(context);

    return AlertDialog(
      backgroundColor: primaryColor,
        // barrierDismissible: false, // user must tap button!
        content: Card(
            child: SizedBox(
              width: responsiveApp.dialogWidth,
              height: responsiveApp.dialogHeight,
              child: Padding(
                padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          label: "Nombre",
                          hint: "Ej. Douglas o familia ...",
                          minLines: 1,
                          maxLines: 1,
                          expands: false,
                          optional: false,
                          (value) {
                            nameText = value;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownMenu(
                          initialSelection: 1,
                          menuStyle: const MenuStyle(elevation: MaterialStatePropertyAll(3), backgroundColor: MaterialStatePropertyAll(Colors.white)),
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: secondaryColor, width: 2))
                          ),
                          dropdownMenuEntries: List.generate(
                              11,
                              (index) => DropdownMenuEntry(
                                    value: index + 1,
                                    label: index >= 10 ? "más de 10" : (index + 1).toString(),
                                  )),
                          label: Text("Invitados", style: TextStyle(color: secondaryColor),),
                          onSelected: (value) {
                            guesses = value.toString();
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            label: "Mensaje",
                            hint:
                                "Algún dato que debamos saber como por ejemplo: alergenos, intolerancias, etc. O simplemente escribenos algo :)",
                            minLines: 3,
                            maxLines: null,
                            expands: true,
                            optional: true,
                            (value) {
                              messageText = value;
                            },
                          )),
                    ),
                    FilledButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
                      onPressed: () async {
                        if (nameText.isNotEmpty) {
                          showDialog(context: context, builder: (context) => LoadingDialog());
                          await sendEmail(nameText, guesses, messageText).then((value) async {
                              Navigator.of(context).pop('dialog');

                              if (value.statusCode == 200) {
                                await showDialog(context: context, builder: (context) => ConfirmDialog());
                              } else {
                                await showDialog(context: context, builder: (context) => ErrorDialog());
                              }

                              return null;
                            }
                          );
                        }
                      },
                      child: const Text("Confirm"),
                    )
                  ],
                ),
            ),
          )
        )
    );
  }

  Future<Response> sendEmail(String name, String guesses, String message) async {
    const serviceId = 'service_3ujrs1b';
    const templateId = 'template_7w0ee87';
    const userId = 'c1d3OzcYo2e2E7PDq';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final Response response = await post(url,
        headers: {'Content-Type': 'application/json'}, //This line makes sure it works for all platforms.
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {'from_name': name, 'guesses': guesses, 'message': message}
        }));
    return response;
  }
}
