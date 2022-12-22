import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  IconTextWidget({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "${text}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w900,
                ),
          )
        ],
      ),
    );
  }
}
