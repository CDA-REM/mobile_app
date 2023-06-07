import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  MaterialColor darkgreen = const MaterialColor(0xFF2D494C, <int, Color>{
      50: Color(0xFF2D494C),
      100: Color(0xFF2D494C),
      200: Color(0xFF2D494C),
      300: Color(0xFF2D494C),
      400: Color(0xFF2D494C),
      500: Color(0xFF2D494C),
      600: Color(0xFF2D494C),
      700: Color(0xFF2D494C),
      800: Color(0xFF2D494C),
      900: Color(0xFF2D494C),
    },
  );
  MaterialColor lightgreen = const MaterialColor(0xFFECF2F0, <int, Color>{
      50: Color(0xFFECF2F0),
      100: Color(0xFFECF2F0),
      200: Color(0xFFECF2F0),
      300: Color(0xFFECF2F0),
      400: Color(0xFFECF2F0),
      500: Color(0xFFECF2F0),
      600: Color(0xFFECF2F0),
      700: Color(0xFFECF2F0),
      800: Color(0xFFECF2F0),
      900: Color(0xFFECF2F0),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: darkgreen,
        textTheme:  TextTheme(
          bodyLarge: GoogleFonts.getFont('Roboto'),
          headlineLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/images/Logo.png')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 17),
                  child:  _button("CHECK-IN", Color.fromARGB(255, 45, 73, 76)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child:  _button("ECRITURE D'UNE CLE", Color.fromARGB(255, 45, 73, 76)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child:  _button("LECTURE D'UNE CLE", Color.fromARGB(255, 45, 73, 76)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                  child:  _button("SIMULATION", Color.fromARGB(255, 45, 73, 76)),
                ),
                
                
              ],
            )
          ],
        ),
      ),
     
    );
  }
   _button(String text, Color color) {
    return MaterialButton(
      onPressed: () => print("hello"),
      minWidth: 185,
      shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4))),
      textColor: Colors.white,
      color: color,
      child: Text(text)
    );
  }
}
