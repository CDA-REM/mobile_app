import 'package:flutter/material.dart';
import 'package:hotel_arth_app/screens/widgets/top_app_bar.dart';

import '../../models/api/reservations_api.dart';
import '../../models/reservations.dart';

class SelectRoom extends StatefulWidget {
  const SelectRoom({super.key});

  @override
  State<SelectRoom> createState() => _SelectRoomState();
}

class _SelectRoomState extends State<SelectRoom> {
  late Future<List<Reservation>> reservations;

  @override
  void initState() {
    super.initState();
    reservations = ReservationsApi().getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ArthTopAppBar(title: "Ecriture d'une clé"));
  }
}
