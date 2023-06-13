import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_arth_app/reception/qrcode_scan.dart';

import '../widgets/app_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Image(image: AssetImage('assets/images/Logo.png')),               
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 17),
                  child: AppButton(
                    backgroundColor: Color.fromARGB(255, 45, 73, 76),
                    textColor: Colors.white,
                    text: "CHECK-IN",
                    minSize: 185,
                    onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QrcodeScan()),
            );
          },
                                    ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child: AppButton(
                      backgroundColor: Color.fromARGB(255, 45, 73, 76),
                      textColor: Colors.white,
                      text: "ECRITURE D'UNE CLE",
                      minSize: 185,
                      onPressed: () =>Navigator.pushNamed(context, '/write-key'),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child: AppButton(
                      backgroundColor: Color.fromARGB(255, 45, 73, 76),
                      textColor: Colors.white,
                      text: "LECTURE D'UNE CLE",
                      minSize: 185,
                      onPressed: () =>Navigator.pushNamed(context, '/read-key'),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child: AppButton(
                      backgroundColor: Color.fromARGB(255, 45, 73, 76),
                      textColor: Colors.white,
                      text: "SIMULATION",
                      minSize: 185,
                      onPressed: () =>Navigator.pushNamed(context, '/simulate-door-open'),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}