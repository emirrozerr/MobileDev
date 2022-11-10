import 'package:flutter/material.dart';

class LoginExample extends StatefulWidget {
  const LoginExample({super.key});

  @override
  _LoginExampleState createState() => _LoginExampleState();
}

class _LoginExampleState extends State<LoginExample> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return ListView(
              children: <Widget>[
                FlutterLogo(
                  size: orientation == Orientation.portrait ? 200.0 : 100.0,
                ),
                SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "phone"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "password"),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text("Signin"),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text("Signup"),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Center(child: Text("need help ?"))
              ],
            );
          },
        ),
      ),
    );
  }
}