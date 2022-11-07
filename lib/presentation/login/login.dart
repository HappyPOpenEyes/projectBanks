import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project_bank/presentation/forgot_password/forgot_password.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/value_manager.dart';
import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = instance<LoginViewModel>();
  AppPreferences _appPreferences = instance<AppPreferences>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  _bind() {
    _viewModel.start();
    _emailController
        .addListener(() => _viewModel.setUserName(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessLoggedIn) {
      // navigate to main screen
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _appPreferences.setIsUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
    });
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
        padding: const EdgeInsets.only(top: AppPadding.p60),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(image: AssetImage(ImageAssets.splashLogo)),
                const SizedBox(
                  height: AppSize.s16,
                ),
                Padding(padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                  child:  Text(AppStrings.projectBank,
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                const SizedBox(
                  height: AppSize.s60,
                ),
                Padding(padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                  child:  Text(AppStrings.signIn,
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Padding(padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                  child:  Text(AppStrings.signInHint,
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: AppStrings.emailHint,
                            labelText: AppStrings.emailAddress,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.emailRequired),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        obscureText: _isObscure,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: AppStrings.passwordHint,
                            labelText: AppStrings.password,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.passwordRequired,
                            suffixIcon: IconButton(icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off),
                              onPressed: (){
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },

                            )
                        ),

                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s12,
                  width: double.infinity,),
                Padding(

                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right:AppPadding.p28,
                  ),
                  child:  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        initForgotPasswordModule();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => ForgotPasswordView(TokenId:_viewModel.loginObject.token),
                        ));

                      },

                      child: Text(AppStrings.forgetPassword1,
                        style: Theme.of(context).textTheme.subtitle2,textAlign: TextAlign.right,),
                    ),
                  ),

                ),

                const SizedBox(height: AppSize.s12),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: AppSize.s140,
                        height: AppSize.s40,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                              _viewModel.login();
                            }
                                : null,
                            child: Text(AppStrings.login)),
                      );
                    },
                  ),




                      // SizedBox(
                      //   width: 150,
                      //   height: 40,
                      //
                      //   child: ElevatedButton(onPressed:() {
                      //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
                      //
                      //   }, child: const Text(AppStrings.login),),
                      // ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(onPressed:() {
                          _emailController.clear();
                          _passwordController.clear();

                        },style: ElevatedButton.styleFrom(
                          primary: ColorManager.green,
                        ), child: const Text(AppStrings.reset),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
