import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clon/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();
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
        title: Text('Login Page'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          //Se estarán agregando los widget que se mostraran en el LoginPage
          children: [
            _bannerApp(),
            _textDescription(),
            _textLogin(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _textDontHaveAccount() //tetxo para iniciar sesion
          ],
        ),
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
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
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Fácil y Rápido',
              style: TextStyle(
                  color: Colors.black, fontSize: 30, fontFamily: "Roboto"),
            )
          ],
        ),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Continua con tu',
        style: TextStyle(color: Colors.black54, fontSize: 24),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  } //Termina TextLogin

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
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

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
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

  Widget _buttonLogin() {
    return Container(
      width: double.infinity, //Expander en todo lo ancho
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed:
            _con.login, //Se asocia el método que se debe disparar con onPressed
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

  Widget _textDontHaveAccount() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: _con.goToRegistroPage,
              child: Text(
                'No tienes cuenta',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
            )
          ],
        ));
  }
}
