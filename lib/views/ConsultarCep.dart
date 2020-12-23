import 'package:cep/model/RecuperarDados.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConsultarCep extends StatefulWidget {
  @override
  _ConsultarCepState createState() => _ConsultarCepState();
}

class _ConsultarCepState extends State<ConsultarCep> {
  TextEditingController controllerUF = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerLogradouro = TextEditingController();

  String resultadoCep = "";

  var dados = List<RecuperarDados>();

  _getRecuperarDados() {
    String uf = controllerUF.text;
    String cidade = controllerCidade.text;
    String logradouro = controllerLogradouro.text;

    var baseUrl =
        "https://viacep.com.br/ws/${uf}/${cidade}/${logradouro}/json/";

    var recuperar = http.get(baseUrl);

    recuperar.then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        return dados =
            list.map((json) => RecuperarDados.fromJson(json)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar CEP informando Endereço"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                style: TextStyle(fontSize: 20),
                controller: controllerUF,
                decoration: InputDecoration(
                  labelText: "Digite a UF. Ex: PE",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(fontSize: 20),
                controller: controllerCidade,
                decoration: InputDecoration(
                  labelText: "Digite a cidade. Ex: Serra Talhada",
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(fontSize: 20),
                controller: controllerLogradouro,
                decoration: InputDecoration(
                  labelText:
                      "Digite o logradouro. Ex: Rua Monsenhor Pinto de Campos",
                  labelStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Consultar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  _getRecuperarDados();
                },
                color: Color(0xff660066),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                child: ListView.builder(
                  itemCount: dados.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "${dados[index].cep}, ${dados[index].logradouro}"
                        " ${dados[index].complemento}, ${dados[index].bairro},"
                        " ${dados[index].localidade}, ${dados[index].uf}",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
