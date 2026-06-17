import 'package:flutter/material.dart';
import 'package:flutter_revisao_2bi_ads5sn/cliente_model.dart';
import 'package:flutter_revisao_2bi_ads5sn/cliente_service.dart';

class ClienteListaScreen extends StatefulWidget {
  const ClienteListaScreen({super.key});

  @override
  State<ClienteListaScreen> createState() => _ClienteListaScreenState();
}

class _ClienteListaScreenState extends State<ClienteListaScreen> {
  List<ClienteModel> clientes = [];

  @override
  void initState() {
    super.initState();

    ClienteService().retornarClientes().then(
      (resultado) => setState(() {
        clientes = resultado;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Center(child: Text("Listagem de Cliente")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: clientes.map((cliente) => retornarItem(cliente)).toList(),
        ),
      ),
    );
  }

  Widget retornarItem(ClienteModel? cliente) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(cliente!.urlImagem!, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome: ${cliente.nome}"),
                  Text("Endereço: ${cliente.endereco}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
