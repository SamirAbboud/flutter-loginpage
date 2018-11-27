import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

}

class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();

}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 300)
    );
    _animation = new CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut
    );
    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Theme(
              data: new ThemeData(
                brightness: Brightness.dark,
                inputDecorationTheme: new InputDecorationTheme(
                  labelStyle: new TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 25.0
                  ),
                )
              ),
              isMaterialAppTheme: true,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlutterLogo(
                    size: _animation.value * 100,
                  ),

                  Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Form(
                      autovalidate: true,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Email",
                                fillColor: Colors.white
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Password",
                                fillColor: Colors.white
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 60.0)),

                          new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.green,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: new Icon(Icons.keyboard_arrow_right),
                              onPressed: () {})

                        ],
                      ),
                    ),
                  )
                ],
              ),)
        ],
      ),

    );
  }


}