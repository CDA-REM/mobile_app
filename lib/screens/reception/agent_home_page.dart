import 'package:flutter/material.dart';
import 'package:hotel_arth_app/reception/qrcode_scan.dart';
import '../widgets/home_page_button.dart';
import '../write_key/rooms_with_chekins.dart';

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
                HomePageButton(
                    title: "CHECK-IN",
                    materialPageRoute: MaterialPageRoute(
                        builder: (context) => const QrcodeScan())),
                HomePageButton(
                    title: "ECRITURE D'UNE CLE",
                    materialPageRoute: MaterialPageRoute(
                        builder: (context) => const SelectRoom())),

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                //   child: AppButton(
                //       backgroundColor: Color.fromARGB(255, 45, 73, 76),
                //       textColor: Colors.white,
                //       text: "LECTURE D'UNE CLE",
                //       minSize: 185,
                //       onPressed: () =>Navigator.pushNamed(context, '/read-key'),),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                //   child: AppButton(
                //       backgroundColor: Color.fromARGB(255, 45, 73, 76),
                //       textColor: Colors.white,
                //       text: "SIMULATION",
                //       minSize: 185,
                //       onPressed: () =>Navigator.pushNamed(context, '/simulate-door-open'),),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
