import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../../app/theme.dart';

class CustomizableTextButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  final double buttonHeight;
  final double buttonWidth;
  final TextStyle buttonTitleStyle;
  double buttonBorderRadius;

  CustomizableTextButton({
    @required this.buttonTitle,
    @required this.onPressed,
    @required this.buttonHeight,
    @required this.buttonWidth,
    @required this.buttonTitleStyle,
    @required this.buttonBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        border: Border.all(color: colorPrimary1, width: 2.sp),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorPrimary1, primaryColor],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            offset: Offset(0.0, 1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              buttonTitle,
              style: buttonTitleStyle,
            ),
          ),
        ),
      ),
    );
  }
}
