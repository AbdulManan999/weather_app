import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/model/current_weather.dart';
import 'package:weather_app/common/model/weather.dart';
import 'package:weather_app/common/model/weather_data.dart';
import 'package:weather_app/common/widget/loading_widget.dart';
import 'package:weather_app/feature/home/bloc/index.dart';
import 'package:weather_app/feature/home/ui/widgets/weekly_weather_widget.dart';

class HomeDetails extends StatefulWidget {
  final Map data;

  HomeDetails({@required this.data});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  DateFormat format1 = DateFormat("EEEE, dd MMMM yyyy");
  DateFormat format2 = DateFormat("dd MMM yyyy");
  DateFormat weekFormat = DateFormat("EEEE");
  CurrentWeather currentWeather;
  Weather weather;
  List<WeatherData> filteredWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentWeather = widget.data["currentWeather"] as CurrentWeather;
    weather = widget.data["weather"] as Weather;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FilterWeatherData(weather: weather)),
      child: Scaffold(
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is WeatherDataFiltered) {
              filteredWeather = state.filteredWeatherData;
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Container(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.h),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 23.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              Text(
                                "${format1.format(DateTime.now())}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
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
                    // if (state is WeatherDataFiltered) {
                    (state is WeatherDataFiltered)
                        ? Expanded(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          (currentWeather.weather.first.main ==
                                                      "Haze" ||
                                                  currentWeather
                                                          .weather.first.main ==
                                                      "Clouds" ||
                                                  currentWeather
                                                          .weather.first.main ==
                                                      "Mist")
                                              ? Icons.cloud
                                              : (currentWeather
                                                          .weather.first.main ==
                                                      "Rain")
                                                  ? FontAwesomeIcons.cloudRain
                                                  : FontAwesomeIcons.sun,
                                          size: 120.sp,
                                          color: Colors.white70,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${currentWeather.main.temp.round()}\u00b0",
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
                                              "${currentWeather.weather.first.description}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Future Weather",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .copyWith(
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
                                                  icon: (state
                                                                  .filteredWeatherData[
                                                                      index]
                                                                  .main ==
                                                              "Haze" ||
                                                          currentWeather.weather
                                                                  .first.main ==
                                                              "Clouds" ||
                                                          currentWeather.weather
                                                                  .first.main ==
                                                              "Mist")
                                                      ? Icons.cloud
                                                      : (currentWeather.weather
                                                                  .first.main ==
                                                              "Rain")
                                                          ? FontAwesomeIcons
                                                              .cloudRain
                                                          : FontAwesomeIcons
                                                              .sun,
                                                  temperature:
                                                      "${filteredWeather[index].main.temp.round()}",
                                                  weekDay:
                                                      "${weekFormat.format(DateTime.fromMillisecondsSinceEpoch(int.parse(filteredWeather[index].date) * 1000))}",
                                                  date:
                                                      "${format2.format(DateTime.fromMillisecondsSinceEpoch(int.parse(filteredWeather[index].date) * 1000))}",
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return Divider();
                                              },
                                              itemCount: filteredWeather.length,
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
                        : LoadingWidget(
                            visible: true,
                          ),
                    // } else {
                    //   return LoadingWidget(
                    //     visible: true,
                    //   );
                    // }
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
