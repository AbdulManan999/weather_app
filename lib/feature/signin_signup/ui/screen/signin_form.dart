import 'package:flutter/cupertino.dart';
import 'package:weather_app/app/theme.dart';
import 'package:weather_app/common/widget/customizable_button.dart';
import 'package:weather_app/common/widget/customizable_textfield.dart';
import 'package:weather_app/common/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/route/routes.dart';
import 'package:weather_app/feature/signin_signup/bloc/index.dart';
import 'package:weather_app/feature/signin_signup/resources/index.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/size_extension.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController textFieldController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode textFieldFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final double screenSize = 750.h;
  bool hideText = false;

  void _onLoginButtonPressed() {
    BlocProvider.of<SignInBloc>(context).add(
      SignInButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // color: Provider.of<ThemeProvider>(context).getTheme()
                //     ? darkThemeBackgroundColor
                //     : backgroundColor,
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomizableTextField(
                          controller: textFieldController,
                          focusNode: textFieldFocusNode,
                          hideText: hideText,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Error";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          prefixIcon: FontAwesomeIcons.user,
                          suffixIcon: CupertinoIcons.eye,
                          hintText: "Blah Blah Blah",
                          unfocusedIconColor: colorPrimary5,
                          focusedIconColor: Colors.white,
                          onSuffixIconPressed: () {
                            // setState(() {
                            //   hideText = !hideText;
                            // });
                            textFieldController.text = "";
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        state is SignInLoading
                            ? LoadingWidget(
                                visible: true,
                              )
                            : CustomizableTextButton(
                                buttonHeight: 64.h,
                                buttonWidth: 346.w,
                                buttonTitle: "Create Account",
                                buttonBorderRadius: 60.sp,
                                buttonTitleStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                onPressed: () {
                                  formKey.currentState.validate();
                                },
                              ),
                        // : _signInButton(state),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _signInButton(SignInState state) {
    return Container(
      height: 50.h,
      child: ElevatedButton(
        //5A8DEE
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF5A8DEE),
        ),
        onPressed: state is SignInLoading ? null : _onLoginButtonPressed,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            Icon(FontAwesomeIcons.arrowRight),
          ],
        ),
      ),
    );
    // return SizedBox(
    //     width: double.infinity,
    //     child: RaisedButton(
    //       color: Colors.white,
    //       onPressed: state is! SignInLoading ? _onLoginButtonPressed : null,
    //       child: Text(S.of(context).sign_in),
    //     ));
  }

  Widget _signUpButton() {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signUp,
                arguments: RepositoryProvider.of<AuthRepository>(context));
          },
          child: Text(S.of(context).sign_up),
        ));
  }
}
