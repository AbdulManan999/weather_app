import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/feature/home/ui/widgets/weekly_weather_widget.dart';

class HomeDetails extends StatefulWidget {
  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple[900],
              Colors.deepPurple[100],
              Colors.deepPurple[900],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "Today's Weather",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 23.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        "Sunday 8 March 2021",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    GlassContainer(
                      height: 170.h,
                      width: MediaQuery.of(context).size.width,
                      // gradient: LinearGradient(
                      //   colors: [
                      //     Colors.white.withOpacity(0.40),
                      //     Colors.white.withOpacity(0.10)
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(40),
                      borderColor: Colors.white,
                      blur: 100.0,
                      borderWidth: 1.5,
                      elevation: 3.0,
                      isFrostedGlass: false,
                      shadowColor: Colors.black.withOpacity(0.20),
                      alignment: Alignment.center,
                      frostedOpacity: 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud,
                            size: 120.sp,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "23\u00b0",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 70.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                "Moon cloud fast wind",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    GlassContainer(
                      height: 470.h,
                      width: MediaQuery.of(context).size.width,
                      // gradient: LinearGradient(
                      //   colors: [
                      //     Colors.white.withOpacity(0.40),
                      //     Colors.white.withOpacity(0.10)
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      borderColor: Colors.white,
                      blur: 100.0,
                      borderWidth: 1.5,
                      elevation: 3.0,
                      isFrostedGlass: false,
                      shadowColor: Colors.black.withOpacity(0.20),
                      alignment: Alignment.center,
                      frostedOpacity: 0.1,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 25.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Future Weather",
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Expanded(
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return WeeklyWeatherWidget(
                                    icon: Icons.cloud,
                                    temperature: "23",
                                    weekDay: "Monday",
                                    date: "6 March 2021",
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemCount: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
