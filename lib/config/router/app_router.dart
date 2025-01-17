import 'package:ejemplo_t4/presentation/add_screen.dart';
import 'package:ejemplo_t4/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter( initialLocation: '/', routes: [
  GoRoute(path: '/',
  builder: (context, state) => HomeScreen(),),
  GoRoute(path: '/add',
  builder: (context, state) => AddScreen())
]);