import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:telegram_new/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool visi = true;

  final formKey = GlobalKey<FormState>();

  final prefPhone = '8592943588';
  final prefPassword = 'abhin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 224, 239),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 89, 161, 220),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(2, 3),
                )
              ],
            ),
            height: 400,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone number',
                          filled: true,
                          fillColor: Color.fromARGB(255, 225, 224, 224),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your phone number';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            filled: true,
                            fillColor: Color.fromARGB(255, 225, 224, 224),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Password';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: !visi,
                        child: const Text(
                          'Entered wrong phone number or password',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            checkLogin(context);
                          }
                        },
                        child: const Text('Login'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkLogin(BuildContext ctx) async {
    var phone = phoneController.text;
    var password = passwordController.text;

    if (phone == prefPhone && password == prefPassword) {
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool('loginKey', true);
      // ignore: use_build_context_synchronously
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    } else {
      setState(() {
        visi = false;
      });
    }
  }
}
