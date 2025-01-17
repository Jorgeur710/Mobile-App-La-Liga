import 'package:ejemplo_t4/config/router/app_router.dart';
import 'package:ejemplo_t4/models/player_model.dart';
import 'package:ejemplo_t4/provider/team_provider.dart';
import 'package:ejemplo_t4/services/team_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String nombre = '';
    String nacionalidad = '';
    String posicion = '';
    bool bandera = false;
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.people_outline,
            color: Colors.green,
            size: 150,
          )),
          Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    label: "Nombre Jugador",
                    onChanged: (value) => nombre = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    label: "Nacionalidad",
                    onChanged: (value) => nacionalidad = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    label: "Posicion",
                    onChanged: (value) => posicion = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton.tonalIcon(
                      onPressed: () {
                        final teamProvider = Provider.of<TeamProvider>(context,listen: false);
                        // teamProvider.addPlayer(Player(name: nombre, position: posicion, nationality: nacionalidad));
                        context.pop();
                      },
                      icon: const Icon(Icons.save_outlined),
                      label: const Text("Guardar Jugador")),
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            context.pushReplacement('/');
          }),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errormessage;
  final Function(String)? onChanged;
  final Icon? icon;
  final String? Function(String?)? validator;
  final bool? obscureText;
  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errormessage,
      this.onChanged,
      this.validator,
      this.obscureText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(20));
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: icon,
        prefixIconColor: colors.primary,
        errorText: errormessage,
      ),
    );
  }
}
