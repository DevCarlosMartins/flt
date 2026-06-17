import 'dart:convert' as convert;

import 'package:flutter_revisao_2bi_ads5sn/cliente_model.dart';
import 'package:http/http.dart' as http;

class ClienteService {
  List<ClienteModel> _clientes = [];

  Future<List<ClienteModel>> retornarClientes() async {
    var response = await http.get(
      Uri.parse("https://mocki.io/v1/239d752b-e961-4ddf-a7ec-f87967026a09"),
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode >= 200 && response.statusCode < 400) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (var jsonCliente in jsonResponse) {
        String nome = jsonCliente["nome"];
        String endereco = jsonCliente["endereco"];
        String urlImagem = jsonCliente["urlImagem"];

        ClienteModel cliente = ClienteModel(
          nome: nome,
          endereco: endereco,
          urlImagem: urlImagem,
        );

        _clientes.add(cliente);
      }
    }

    return _clientes;
  }
}
