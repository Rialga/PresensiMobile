import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String name, password;
  DashboardPage({@required this.name, @required this.password});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[400],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  'Nama: ' + name + 'Pasword: ' + password,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 40,
                margin: const EdgeInsets.only(top: 16),
                child: RaisedButton(
                  color: Colors.yellow[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
