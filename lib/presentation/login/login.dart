import 'package:curso_flutter_avancado/presentation/login/login_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginViewModel _viewModel = LoginViewModel(null); //todo pass here login useCase

  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _bind(){
    _viewModel.start();
    _userNameController.addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController.addListener(() => _viewModel.setUserName(_passwordController.text));
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
      body: Container(
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
                    stream: ,// todo add me later
                    builder: (context, snapshot){
                      return ElevatedButton(
                        onPressed: (){},
                        child: Text(
                          AppStrings.login
                        )
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

