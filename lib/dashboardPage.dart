import 'package:flutter/material.dart';
import 'package:persensi/loginPage.dart';
import 'model/presensiHistory.dart';

class DashboardPage extends StatefulWidget {
  final String name, password;
  DashboardPage({@required this.name, @required this.password});
  static const double _appBarBottomBtnPosition = 24.0;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

//change bottomBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pop(context);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.cyan[400],
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.name),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                background: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/Logo.png',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Align(
                          alignment: Alignment.topRight,
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              new Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'History Presensi',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // List Data
              new Center(
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: null == historyList ? 0 : historyList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 16),
                      width: 480,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.cyan[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(0, 3),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date    : ' + historyList[index].date,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Time    :  ' + historyList[index].time,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Status : Terlambat' +
                                      historyList[index].status,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              right: 20,
                            ),
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
