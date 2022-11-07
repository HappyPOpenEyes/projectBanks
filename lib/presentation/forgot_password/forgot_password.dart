import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bank/presentation/forgot_password/forgot_password_viewmodel.dart';

import '../../app/di.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/value_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key, required this.TokenId}) : super(key: key);
  final String TokenId;
  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
  TextEditingController();
  ForgotPasswordViewModel _viewModel = instance<ForgotPasswordViewModel>();

  _bind() {
    _viewModel.start();
    _emailTextEditingController
        .addListener(() => _viewModel.setEmail(_emailTextEditingController.text));
    _viewModel.setToken(widget.TokenId);
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
                _viewModel.forgotPassword();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.only(top: AppPadding.p60),
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               Image(image: AssetImage(ImageAssets.splashLogo)),
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
                child:  Text(AppStrings.forgotPassword,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Padding(padding: const EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
                child:  Text(AppStrings.forgotPassSubTitle,
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsEmailValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                          hintText: AppStrings.emailHint,
                          labelText: AppStrings.emailHint,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.emailRequired),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.s12),
              Padding(

                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right:AppPadding.p28,
                ),
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed:() => Navigator.pop(context, false),

                    child: Text(AppStrings.login,
                      style: Theme.of(context).textTheme.subtitle2,),
                  ),
                ),

              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: 150,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                            _viewModel.forgotPassword();
                          }
                              : null,
                          child: const Text(AppStrings.submit)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
