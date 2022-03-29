import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clon/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  //Definir el objeto controlador
  HomeController _con = HomeController();

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _con.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.black45]),
            ),
            child: Column(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * .2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/img/logo_app.png',
                          width: 150,
                          height: 100,
                        ),
                        Text(
                          'Fácil y Rápido',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "Roboto"),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'SELECCIONA TU ROL',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _con.goToLoginPage,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/pasajero.png'),
                    radius: 50,
                    backgroundColor: Colors.grey[700],
                  ),
                ),
                Text(
                  'Cliente',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _con.goToLoginPage,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/driver.png'),
                    radius: 50,
                    backgroundColor: Colors.grey[700],
                  ),
                ),
                Text(
                  'Conductor',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
