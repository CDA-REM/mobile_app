// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';
import 'package:hotel_arth_app/models/option.dart';

List<Reservation> reservationFromJson(String str) => List<Reservation>.from(
    json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationToJson(List<Reservation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservation {
  int id;
  int userId;
  String userGender;
  String userName;
  int numberOfPeople;
  DateTime startedDate;
  DateTime endDate;
  dynamic checkin;
  dynamic checkout;
  double price;
  String stayType;
  String status;
  List<Room>? rooms;
  List<Option>? options;

  Reservation({
    required this.id,
    required this.userId,
    required this.userGender,
    required this.userName,
    required this.numberOfPeople,
    required this.startedDate,
    required this.endDate,
    this.checkin,
    this.checkout,
    required this.price,
    required this.stayType,
    required this.status,
    this.rooms,
    this.options,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        userId: json["user_id"],
        userGender: json["user_gender"],
        userName: json["user_name"],
        numberOfPeople: json["number_of_people"],
        startedDate: DateTime.parse(json["started_date"]),
        endDate: DateTime.parse(json["end_date"]),
        checkin: json["checkin"],
        checkout: json["checkout"],
        price: json["price"]?.toDouble(),
        stayType: json["stay_type"],
        status: json["status"],
        rooms: json['rooms'] == null
            ? []
            : List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        options: json["options"] == null
            ? []
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_gender": userGender,
        "user_name": userName,
        "number_of_people": numberOfPeople,
        "started_date": startedDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "checkin": checkin,
        "checkout": checkout,
        "price": price,
        "stay_type": stayType,
        "status": status,
        "rooms": rooms == null
            ? []
            : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Room {
  int id;
  int? roomNumber;
  String? style;
  int? price;

  Room({
    required this.id,
    this.roomNumber,
    this.style,
    this.price,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        roomNumber: json["room_number"],
        style: json["style"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "style": style,
        "price": price,
      };
}
