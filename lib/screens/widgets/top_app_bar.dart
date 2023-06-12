import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ArthTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const ArthTopAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading : Icon(Icons.arrow_back),
      title: Text(title),
      actions:[
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/images/logo_white.png')),
        onPressed: () {},
        )
      ]
    );
  }
}