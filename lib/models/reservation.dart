// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

import 'package:hotel_arth_app/models/option.dart';
import 'package:hotel_arth_app/models/room.dart';

List<Reservation> reservationFromJson(String str) => List<Reservation>.from(json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationToJson(List<Reservation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservation {
    int id;
    int userId;
    int numberOfPeople;
    dynamic checkin;
    dynamic checkout;
    dynamic hasOptions;
    double price;
    StayType stayType;
    Status status;
    List<Room> rooms;
    List<Option> options;

    Reservation({
        required this.id,
        required this.userId,
        required this.numberOfPeople,
        required this.checkin,
        required this.checkout,
        this.hasOptions,
        required this.price,
        required this.stayType,
        required this.status,
        required this.rooms,
        required this.options,
    });

    factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        userId: json["user_id"],
        numberOfPeople: json["number_of_people"],
        checkin: json["checkin"],
        checkout: json["checkout"],
        hasOptions: json["has_options"],
        price: json["price"]?.toDouble(),
        stayType: stayTypeValues.map[json["stay_type"]]!,
        status: statusValues.map[json["status"]]!,
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "number_of_people": numberOfPeople,
        "checkin": checkin,
        "checkout": checkout,
        "has_options": hasOptions,
        "price": price,
        "stay_type": stayTypeValues.reverse[stayType],
        "status": statusValues.reverse[status],
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
    };
}

enum Status { VALIDATED, NO_SHOW, TERMINATED, CANCELLED }

final statusValues = EnumValues({
    "cancelled": Status.CANCELLED,
    "no-show": Status.NO_SHOW,
    "terminated": Status.TERMINATED,
    "validated": Status.VALIDATED
});

enum StayType { PRO, PERSONAL }

final stayTypeValues = EnumValues({
    "personal": StayType.PERSONAL,
    "pro": StayType.PRO
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
