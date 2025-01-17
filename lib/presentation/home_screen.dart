import 'package:ejemplo_t4/config/router/app_router.dart';
import 'package:ejemplo_t4/models/player_model.dart';
import 'package:ejemplo_t4/models/team_response.dart';
import 'package:ejemplo_t4/provider/team_provider.dart';
import 'package:ejemplo_t4/services/team_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teamResponse = Provider.of<TeamProvider>(context);
    return Scaffold(
      body: (teamResponse.teams == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _HomeView(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.push('/add');
          }),
    );
  }
}

class _HomeView extends StatelessWidget {
  _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TeamsView(),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.black
              )
            )
          ),
        ),
        PlayersView(),
      ],
    );
  }
}
class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    TeamProvider teamProvider = Provider.of<TeamProvider>(context); 
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      child: ListView.builder(
        itemCount: teamProvider.teams!.teams.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              teamProvider.updateSelectedTeam(teamProvider.teams!.teams[index].id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(teamProvider.teams!.teams[index].crest),
            ),
          );
        },
      ),
    );
  }
}

class PlayersView extends StatelessWidget {
  const PlayersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TeamProvider teamProvider = Provider.of<TeamProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.8,
      child: (teamProvider.team== null)
      ? Container()
      : ListView.separated(
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[150],
              child: Text(teamProvider.team!.squad[index].position.substring(0, 3)),
            ),
            title: Text('${teamProvider.team!.squad[index].name}'),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: teamProvider.team!.squad.length,
      ),
    );
  }
}
