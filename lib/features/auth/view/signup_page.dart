import 'package:flutter/material.dart';
import 'package:learn_flutter/core/theme/widgets/custom_text_field.dart';
import 'package:learn_flutter/features/auth/repos/auth_remote_repo.dart';
import 'package:learn_flutter/features/auth/view/login_page.dart';
import 'package:learn_flutter/features/auth/view/widgets/custom_button.dart';
import 'package:learn_flutter/features/auth/view/widgets/custom_with.dart';
import 'package:learn_flutter/features/auth/view/widgets/hero_widget.dart';
import 'package:learn_flutter/features/home/view/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  final Ucontroller = TextEditingController();
  final Pcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    Ucontroller.dispose();
    Pcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeroWidget(text: "Sign"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(hintText: "Email", controller: Ucontroller),

                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Password",
                      controller: Pcontroller,
                      isObscureText: true,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 240, top: 5),
              child: Text(
                "Forget password",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  text: "Sign in",
                  onTap: () {
                    AuthRemoteRepo().signUp(
                      email: Ucontroller.text,
                      password: Pcontroller.text,
                    );
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ),
            ),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.blueGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text("Or sign in with"),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomWith(),
            ),

            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                  // (Route<dynamic> route) => false,
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an Account  ",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Login",

                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
