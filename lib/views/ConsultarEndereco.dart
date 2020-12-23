import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConsultarEndereco extends StatefulWidget {
  @override
  _ConsultarEnderecoState createState() => _ConsultarEnderecoState();
}

class _ConsultarEnderecoState extends State<ConsultarEndereco> {
  TextEditingController controllerCep = TextEditingController();

  String resultadoEndereco = "";
  String mensagemErro = "";

  recuperarCep() async {
    String cep = controllerCep.text;

    if (cep.length != 8) {
      setState(() {
        mensagemErro = "Digite 8 números. Apenas números!";
        return;
      });
    } else {
      mensagemErro = "";
    }

    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];
    String ddd = retorno["ddd"];

    setState(() {
      return resultadoEndereco =
          "Logradouro: ${logradouro} \nComplemento: ${complemento}"
              "\nBairro: ${bairro} \nLocalidade: ${localidade} \nUF: ${uf} \nDDD: ${ddd}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar Endereço informando CEP"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
                controller: controllerCep,
                decoration: InputDecoration(
                  labelText: "Digite o CEP. Ex: 63280000",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              Text(
                mensagemErro,
                style: TextStyle(color: Colors.red[700]),
              ),
              SizedBox(height: 10),
              RaisedButton(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Buscar",
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                color: Color(0xff660066),
                onPressed: recuperarCep,
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  resultadoEndereco,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
