import 'package:flu_proj/app/di.dart';
import 'package:flu_proj/presentation/register/registerViewModel/registerViewModel.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel =instance<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
