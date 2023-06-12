import 'dart:convert';

import 'package:http/http.dart' as http;

import '../reservations.dart';

class ReservationsApi {

  Future<List<Reservation>> getReservations() async {
    var response = await http
    .get(Uri.parse('https://localhost:8000/api/reservations'));

    return Reservations.fromJson(jsonDecode(response.body)).data;
  }
}