import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:weather_app/common/route/routes.dart';
import 'package:weather_app/feature/home/bloc/index.dart';
import 'package:weather_app/feature/home/ui/widgets/icon_text_widget.dart';
import 'package:weather_app/feature/home/ui/widgets/weather_by_time_wedget.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../signin_signup/resources/auth_repository.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class HomePage extends StatefulWidget {
  final AuthRepository authRepository;

  HomePage({Key key, @required this.authRepository});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  stt.SpeechToText _speechToText = stt.SpeechToText();
  // bool _speechEnabled = false;
  // String _lastWords = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _initSpeech();
  // }
  //
  // /// This has to happen only once per app
  // void _initSpeech() async {
  //   _speechEnabled = await _speechToText.initialize(
  //       onError: (SpeechRecognitionError speechRecognitionError) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("${speechRecognitionError.errorMsg}"),
  //       ),
  //     );
  //   }, onStatus: (value) {
  //     if (value == "done") {
  //       setState(() {});
  //     }
  //   });
  //   setState(() {});
  // }
  //
  // void _startListening() async {
  //   await _speechToText.listen(onResult: _onSpeechResult);
  //   print("Started");
  //   setState(() {});
  // }
  //
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   setState(() {});
  // }
  //
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     print(result.recognizedWords);
  //     _lastWords = result.recognizedWords;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeVoiceOverInititalize()),
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is VoiceDataReceived) {
              print(state.text);
            } else if (state is HomeVoiceInitializedFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${state.error}"),
                ),
              );
            } else if (state is OnHomeVoiceIListeningSuccess) {
              setState(() {});
            } else if (state is HomeVoiceIListenedFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${state.error}"),
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurple[100],
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.deepPurple[50],
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 16.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50.w,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Pasuruan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .copyWith(
                                                  fontSize: 23.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          Text(
                                            "17:45 Pm",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .copyWith(
                                                  fontSize: 13.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.mic),
                                        onPressed: () async {
                                          // print("${_lastWords}");
                                          // if (_speechToText.isListening) {
                                          // _speechEnabled = false;
                                          // await _stopListening();
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(HomeVoiceOverPressed());
                                          // } else {
                                          //   // _speechEnabled = true;
                                          //   // await _startListening();
                                          // }
                                          print("here1");
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  children: [
                                    Container(
                                      height: 340.h,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 280.h,
                                              width: 200.w,
                                              padding: EdgeInsets.all(10.sp),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.deepPurple[700],
                                                    Colors.deepPurple[100],
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.topRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        40.sp),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.cloud,
                                                    size: 130.sp,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    height: 30.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "23",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline1
                                                            .copyWith(
                                                              fontSize: 70.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                      ),
                                                      Text(
                                                        "\u00b0",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline1
                                                            .copyWith(
                                                              fontSize: 70.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "Lorem Ipsum gypsum",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1
                                                        .copyWith(
                                                          fontSize: 13.sp,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10.h,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.sp),
                                        ),
                                        child: Text(
                                          "Sunday, 8 March 2021",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 70.h,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Today",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.homeDetails);
                                        },
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Next 7 Days",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              Icon(Icons.keyboard_arrow_right),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                // CarouselSlider.builder(
                                //   itemCount: 6,
                                //   itemBuilder: (context, itemIndex, pageViewIndex) {
                                //     return Container(
                                //       color: Colors.black,
                                //     );
                                //   },
                                //   options: CarouselOptions(
                                //     height: 190.h,
                                //     aspectRatio: 16 / 9,
                                //     viewportFraction: 0.8,
                                //     initialPage: 0,
                                //     reverse: false,
                                //     autoPlayInterval: Duration(seconds: 3),
                                //     autoPlayAnimationDuration:
                                //         Duration(milliseconds: 800),
                                //     autoPlayCurve: Curves.fastOutSlowIn,
                                //     enlargeCenterPage: true,
                                //     enlargeFactor: 0.3,
                                //     onPageChanged: (int, reason) {},
                                //     scrollDirection: Axis.horizontal,
                                //   ),
                                // )
                                Container(
                                  height: 140.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 50.w,
                                        ),
                                        ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            if (index == 0) {
                                              return WeatherByTimeWidget(
                                                time: "08:00 AM",
                                                icon: Icons.cloud,
                                                temperature: "23",
                                                isCurrent: true,
                                              );
                                            } else {
                                              return WeatherByTimeWidget(
                                                time: "08:00 AM",
                                                icon:
                                                    FontAwesomeIcons.cloudRain,
                                                temperature: "23",
                                                isCurrent: false,
                                              );
                                              return Container(
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.sp),
                                                ),
                                                child: Column(
                                                  children: [],
                                                ),
                                              );
                                            }
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              width: 20.w,
                                            );
                                          },
                                          itemCount: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 260.h,
                      child: Container(
                        width: 310.w,
                        padding: EdgeInsets.symmetric(vertical: 40.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconTextWidget(
                              icon: Icons.water_drop,
                              text: "75%",
                            ),
                            IconTextWidget(
                              icon: Icons.air,
                              text: "75%",
                            ),
                            IconTextWidget(
                              icon: Icons.electric_meter,
                              text: "75%",
                            ),
                            IconTextWidget(
                              icon: Icons.remove_red_eye,
                              text: "75%",
                            ),
                          ],
                        ),
                      ),
                    )
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
