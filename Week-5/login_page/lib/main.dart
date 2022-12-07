import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;


  final email = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Image.asset("images/loginPageImage.jpg",
              fit: BoxFit.cover, height: 400),
          Container(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.00, left: 30.00, right: 30.00),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              style: BorderStyle.solid,
                            )),
                            label: Text('Email',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            hintText: 'giga@gmail.com'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              style: BorderStyle.solid,
                            )),
                            label: Text('Password',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold)),
                            hintText: '*********'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 15, top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          RawMaterialButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await Future.delayed(const Duration(seconds: 2));
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.of(context)
                                  .push(_newRoute(email.text, password.text));
                            },
                            elevation: 2.0,
                            fillColor: Colors.pink[700],
                            padding: const EdgeInsets.all(15.0),
                            shape: const CircleBorder(),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15,top: 60),
                          child: Text(
                            "Sign Up",
                            style:
                                TextStyle(decoration: TextDecoration.underline,
                                    color: Colors.grey[700]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15,top: 60),
                          child: Text(
                              "Forgot Password",
                              style:
                                  TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.grey[700]
                                  ),
                            ),
                        ),

                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

Route _newRoute(String email, String password) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondPage(
      email: email,
      password: password,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class SecondPage extends StatelessWidget {
  final String email;
  final String password;
  const SecondPage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 30,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: CircleBorder(),
                  fillColor: Colors.pink[700],
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Email: $email\nPassword: $password"),
            ],
          ),
      ],
    ));
  }
}
