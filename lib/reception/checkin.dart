import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/reservations.dart';
import '../url.dart';

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
    print(widget.reservationId);
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          child: const Text("Informations de la réservation")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Container(
                          width: 200,
                          child: Table(
                              defaultColumnWidth: FixedColumnWidth(100),
                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Text('Numéro de réservation',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                  Column(children: [
                                    Text(widget.reservationId,
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Nombre de chambre',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                  Column(children: [
                                    Text("reservation",
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Check-in',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                  Column(children: [
                                    Text('23/06/2023',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Check-out',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                  Column(children: [
                                    Text('26/06/2023',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Montant',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                  Column(children: [
                                    Text('210€',
                                        style: TextStyle(fontSize: 20.0))
                                  ]),
                                ]),
                              ])),
                    ),
                  ],
                );
              } else {
                return Text(widget.reservationId);
              }
            }));
  }
}
