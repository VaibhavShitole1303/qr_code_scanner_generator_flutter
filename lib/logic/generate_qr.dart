import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController urlController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlController.text.isNotEmpty)
                QrImageView(
                  data: urlController.text,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: "Enter data",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    labelText: "Enter Data"
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                  setState(() {

                  });
              }, child: Text("Generate Qr"))
            ],
          ),
        ),
      ),
    );
  }
}