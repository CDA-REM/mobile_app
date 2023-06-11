import 'package:flutter/material.dart';
import 'package:hotel_arth_app/Services/qr_code.dart';

// ignore: must_be_immutable
class ReservationInfos extends StatefulWidget {
  const ReservationInfos({super.key});

  @override
  State<ReservationInfos> createState() => _ReservationInfosState();
}

class _ReservationInfosState extends State<ReservationInfos> {
  var qrcode = QrCode();

  // Map<String, String> id = {};

  @override
  Widget build(BuildContext context) {
    // id = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: const Text('Scanner QR code'),
        ),
        body: Column(
          children: [Text(qrcode.id as String)],
        ));
  }
}

// final arguments = 
//   ModalRoute.of(context)!.settings.arguments as Map<String, String>; 
// print(argumets[‘email’] ?? “Default value”);