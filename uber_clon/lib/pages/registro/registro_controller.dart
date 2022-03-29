import 'package:flutter/material.dart';

class RegistroController{
  BuildContext context;
  //Objetos para contoladores de cada TextField
  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController ciudadController = new TextEditingController();
  TextEditingController codigoController = new TextEditingController();
  

void registro() {
    String nombre = nombreController.text;
    String apellido = apellidoController.text;
    String email = emailController.text;
    String telefono = telefonoController.text;
    String password = passwordController.text;
    String ciudad = ciudadController.text;
    String codigo = codigoController.text;

    print('Nombre: $nombre, Apellido: $apellido');
  }

Future init(BuildContext context) {
    this.context = context;
  }

   void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }
}