import 'package:flutter/material.dart';
import 'package:hotel_arth_app/screens/widgets/top_app_bar.dart';
import 'package:hotel_arth_app/screens/write_key/reservation_room_card.dart';

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
    return Scaffold(
      appBar: ArthTopAppBar(title: "Ecriture d'une clé"),
      body: FutureBuilder(
          future: reservations,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      for (Room room in snapshot.data![index].rooms!) {
                        return ReservationRoomCard(reservation: snapshot.data![index], room: room);
                      }
                    });
              // return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          })));
  }
}
