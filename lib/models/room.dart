// import 'package:hotel_arth_app/models/reservation.dart';

import 'package:hotel_arth_app/models/reservation.dart';

class Room {
    int id;
    int roomNumber;
    Style style;
    int price;

    Room({
        required this.id,
        required this.roomNumber,
        required this.style,
        required this.price,
    });

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        roomNumber: json["room_number"],
        style: styleValues.map[json["style"]]!,
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "style": styleValues.reverse[style],
        "price": price,
    };
}

enum Style { CLASSIC, ROYAL, LUXURY }

final styleValues = EnumValues({
    "classic": Style.CLASSIC,
    "luxury": Style.LUXURY,
    "royal": Style.ROYAL
});
