import 'package:ejemplo_t4/models/player_model.dart';
import 'package:ejemplo_t4/models/team_response.dart';
import 'package:ejemplo_t4/services/team_service.dart';
import 'package:flutter/material.dart';

class TeamProvider with ChangeNotifier {
  int selectedTeam = -1;
  TeamResponse? teams = null;
  TeamService teamService = TeamService();
  Team? team = null;
  TeamProvider() {
    getTeams();
  }
  // Metodo que llama al servicio para traerse todos los equipos junto a sus jugadores
  Future getTeams() async {
    teams = await teamService.getAllTeams();
    notifyListeners();
  }

  void getTeam() {
    team = teams!.teams.firstWhere((team) => team.id == selectedTeam);
    notifyListeners();
  }

  void updateSelectedTeam(int id){
    selectedTeam = id;
    getTeam();
    notifyListeners();
  }
  // Future addPlayer(Player player) async{
  //   team!.squad.add(player);
  //   await teamService.postPlayer(player);
  //   notifyListeners();
  // }
}
