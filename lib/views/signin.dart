import 'signup.dart';
import 'package:flutter/material.dart';
import 'menu_utama.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String valueUsername = "";
  String valuePassword = "";
  String username = "";
  String password = "";
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set background color to white
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 150, 10, 0),
              width: 5.0,
              height: 5.0,
            ),
            Image.asset("assets/logo.jpg"),
            const Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.teal, fontSize: 14.5),
              decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.teal,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Username',
                  hintStyle: const TextStyle(color: Colors.teal, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.teal)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.teal))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              obscureText: isPasswordVisible ? false : true,
              style: const TextStyle(color: Colors.teal, fontSize: 14.5),
              decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.teal,
                    size: 22,
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 45, maxWidth: 46),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.teal,
                      size: 22,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(color: Colors.teal, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.teal)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                      borderSide: const BorderSide(color: Colors.teal))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_usernameController.text != '' &&
                      _passwordController.text != '') {
                    getCredential();
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Sign In Failed"),
                            content:
                            const Text("Username atau password kosong"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close", style: TextStyle(color: Colors.teal)))
                            ],
                          );
                        });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 13)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  child: Text('Sign Up',
                      style: TextStyle(color: Colors.teal, fontSize: 13)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getCredential() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      bool status = sharedPreferences.getBool("status")!;
      print(status);
      if (status == false) {
        setState(() {
          username = sharedPreferences.getString("username")!;
          password = sharedPreferences.getString("password")!;
        });
        if (username == _usernameController.text &&
            password == _passwordController.text) {
          setState(() {
            sharedPreferences.setBool("status", true);
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return const MenuUtama();
              }));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Sign In Failed"),
                  content: const Text("Username or Password is wrong"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"))
                  ],
                );
              });
        }
      } else {
        _usernameController.clear();
        _passwordController.clear();
      }
    });
  }
}
