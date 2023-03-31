// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mnet_corporate/common/app_helper.dart';
import 'package:mnet_corporate/common/permission_handler.dart';
import 'package:mnet_corporate/constant/form_field_style.dart';
import 'package:mnet_corporate/constant/text_styles.dart';
import 'package:mnet_corporate/generated/l10n.dart';
import 'package:mnet_corporate/views/background_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late OverlayEntry loader;
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  bool showPass = false;
  @override
  void initState() {
    usernameController.text = 'C2737';
    passwordController.text = '12345678';
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loader = AppHelper.overlayLoader(context);
      _handleStartScreen();
    });
    super.initState();
  }

  Future<void> _handleStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    bool isopen = (prefs.getBool('open') ?? false);
    bool isPass = await checkHasPermission(isopen: isopen);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/Ground', (Route<dynamic> route) => false);
    AppHelper.hideLoader(loader);
  }

  Future<bool> checkHasPermission({required bool isopen}) async {
    Overlay.of(context)!.insert(loader);
    bool ispass = await PermissionHandler().requestPermission();
    AppHelper.hideLoader(loader);
    return ispass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundGenerator(
            context: context,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).title,
                          style: getHeaderStyle(context),
                        ),
                        Text(
                          S.of(context).title,
                          style: getSubHeaderStyle(context),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        FormFieldStyle(
                          controller: usernameController,
                          label: 'Username',
                          hint: 'Enter your username',
                        ),
                        SizedBox(
                          height: minHeight,
                        ),
                        FormFieldStyle(
                          controller: passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (showPass) {
                                  showPass = false;
                                } else {
                                  showPass = true;
                                }
                              });
                            },
                            child: !showPass
                                ? const Icon(
                                    Icons.visibility,
                                    color: Color(0xff538234),
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff538234),
                                  ),
                          ),
                          obcureText: showPass,
                        ),
                        SizedBox(
                          height: minHeight * 3,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              AppHelper.hideLoader(loader);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              disabledForegroundColor:
                                  Colors.amber.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.amber.withOpacity(0.12),
                            ),
                            child: const Text('Sign In'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).version,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        S.of(context).copy_right,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
