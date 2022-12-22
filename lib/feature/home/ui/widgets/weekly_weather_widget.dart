import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class WeeklyWeatherWidget extends StatefulWidget {
  final IconData icon;
  final String temperature;
  final String weekDay;
  final String date;

  WeeklyWeatherWidget({
    @required this.icon,
    @required this.temperature,
    @required this.weekDay,
    @required this.date,
  });

  @override
  State<WeeklyWeatherWidget> createState() => _WeeklyWeatherWidgetState();
}

class _WeeklyWeatherWidgetState extends State<WeeklyWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Icon(
              widget.icon,
              size: 70.sp,
              color: Colors.black,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.temperature}\u00b0",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 40.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.weekDay}",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      "${widget.date}",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 12.sp,
                            color: Colors.deepPurple[100],
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
