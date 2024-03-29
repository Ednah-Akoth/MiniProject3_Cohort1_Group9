import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:job_application/src/features/authentication/screens/welcome/reset_password.dart';
import 'package:job_application/src/features/authentication/screens/welcome/sign_up1.dart';
import 'package:email_validator/email_validator.dart';
import '../../../../constants/colors.dart';
import '../../controllers/auth_service.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false; //to set loader
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 249, 1),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Hi, Welcome Back! 👋",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(112, 41, 99, 10)),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1,
                          color: Colors.black54,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Or',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Email',
                      style: TextStyle(fontSize: 15),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!EmailValidator.validate(
                          emailController.text.trim())) {
                        return "Invalid Email";
                      } else if (value!.isEmpty) {
                        return "Email required";
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Enter your Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: tPrimaryColor,
                        )),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Password',
                      style: TextStyle(fontSize: 15),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be greater than 6 characters";
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Enter your Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: tPrimaryColor,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "forgot password?",
                          style:
                              TextStyle(fontSize: 15, color: tTextAccentColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: loading
                      ? CircularProgressIndicator()
                      : Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(112, 41, 99, 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                if (emailController.text == "" ||
                                    passwordController.text == "") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("All fields are required"),
                                    backgroundColor: Colors.redAccent,
                                  ));
                                } else {
                                  try {
                                    User? result = await AuthService().login(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        context);
                                  } catch (error) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("${error.toString()}"),
                                      backgroundColor: Colors.redAccent,
                                    ));
                                  }
                                }
                                setState(() {
                                  loading = false;
                                });
                              },
                              child: Text("Login")),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Don’t have an account?'),
                    TextButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => EmailSignup()),
                            ));
                      }),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(112, 41, 99, 10)),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('By signing up you agree to our'),
                    TextButton(
                      child: const Text(
                        'Terms and Conditions of Use',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(112, 41, 99, 10)),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
