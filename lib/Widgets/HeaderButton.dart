import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:my_wedding_web/base/BaseState.dart';

class HeaderButton extends StatefulWidget {
  String title;
  int index;
  VoidCallback onTap;
  int pageIndex;

  HeaderButton(this.index, this.title, this.pageIndex, this.onTap, {super.key});

  @override
  State<StatefulWidget> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends BaseState<HeaderButton> {
  _HeaderButtonState();

  Color? hoverBackgroundColor = Colors.transparent;
  Color? hoverTextColor = textPrimaryColor;
  bool isHover = false;

  onHover(bool value, int index) {
    setState(() {
      (value || widget.index == widget.pageIndex) && widget.index == index
          ? hoverBackgroundColor = secondaryColor
          : hoverBackgroundColor = Colors.transparent;
      (value || widget.index == widget.pageIndex) && widget.index == index
          ? hoverTextColor = Colors.white
          : hoverTextColor = textPrimaryColor;

      isHover = value && widget.index == index;
    });
  }

  @override
  void initState() {
    hoverBackgroundColor =
        widget.index == widget.pageIndex ? hoverBackgroundColor = secondaryColor : hoverBackgroundColor = Colors.transparent;
    hoverTextColor = widget.index == widget.pageIndex ? Colors.white : textPrimaryColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    init(context);

    return Container(
      padding: responsiveApp.edgeInsetsApp.horizontalLargeEdgeInsets,
      color: hoverBackgroundColor,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Center(
        heightFactor: responsiveApp.setHeight(50),
          child: Text(
            widget.title,
            style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(color: hoverTextColor),
          ),
        ),
        onHover: (value) => onHover(value, widget.index),
      ),
    );
  }
}
