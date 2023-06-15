import 'package:flutter/material.dart';

import '../../app/di.dart';
import '../common/state_renderer/state_render_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController = TextEditingController();

  final ForgotPasswordViewModel _viewModel = instance<ForgotPasswordViewModel>();

  bind(){
    _viewModel.start();
    _emailTextEditingController.addListener(() {
      return _viewModel.setEmail(_emailTextEditingController.text);
    });
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot){
          return snapshot.data?.getScreenWidget(context, _getContentWidget(), (){
            _viewModel.forgotPassword();
          }) ?? _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget(){
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: AppPadding.p100),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image(image: AssetImage(ImageAssets.splashLogo), width: AppSize.s100,),
                SizedBox(height: AppSize.s28,),
                Padding(
                  padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsEmailValid,
                    builder: (context, snapshot){
                      return TextFormField(
                        controller: _emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            hintText: AppStrings.email,
                            labelText: AppStrings.email,
                            errorText: (snapshot.data ?? true) ? null : AppStrings.emailError

                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s28,),
                Padding(
                  padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsAllInputValid,
                    builder: (context, snapshot){
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                              _viewModel.forgotPassword();
                            }
                                : null,
                            child: Text(
                                AppStrings.resetPassword
                            )
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

