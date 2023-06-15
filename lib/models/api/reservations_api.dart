import 'dart:convert';

import 'package:hotel_arth_app/url.dart';
import 'package:http/http.dart' as http;

import '../reservations.dart';

class ReservationsApi {
  var url = AppURL.url;

  Future<List<Reservation>> getReservations() async {
    var response = await http.get(Uri.parse('${url}api/reservations'));

    return List<Reservation>.from(jsonDecode(response.body));
  }
}
