import 'package:ejemplo_t4/config/router/app_router.dart';
import 'package:ejemplo_t4/provider/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamProvider(),
      child: MaterialApp.router(
        title: 'Ejemplo provider',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.green),
      ),
    );
  }
}