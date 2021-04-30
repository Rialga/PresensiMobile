import 'package:flutter/material.dart';
import 'dashboardPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _name = TextEditingController();
  final _password = TextEditingController();

  bool _isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[400],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                // Logo
                new Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(
                      '</>',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                ),

                //Text login
                new Container(
                  margin: const EdgeInsets.only(bottom: 30, top: 16),
                  child: Text(
                    'Login to App ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                ),

                // name field
                new Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Nama',
                      contentPadding: const EdgeInsets.only(
                          left: 16.0, bottom: 11.0, right: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),

                //Password field
                new Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                      Stack(alignment: Alignment.centerRight, children: <Widget>[
                    TextField(
                      controller: _password,
                      obscureText: _isHidePassword,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.only(
                            left: 16.0, bottom: 11.0, right: 40),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: _isHidePassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isHidePassword = !_isHidePassword;
                        });
                      },
                      color: Colors.grey[400],
                    ),
                  ]),
                ),

                //Button
                new Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: RaisedButton(
                    color: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      var name = _name.text;
                      var password = _password.text;
                      _password.clear();
                      _name.clear();
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (contex, animation, secondaryAnimation) =>
                                    DashboardPage(name: name, password: password),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              return SlideTransition(
                                position: Tween(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: SlideTransition(
                                  position: Tween(
                                    begin: Offset.zero,
                                    end: const Offset(1.0, 0.0),
                                  ).animate(secondaryAnimation),
                                  child: child,
                                ),
                              );
                            }),
                      );
                    },
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    _name.dispose();
    _password.dispose();
    super.dispose();
  }
}
