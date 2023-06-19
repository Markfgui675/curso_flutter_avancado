import 'package:curso_flutter_avancado/presentation/register/register_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  RegisterViewModel _viewModel = instance<RegisterViewModel>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _userTextEditingController = TextEditingController();
  TextEditingController _mobileNumberTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  _bind(){
    _viewModel.start();
    _userTextEditingController.addListener(() {
      _viewModel.setUserName(_userTextEditingController.text);
    });
    _mobileNumberTextEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberTextEditingController.text);
    });
    _emailTextEditingController.addListener(() {
      _viewModel.setEmail(_emailTextEditingController.text);
    });
    _passwordTextEditingController.addListener(() {
      _viewModel.setPassword(_passwordTextEditingController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

