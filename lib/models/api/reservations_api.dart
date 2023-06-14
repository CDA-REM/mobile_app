import 'dart:convert';

import 'package:http/http.dart' as http;

import '../reservation.dart';

class ReservationsApi {

  Future<List<Reservation>> getReservations() async {
    var response = await http
    .get(Uri.parse('http://192.168.1.59:8000/api/reservations'));

    return reservationFromJson(response.body);
  }
}