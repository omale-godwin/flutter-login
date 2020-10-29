import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: loginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() {});
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: AssetImage(
              'assets/afr.jpg',
            ),
            fit: BoxFit.cover,
            color: Colors.black87,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal, fontSize: 20.0
                        )
                      )
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(hintText: "Enter Your Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Enter Your Yourpassword"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                 Padding(
                   padding: const EdgeInsets.only(top: 20.0),
                 ),
                  MaterialButton(
                    color:  Colors.teal,
                    textColor: Colors.white,
                    child: Text('Login In'),
                    onPressed: () => print('login successfuly'),
                  )
                ],
              ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
