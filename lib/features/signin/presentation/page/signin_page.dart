import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperce_booking/core/resource/app_assets.dart';

import '../cubit/signin_cubit.dart';
import '../../domain/entity/signin_arg.dart';
import '../../../../../core/values/dimension.dart';
import '../../../../../core/values/spacing.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key, required this.arg});
  final SigninArg arg;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SigninCubit())],
      child: SigninView(arg: arg),
    );
  }
}

class SigninView extends StatefulWidget {
  const SigninView({super.key, required this.arg});
  final SigninArg arg;

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final signinCubit = context.read<SigninCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<SigninCubit, SigninState>(
          listener: (context, state) {
            // Handle state changes here
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: SSpacing.lgMarginW,
          decoration: BoxDecoration(color: theme.colorScheme.surface),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SSpacing.colossalH,
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        SAppAssets.logoProdLogo,
                        height: SDimension.logoSize,
                        width: SDimension.logoSize,
                      ),
                      SSpacing.lgH,
                      Text(
                        'Welcome Back',
                        style: theme.textTheme.headlineSmall,
                      ),
                      Text(
                        'Login to continue',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SSpacing.epicH,
                Text('Email Address', style: theme.textTheme.bodyLarge),
                SSpacing.xsH,
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'example@yopmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
                SSpacing.lgH,
                Text('Password', style: theme.textTheme.bodyLarge),
                SSpacing.xsH,
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Example@123',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SSpacing.mdH,
                _buildOptionsRow(theme),
                SSpacing.epicH,
                Center(
                  child: ElevatedButton(
                    onPressed: _isFormValid()
                        ? () {
                            // handle login
                          }
                        : null,
                    child: const Text('LOG IN'),
                  ),
                ),
                SSpacing.xxxlH,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: theme.textTheme.bodyLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up now',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: SDimension.xl,
              width: SDimension.xl,
              child: Checkbox(
                value: _rememberMe,
                onChanged: (bool? newValue) {
                  setState(() {
                    _rememberMe = newValue!;
                  });
                },
              ),
            ),
            SSpacing.smW,
            Text('Remember me', style: theme.textTheme.bodyLarge),
          ],
        ),
        TextButton(
          onPressed: () {
            // handle forgot password
          },
          child: const Text('Forgot Password?'),
        ),
      ],
    );
  }
}
