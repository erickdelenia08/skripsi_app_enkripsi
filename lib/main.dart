import 'package:app_enrkipsi/cryptography.dart';
import 'package:app_enrkipsi/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Image(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  image: AssetImage('assets/logo_unej.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 20,bottom: 20,
                  left: MediaQuery.of(context).size.width / 8,
                  right: MediaQuery.of(context).size.width / 8),
              child: Text(
                'PENGAMANAN TEKS DENGAN KOMBINASI METODE ELECTRONIC CODE BOOK DAN KODE SEVEN SEGMENT DISPLAY',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.w800),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SecondPage();
                }));
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 28,
            width: MediaQuery.of(context).size.width,
            color: Colors.amberAccent,
            child: Text(
              'Copyright by Erick Delenia',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Monserrat',
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ));
  }
}
