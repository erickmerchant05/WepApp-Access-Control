import 'package:flutter/material.dart';

class ResultQRPage extends StatelessWidget {
  final String qrResult;

  ResultQRPage({required this.qrResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado QR'),
      ),
      body: Center(
        child: Text(
          qrResult,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
