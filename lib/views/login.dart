import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_api_provider/provider/auth_provider.dart';
import 'package:flutter_api_provider/widgets/loading_view.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> keyForm = GlobalKey();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Container(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Form(
          key: keyForm,
          child: ListView(
            children: [
              CustomTextField(
                textC: emailC,
                hintText: "Email",
                icon: Icons.mail_outline_rounded,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                textC: passwordC,
                hintText: "Password",
                icon: Icons.security,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<AuthProvider>(builder: (context, prov, _) {
                return prov.isLoading
                    ? loadingView
                    : CustomButton(
                        title: "LOGIN",
                        onTap: () {
                          bool isValid = keyForm.currentState!.validate();
                          if (isValid) {
                            prov.login(
                                email: emailC.text, password: passwordC.text);
                          }
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
