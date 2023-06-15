import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hotel_arth_app/screens/write_key/write_key.dart';

import '../../models/reservations.dart';
import '../widgets/app_buttons.dart';

class ReservationRoomCard extends StatelessWidget {
  const ReservationRoomCard({super.key, required this.reservation, required this.room});

  final Reservation reservation;
  final Room room;
  final int roomId = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('assets/images/Logo.png')),
        Text("Choix d'une chambre"),

        Row(children: [
          Text(room.style!),
          Text("Aucune clé")
        ],),

        Text(reservation.id.toString()),

        Row(children: [
          AppButton(
            backgroundColor: Color.fromARGB(255, 45, 73, 76),
            textColor: Colors.white,
            text: "CREER UNE CLE",
            minSize: 185,
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                            builder: (context) => const WriteKey()));
              },
                        ),
          Text(room.roomNumber.toString())
        ])
      ],
    );
  }
}