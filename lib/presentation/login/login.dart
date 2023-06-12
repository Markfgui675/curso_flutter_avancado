import 'package:curso_flutter_avancado/presentation/login/login_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginViewModel _viewModel = instance<LoginViewModel>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _bind(){
    _viewModel.start();
    _userNameController.addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget(){
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
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
                      stream: _viewModel.outputIsUserNameValid,
                      builder: (context, snapshot){
                        return TextFormField(
                          controller: _userNameController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorManager.primary,
                          decoration: InputDecoration(
                              hintText: AppStrings.userName,
                              labelText: AppStrings.userName,
                              errorText: (snapshot.data ?? true) ? null : AppStrings.userNameError

                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.s28,),
                  Padding(
                    padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsPasswordValid,
                      builder: (context, snapshot){
                        return TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          cursorColor: ColorManager.primary,
                          decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                              errorText: (snapshot.data ?? true) ? null : AppStrings.passwordError

                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.s28,),
                  Padding(
                    padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                    child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsAllInputsValid,
                      builder: (context, snapshot){
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                _viewModel.login();
                              }
                                  : null,
                              child: Text(
                                  AppStrings.login
                              )
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: AppPadding.p12,
                        left: AppPadding.p28,
                        right: AppPadding.p28
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: AppPadding.p20, bottom: AppPadding.p8),
                            child: Text(AppStrings.forgotPassword, textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.subtitle2,),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: AppPadding.p20, bottom: AppPadding.p8),
                            child: Text(AppStrings.register, textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.subtitle2,),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

