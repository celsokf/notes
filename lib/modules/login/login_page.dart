import 'package:flutter/material.dart';
import 'package:notes/modules/login/login_controller.dart';
import 'package:notes/modules/login/login_service.dart';
import 'package:notes/modules/login/login_state.dart';
import 'package:notes/modules/login/widgets/social_button_widget.dart';
import 'package:notes/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
      service: LoginServiceImpl(),
      onUpdate: () {
        if (controller.state is LoginStateSuccess) {
          final user = (controller.state as LoginStateSuccess).user;
          Navigator.pushReplacementNamed(context, "/home", arguments: user);
        } else {
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Container(
                  width: 300,
                  child: Text(
                    "Anote todas as informações para não se esquecer de nada",
                    style: AppTheme.textStyles.title,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              if (controller.state is LoginStateLoading) ...[
                CircularProgressIndicator(),
              ] else if (controller.state is LoginStateFailure) ...[
                Text((controller.state as LoginStateFailure).message)
              ] else
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/emoji.png",
                    ),
                    title: Text(
                      "Faça seu login com uma das contas abaixo",
                      style: AppTheme.textStyles.button,
                    ),
                  ),
                ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: SocialButtonWidget(
                  imagePath: "assets/images/google.png",
                  label: "Entrar com Google",
                  onTap: () async {
                    controller.googleSignIn();
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // TODO: precisa fazer configuracao Apple
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
              //   child: SocialButtonWidget(
              //     imagePath: "assets/images/apple.png",
              //     label: "Entrar com Apple",
              //     onTap: () async {
              //       final credential =
              //           await SignInWithApple.getAppleIDCredential(
              //         scoopes: [
              //           AppleIDAuthorizationScopes.email,
              //           AppleIDAuthorizationScopes.fullName,
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
