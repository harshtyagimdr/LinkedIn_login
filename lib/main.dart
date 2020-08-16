import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linkedloginflutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linkedin Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
     
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String redirectUrl = 'https://github.com/harshtyagimdr';
  final String clientId = 'xxxxxxxxxxxxxxx';
  final String clientSecret = 'xxxxxxxxxxxx';

  @override
  void initState() {
    LinkedInLogin.initialize(context,
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUri: redirectUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            onPressed: () {
              LinkedInLogin.loginForAccessToken(
                      destroySession: true,
                      appBar: AppBar(
                        title: Text('Demo Login Page'),
                      ))
                  .then((accessToken) => print(accessToken))
                  .catchError((error) {
                print(error.errorDescription);
              });
            },
            child: Text('Get AccessToken'),
          ),
          RaisedButton(
            onPressed: () {
              LinkedInLogin.getProfile(
                      destroySession: true,
                      forceLogin: true,
                      appBar: AppBar(
                        title: Text('Demo Login Page'),
                      ))
                  .then((profile) => print(profile.toJson().toString()))
                  .catchError((error) {
                print(error.errorDescription);
              });
            },
            child: Text('Get Profile'),
          ),
          RaisedButton(
            onPressed: () {
              LinkedInLogin.getEmail(destroySession: true)
                  .then((email) => print(email.toJson().toString()))
                  .catchError((error) {
                print(error.errorDescription);
              });
            },
            child: Text('Get Email'),
          ),
        ]),
      ), 
    );
  }
}