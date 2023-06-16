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

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {

    super.dispose();
  }
}

