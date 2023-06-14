import 'package:flutter/material.dart';
import 'package:hotel_arth_app/screens/widgets/app_buttons.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    super.key,
    required this.title,
    required this.materialPageRoute
  });

  final String title;
  final MaterialPageRoute<dynamic> materialPageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 17),
      child: AppButton(
        backgroundColor: Color.fromARGB(255, 45, 73, 76),
        textColor: Colors.white,
        text: title,
        minSize: 185,
        onPressed: () {
            Navigator.push(
              context,
              materialPageRoute);
          },
                        ),
    );
  }
}