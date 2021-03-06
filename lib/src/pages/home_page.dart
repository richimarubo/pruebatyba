import 'package:flutter/material.dart';
import 'package:tengalo/src/share_prefs/preferencias_usuario.dart';
import 'package:tengalo/src/widgets/menu_widget.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class HomePage extends StatefulWidget {

  static final String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = new PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = HomePage.routeName;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Paquelolleve', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30,
          color: Colors.white,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _listView( context ),
        ],
      ),
    );
  }

  Widget _listView(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 30.0,
            ),
          ),

          Container(
            width: size.width * 100,
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric( vertical: 20.0, horizontal: 30.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox( height: 20.0 ),
                Text('Busca tu restaurante favorito', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black87)),
                SizedBox( height: 20.0 ),
                
              ],
            ),
          ),
          SizedBox( height: 70.0 )
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF32026b),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
      ],
    );

  }
}