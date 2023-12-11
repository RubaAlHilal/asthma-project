

import 'package:asthma/helper/imports.dart';
// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  bool display = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorPaltte().newDarkBlue,
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: context.getHeight(),
          child: ListView(
            children: [
              SizedBox(
                  height: 300,
                  child: Center(
                      child: Image.asset("assets/A.png",
                          color: Colors.white, height: 150, width: 150))),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100))),
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView(shrinkWrap: true, children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text("Login", style: const TextStyle().bold24),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        keyForm: _emailKey,
                        hint: "exambel@exambel.com",
                        controller: emailController,
                        titel: "EMAIL",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter email";
                          }
                          if (!value.isValidEmail) {
                            return "Email must be contain @ And .com";
                          }
                          return null;
                        },
                      ),
                      BlocBuilder<AuthBloc, AuthStates>(
                        builder: (context, state) {
                          if (state is DisplayState) {
                            return TextFieldWidget(
                                onTap: () => context
                                    .read<AuthBloc>()
                                    .add(DisplayPasswordEvent(state.display)),
                                displayPass: state.display,
                                obscure: true,
                                keyForm: _passwordKey,
                                hint: "Password",
                                controller: passwordController,
                                titel: "PASSWORD",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter password";
                                  }
                                  if (!value.isValidPassword) {
                                    return "must be contain Uppercase, lowercase and (!@#*~)";
                                  }
                                  return null;
                                });
                          }
                          return TextFieldWidget(
                              onTap: () => context
                                  .read<AuthBloc>()
                                  .add(DisplayPasswordEvent(display)),
                              displayPass: display,
                              obscure: true,
                              keyForm: _passwordKey,
                              hint: "Password",
                              controller: passwordController,
                              titel: "PASSWORD",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter password";
                                }
                                if (!value.isValidPassword) {
                                  return "must be contain Uppercase, lowercase and (!@#*~)";
                                }
                                return null;
                              });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      BlocBuilder<AuthBloc, AuthStates>(
                        builder: (context, state) {
                          return BlocListener<AuthBloc, AuthStates>(
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                context.read<AuthBloc>().add(CheckLoginEvent());
                                context.pushAndRemoveUntil(
                                    view: const LoadingScreen());
                              } else if (state is ErrorAuthState) {
                                Navigator.of(context).pop();
                                context.showErrorMessage(msg: state.message);
                              } else if (state is ValidLoginState) {
                                Navigator.of(context).pop();
                              }
                            },
                            child: ButtonAuthWidget(
                              onPressed: () {
                                context.read<AuthBloc>().add(LogInAuthEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    emailKey: _emailKey,
                                    passwordKey: _passwordKey));
                                context.showLoading();
                              },
                              text: 'Login',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => context.push(view: SignupScreen()),
                                text: "Signup here",
                                style: TextStyle(color: Colors.grey[700]))
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
