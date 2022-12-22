import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class WeatherByTimeWidget extends StatefulWidget {
  final String time;
  final IconData icon;
  final String temperature;
  bool isCurrent;

  WeatherByTimeWidget(
      {@required this.time,
      @required this.icon,
      @required this.temperature,
      this.isCurrent});

  @override
  State<WeatherByTimeWidget> createState() => _WeatherByTimeWidgetState();
}

class _WeatherByTimeWidgetState extends State<WeatherByTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: (widget.isCurrent)
            ? LinearGradient(
                colors: [
                  Colors.deepPurple[300],
                  Colors.deepPurple[900],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.time}",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: (widget.isCurrent) ? Colors.white : Colors.black,
                ),
          ),
          Icon(
            widget.icon,
            size: 70.sp,
            color: (widget.isCurrent) ? Colors.white : Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.temperature} ",
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 20.sp,
                      color: (widget.isCurrent) ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                "\u2103",
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 20.sp,
                      color: (widget.isCurrent) ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
