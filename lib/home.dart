import 'package:flutter/material.dart';
import 'scanner_page.dart'; // Importa el archivo del escáner
import 'result_qr_page.dart'; // Importa la página de resultado QR

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  String _qrResult = "Resultado del escaneo";

  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      Center(child: Text('Pestaña 1', style: TextStyle(color: Colors.white))),
      ScannerPage(onQRViewCreatedCallback: updateQRResult), // Pestaña del escáner
      ResultQRPage(qrResult: _qrResult), // Pestaña del resultado QR
      Center(child: Text('Pestaña 4', style: TextStyle(color: Colors.white))),
    ];
  }

  void updateQRResult(String result) {
    setState(() {
      _qrResult = result;
      _children[2] = ResultQRPage(qrResult: _qrResult); // Actualiza la pestaña 3 con el nuevo resultado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informacion',
          ),
        ],
      ),
    );
  }
}
