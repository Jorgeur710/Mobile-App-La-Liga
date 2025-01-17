class Player {
    int id;
    String name;
    String position;
    String dateOfBirth;
    String nationality;

    Player({
        required this.id,
        required this.name,
        required this.position,
        required this.dateOfBirth,
        required this.nationality,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        position: json["position"] ?? "",
        dateOfBirth: json["dateOfBirth"] ?? "",
        nationality: json["nationality"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "dateOfBirth": dateOfBirth,
        "nationality": nationality,
    };
}