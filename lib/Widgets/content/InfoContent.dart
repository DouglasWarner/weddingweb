import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../base/BaseStateless.dart';
import '../../model/InfoTabContent.dart';
import 'MyGoogleMap.dart';


class InfoContent extends BaseStateless {
  InfoTabContent content;

  InfoContent({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    init(context);

    return Container(
        padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: secondaryColor, width: 2))),
              alignment: Alignment.topLeft,
              margin: responsiveApp.edgeInsetsApp.largeBottomEdgeInsets,
              child: Text(content.title, style: Theme.of(context).textTheme.displayMedium,),
            ),

            (content.url != null) ? Padding(
              padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
              child: infoText(context, "Website: ", content.url!, hyperLink: true),
            ): SizedBox(),

            (content.phone != null) ? Padding(
              padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
              child: infoText(context, "Teléfono: ", content.phone!),
            ): SizedBox(),

            (content.hora != null) ? Padding(
              padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
              child: infoText(context, "Hora: ", content.hora!),
            ): SizedBox(),

            (content.descripcion != null) ? Padding(
              padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
              child: infoText(context, "", content.descripcion!),
            ): SizedBox(),

            (content.redSocial != null) ? Padding(
              padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
              child: infoTextWithIcon(context, content.redSocial!),
            ): SizedBox(),

            /*(content.images != null)
                ? Padding(
                    padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
                    child: SizedBox(
                      height: responsiveApp.setHeight(50),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: content.images!.map((e){
                          // TODO
                          // final storageRef = FirebaseStorage.instance.ref();
                            return Image.network(e,
                              height: responsiveApp.setHeight(50),
                              width: responsiveApp.setWidth(50),
                              fit: BoxFit.fill,
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => Padding(
                                padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
                                child: child,
                              ),
                              loadingBuilder: (context, child, loadingProgress) => Center(
                                child: child,
                              ),
                            );
                            //   Container(
                          //   alignment: Alignment.center,
                          //     decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                          //     height: responsiveApp.setHeight(50),
                          //     width: responsiveApp.setWidth(50),
                          //     child:
                          // );
                        }).toList()
                      ),
                    ),
                  )
                : */
            SizedBox(),

            (content.direccion != null) ? Padding(
              padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
              child: locationInfo(context, content.direccion, content.mapLocation),
            ): SizedBox(),

            SizedBox(height: responsiveApp.setHeight(40),)
          ],
        )
    );
  }

  Widget locationInfo(BuildContext context, String? location, String? mapLocation) => Column(
    children: [
      Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: secondaryColor, width: 2))),
        alignment: Alignment.topLeft,
        margin: responsiveApp.edgeInsetsApp.largeBottomEdgeInsets,
        child: Text(
          "Ubicación",
          style: Theme.of(context).textTheme.displaySmall,
        )
      ),
      Padding(
        padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
        child: infoText(context, "", location!),
      ),

      (mapLocation != null) ? MyGoogleMap(mapLocation) : SizedBox()
    ],
  );

  Widget infoTextWithIcon(BuildContext context, String detail,) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.instagram),
      tooltip: 'Instagram',
      color: Colors.black,
      splashRadius: 40,
      iconSize: 40,
      onPressed: () async {
        Uri url = Uri.parse(detail);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
    );
  }

  Widget infoText(BuildContext context, String title, String detail, {bool hyperLink = false}) {
    return SelectableText.rich(
        TextSpan(children: [
          TextSpan(
              text: title,
              style: Theme.of(context).textTheme.bodyMedium
          ),
          TextSpan(
            text: detail,
            recognizer: !hyperLink ? null : TapGestureRecognizer()?..onTap =  () async {
              Uri url = Uri.parse(detail);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: hyperLink ? TextDecoration.underline : TextDecoration.none),
          )
        ],)
    );
    //  SelectableLinkify(
    //   onOpen: (link) async {
    //     Uri url = Uri.parse(detail);
    //     if (await canLaunchUrl(url)) {
    //     await launchUrl(url);
    //     } else {
    //     throw 'Could not launch $url';
    //     }
    //   },
    //   text: "$title $detail",
    //   style: Theme.of(context).textTheme.bodyMedium,
    //   linkStyle: Theme.of(context).textTheme.bodyLarge,
    // );
  }

}