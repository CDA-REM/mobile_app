

import 'package:flutter/material.dart';
import 'package:hotel_arth_app/screens/widgets/top_app_bar.dart';

class SelectRoom extends StatelessWidget {
  const SelectRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArthTopAppBar(title: "Ecriture d'une clé"));
  }
}