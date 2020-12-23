import 'package:cep/views/ConsultarCep.dart';
import 'package:cep/views/ConsultarEndereco.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CEP"),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              padding: EdgeInsets.all(40),
              color: Color(0xff660066),
              child: Text(
                "Consultar Endereço informando CEP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.purple[500],
                  width: 4,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConsultarEndereco(),
                ),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              padding: EdgeInsets.all(40),
              color: Color(0xff660066),
              child: Text(
                "Consultar CEP informando Endereço",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.purple[500],
                  width: 4,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsultarCep()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
