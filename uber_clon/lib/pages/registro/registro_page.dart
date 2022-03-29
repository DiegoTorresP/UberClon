import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clon/pages/registro/registro_controller.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  //Conrolador
  RegistroController _con = new RegistroController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          //Se estarán agregando los widget que se mostraran en el LoginPage
          children: [
            _bannerApp(),
            _textDescription(),
            _textFielNombre(),
            _textFielApellido(),
            _textFielemail(),
            _textFielPassword(),
            _textFielCiudad(),
            _textFielCodigo(),
            _lista(), 
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Column(
          children: [
            GestureDetector(
              onTap: _con.goToLoginPage,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.white70, Colors.grey]),
                ),
                height: MediaQuery.of(context).size.height * .2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/img/uber_flutter.png',
                      width: 100,
                      height: 50,
                    ),
                    Text(
                      '¿Ya tienes una cuenta?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: "Roboto"),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Crea una cuenta nueva',
        style: TextStyle(color: Colors.black54, fontSize: 24),
      ),
    );
  }

  Widget _textFielNombre() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: TextField(
        controller: _con.nombreController,
        decoration: InputDecoration(
            labelText: 'Nombre',
            suffix: Icon(
              Icons.email_outlined,
              color: Colors.black54,
            )),
      ),
    );
  }

  //Widget para apellido
  Widget _textFielApellido() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: TextField(
        controller: _con.apellidoController,
        decoration: InputDecoration(
            labelText: 'Apellido',
            suffix: Icon(
              Icons.email_outlined,
              color: Colors.black54,
            )),
      ),
    );
  }

  //Widget para email
  Widget _textFielemail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            hintText: 'correo@gmail.com',
            labelText: 'Correo Electrónico',
            suffix: Icon(
              Icons.email_outlined,
              color: Colors.black54,
            )),
      ),
    );
  }

  //Widget para contraseñaa
  Widget _textFielPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffix: Icon(
              Icons.lock_clock_outlined,
              color: Colors.black54,
            )),
      ),
    );
  }

  //Widget para ciudad
  Widget _textFielCiudad() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: TextField(
        controller: _con.ciudadController,
        decoration: InputDecoration(
            labelText: 'Ciudad',
            suffix: Icon(
              Icons.lock_clock_outlined,
              color: Colors.black54,
            )),
      ),
    );
  }

  var _datos = ["Amigos", "Familiares", "Internet"];
  String _vista = "Como te enteraste acerca de nuestra app";
  Widget _lista() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: DropdownButton(
        items: _datos.map((String a){
          return DropdownMenuItem(
            value: a,
            child: Text(a));
        }).toList(),
        onChanged: (_){},
        hint: Text(_vista),
      )
    );
  }

  //Widget para codigo
  Widget _textFielCodigo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 240, 240)
      ),
      child: TextField(
        controller: _con.codigoController,
        decoration: InputDecoration(
            labelText: '(Opcional) Codigo de Invitacion',
            suffix: Icon(
              Icons.lock_clock_outlined,
              color: Colors.black54,
            )),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity, //Expander en todo lo ancho
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20) ,
      child: ElevatedButton(
        onPressed:
            _con.registro, //Se asocia el método que se debe disparar con onPressed
        child: Stack(//Pila de widget
            children: [
          //Arreglo de widgest
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text("Iniciar sesion", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                child: Icon(Icons.arrow_forward_ios),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                radius: 25,
              ),
            ),
          )
        ]),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
      ),
    );
  }

}
