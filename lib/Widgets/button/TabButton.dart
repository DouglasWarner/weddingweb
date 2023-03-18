import 'package:flutter/material.dart';

import '../../Values/MyColors.dart';
import '../../base/BaseState.dart';

class TabButton extends StatefulWidget {
  String title;
  int index;
  Function(int) onTap;
  int tabIndex;

  TabButton(this.index, this.title, this.tabIndex, this.onTap, {super.key});

  @override
  State<TabButton> createState() => _TabButton();
}

class _TabButton extends BaseState<TabButton> {
  Color? hoverBackgroundColor = Colors.transparent;
  Color? hoverTextColor = textPrimaryColor;
  bool isHover = false;

  onHover(bool value, int index) {
    setState(() {
      (value || widget.index == widget.tabIndex) && widget.index == index
          ? hoverBackgroundColor = secondaryColor
          : hoverBackgroundColor = Colors.transparent;
      (value || widget.index == widget.tabIndex) && widget.index == index
          ? hoverTextColor = Colors.white
          : hoverTextColor = textPrimaryColor;

      isHover = value && widget.index == index;
    });
  }

  setupColors() {
    setState(() {
      hoverBackgroundColor =
      widget.index == widget.tabIndex ? hoverBackgroundColor = secondaryColor : hoverBackgroundColor = Colors.transparent;

      hoverTextColor = widget.index == widget.tabIndex ? Colors.white : textPrimaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    setupColors();

    return Container(
      decoration: BoxDecoration(
        color: hoverBackgroundColor,
        border: Border.all(color: secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        customBorder: Border.all(color: secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        onTap: () => widget.onTap(widget.index),
        child: Padding(
          padding: responsiveApp.edgeInsetsApp.verticalMediumEdgeInsets + responsiveApp.edgeInsetsApp.horizontalMediumEdgeInsets,
          child: Text(
            widget.title,
            style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: hoverTextColor),
            textAlign: TextAlign.center,
          ),
        ),
        onHover: (value) => onHover(value, widget.index),
      ),
    );
  }
}
