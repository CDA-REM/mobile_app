import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/reservations.dart';
import '../../url.dart';

class Checkin extends StatefulWidget {
  const Checkin({super.key, required this.reservationId});
  final String reservationId;

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  late Future<Reservation> reservation;

  Future<Reservation> getReservationsById() async {
    var url = AppURL.url;
    var id = (widget.reservationId);
    var urlToCall = Uri.parse('${url}api/reservations/$id');
    var response = await http.get(urlToCall);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Reservation.fromJson(json["data"]);
    } else {
      throw Exception('Erreur au chargement de la réservation');
    }
  }

  @override
  void initState() {
    reservation = getReservationsById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: const Text('Scanner QR code'),
        ),
        body: FutureBuilder(
            future: reservation,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: const Text("Informations de la réservation")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Column(
                        children: [
                          Text(
                              'Numéro de réservation: ${widget.reservationId}'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Text(
                                'Nombre de chambre : ${snapshot.data!.rooms.length}'),
                          ),
                          Text('Madame Lucile Cost'),
                          Text(
                              'Nombre de personnes : ${snapshot.data!.numberOfPeople}'),
                          Text('Date d\'arrivée : ${snapshot.data!.checkin}'),
                          Text('Date de départ : ${snapshot.data!.checkout}'),
                          Text('Montant : ${snapshot.data!.price}'),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Text(widget.reservationId);
              }
            }));
  }
}
