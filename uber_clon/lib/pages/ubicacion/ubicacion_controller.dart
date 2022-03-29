import 'package:flutter/material.dart';

class UbicacionController {
  BuildContext context;
  //Se crean objetos controladores para cada TextField
  

  Future init(BuildContext context) {
    this.context = context;
  }

   void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }
  



}
