// To parse this JSON data, do
//
//     final reservations = reservationsFromJson(jsonString);

import 'dart:convert';

Reservations reservationsFromJson(String str) => Reservations.fromJson(json.decode(str));

String reservationsToJson(Reservations data) => json.encode(data.toJson());

class Reservations {
    List<Reservation> data;

    Reservations({
        required this.data,
    });

    factory Reservations.fromJson(Map<String, dynamic> json) => Reservations(
        data: List<Reservation>.from(json["data"].map((x) => Reservation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

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

class Option {
    int id;
    OptionName optionName;
    int optionPrice;
    OptionPivot pivot;

    Option({
        required this.id,
        required this.optionName,
        required this.optionPrice,
        required this.pivot,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        optionName: OptionName.fromJson(json["option_name"]),
        optionPrice: json["option_price"],
        pivot: OptionPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "option_name": optionName.toJson(),
        "option_price": optionPrice,
        "pivot": pivot.toJson(),
    };
}

class OptionName {
    String fr;
    String en;

    OptionName({
        required this.fr,
        required this.en,
    });

    factory OptionName.fromJson(Map<String, dynamic> json) => OptionName(
        fr: json["fr"],
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "fr": fr,
        "en": en,
    };
}

class OptionPivot {
    int reservationId;
    int optionId;

    OptionPivot({
        required this.reservationId,
        required this.optionId,
    });

    factory OptionPivot.fromJson(Map<String, dynamic> json) => OptionPivot(
        reservationId: json["reservation_id"],
        optionId: json["option_id"],
    );

    Map<String, dynamic> toJson() => {
        "reservation_id": reservationId,
        "option_id": optionId,
    };
}

class Room {
    int id;
    int roomNumber;
    Style style;
    int price;
    RoomPivot pivot;

    Room({
        required this.id,
        required this.roomNumber,
        required this.style,
        required this.price,
        required this.pivot,
    });

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        roomNumber: json["room_number"],
        style: styleValues.map[json["style"]]!,
        price: json["price"],
        pivot: RoomPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "style": styleValues.reverse[style],
        "price": price,
        "pivot": pivot.toJson(),
    };
}

class RoomPivot {
    int reservationId;
    int roomId;

    RoomPivot({
        required this.reservationId,
        required this.roomId,
    });

    factory RoomPivot.fromJson(Map<String, dynamic> json) => RoomPivot(
        reservationId: json["reservation_id"],
        roomId: json["room_id"],
    );

    Map<String, dynamic> toJson() => {
        "reservation_id": reservationId,
        "room_id": roomId,
    };
}

enum Style { CLASSIC, ROYAL, LUXURY }

final styleValues = EnumValues({
    "classic": Style.CLASSIC,
    "luxury": Style.LUXURY,
    "royal": Style.ROYAL
});

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