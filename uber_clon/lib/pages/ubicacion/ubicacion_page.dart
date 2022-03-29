import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clon/pages/ubicacion/ubicacion_controller.dart';

class UbicacionPage extends StatefulWidget {
  UbicacionPage({Key key}) : super(key: key);

  @override
  State<UbicacionPage> createState() => _UbicacionPageState();
}

class _UbicacionPageState extends State<UbicacionPage> {
  //Controlador
  UbicacionController _con = new UbicacionController();
  GoogleMapController mapController;

//Metodo para iniciar el mapa
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

//Posicion inicial en la que se iniciara el mapa
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(21.179519, -100.9242073), zoom: 11.5);
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
        title: Text('Ubicación'),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black),
              accountName: Text("Usuario 1"), 
              accountEmail: Text("usuario@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("U",),
              ),
              ),
            ListTile(
              title: const Text('Buscar'),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: _con.goToLoginPage,
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialCameraPosition),
            _textFielNombre()
          ],
        )) 
    );
  }

  Widget _textFielNombre() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: TextField(
        decoration: InputDecoration(
            labelText: '¿A dónde vas?',
            border: const OutlineInputBorder(),
            suffix: Icon(
              Icons.add_location_outlined,
              color: Colors.black54,
            )
          ),
      ),
    );
  }
}
