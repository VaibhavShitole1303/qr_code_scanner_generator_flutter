import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String qrResult="Scanned Data will appear here";

  Future<void> scanqr() async{
    try{
      final qrCode=await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult=qrCode.toString();
      });
    }on PlatformException{
      qrResult="failed to read qr";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Qr"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrResult',style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanqr, child: Text("Scan QR"))
          ],
        ),
      ),
    );
  }
}

