import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotel_arth_app/models/reservations.dart';
import 'package:hotel_arth_app/url.dart';
import 'package:http/http.dart' as http;

class Checkin extends StatefulWidget {
  const Checkin({super.key, required this.reservationId});
  final String reservationId;

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  late Future<Reservation> reservation;

  Future<Reservation> getReservationById() async {
    var url = AppURL.url;
    var id = (widget.reservationId);
    var urlToCall = Uri.parse('${url}api/reservations/$id');
    var response = await http.get(urlToCall);

    if (response.statusCode == 200) {
      return Reservation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur au chargement de la réservation');
    }
  }

  @override
  void initState() {
    reservation = getReservationById();
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
                          Text(
                              'Date d\'arrivée : ${snapshot.data!.startedDate}'),
                          Text('Date de départ : ${snapshot.data!.endDate}'),
                          Text('Montant : ${snapshot.data!.price}'),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
