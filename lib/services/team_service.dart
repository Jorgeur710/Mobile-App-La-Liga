import 'dart:convert';

import 'package:ejemplo_t4/models/player_model.dart';
import 'package:ejemplo_t4/models/team_response.dart';
import 'package:http/http.dart';

class TeamService {
  //Real Madrid 86
  final _uriTeams='https://api.football-data.org/v4/competitions/2014/teams';
  final _uriPost='';
  final String apikey='';
  Future<TeamResponse> getAllTeams()async{
     Response response = await get(Uri.parse(_uriTeams),headers: {
      "X-Auth-Token":apikey
     });
     TeamResponse teams = teamResponseFromJson(response.body);
     print(teams.teams[0].name);
     return teams;
  }


  Future<void> postPlayer(Player player) async{
    Response response = await post(Uri.parse(_uriPost),body: jsonEncode(player.toJson()));
    print(response.body);
  }
}