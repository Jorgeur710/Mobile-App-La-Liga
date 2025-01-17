// To parse this JSON data, do
//
//     final teamResponse = teamResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ejemplo_t4/models/player_model.dart';

TeamResponse teamResponseFromJson(String str) => TeamResponse.fromJson(json.decode(str));

class TeamResponse {
    List<Team> teams;

    TeamResponse({
        required this.teams,
    });

    factory TeamResponse.fromJson(Map<String, dynamic> json) => TeamResponse(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
    );
}

class Team {
    int id;
    String name;
    String shortName;
    String crest;
    List<Player> squad;


    Team({

        required this.id,
        required this.name,
        required this.shortName,
        required this.crest,
        required this.squad,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        crest: json["crest"],
        squad: List<Player>.from(json["squad"].map((x) => Player.fromJson(x))),

    );
}


