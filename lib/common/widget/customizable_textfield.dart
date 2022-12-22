import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app/theme.dart';

class CustomizableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final Function(String) validator;
  final Function(String) onChanged;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Color focusedIconColor;
  final Color unfocusedIconColor;
  final bool hideText;
  final Function onSuffixIconPressed;

  CustomizableTextField({
    @required this.controller,
    @required this.hintText,
    @required this.focusNode,
    @required this.validator,
    @required this.onChanged,
    @required this.prefixIcon,
    @required this.suffixIcon,
    @required this.focusedIconColor,
    @required this.unfocusedIconColor,
    @required this.hideText,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: hideText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0.w,
          vertical: 18.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.sp),
          borderSide: BorderSide(
            color: colorPrimary5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.sp),
          borderSide: BorderSide(
            color: colorPrimary5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.sp),
          borderSide: BorderSide(
            color: secondaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60.sp),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Icon(
            prefixIcon,
            color: (focusNode.hasFocus) ? focusedIconColor : unfocusedIconColor,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: InkWell(
            onTap: onSuffixIconPressed,
            child: Icon(
              suffixIcon,
              color: unfocusedIconColor,
            ),
          ),
        ),
        filled: true,
        fillColor: (focusNode.hasFocus) ? Colors.black : colorPrimary2,
        focusColor: Colors.black,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              color: colorPrimary5,
              fontSize: 16.sp,
            ),
      ),
      validator: validator,
      onChanged: onChanged,
      cursorColor: secondaryColor,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.white,
            fontSize: 16.sp,
          ),
    );
  }
}
