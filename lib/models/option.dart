class Option {
    int id;
    String optionName;
    int optionPrice;

    Option({
        required this.id,
        required this.optionName,
        required this.optionPrice,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        optionName: json["option_name"],
        optionPrice: json["option_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "option_name": optionName,
        "option_price": optionPrice,
    };
}