import 'package:flutter/material.dart';
import '../models/encomenda.dart';
import '../services/encomenda_service.dart';

class EncomendasScreen extends StatefulWidget {
  @override
  _EncomendasScreenState createState() => _EncomendasScreenState();
}

class _EncomendasScreenState extends State<EncomendasScreen> {
  List<Encomenda> encomendas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    carregarEncomendas();
  }

  Future<void> carregarEncomendas() async {
    try {
      final lista = await EncomendaService.listarEncomendas();
      setState(() {
        encomendas = lista;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar encomendas: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encomendas'),
        backgroundColor: Colors.orange,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : encomendas.isEmpty
              ? Center(child: Text('Nenhuma encomenda encontrada'))
              : ListView.builder(
                  itemCount: encomendas.length,
                  itemBuilder: (context, index) {
                    final encomenda = encomendas[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('Encomenda #${encomenda.id}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Usuário: ${encomenda.usuario?.nome ?? 'N/A'}'),
                            Text('Produto: ${encomenda.produto?.nome ?? 'N/A'}'),
                            Text('Quantidade: ${encomenda.quantidade}'),
                            Text('Preço: R\$ ${encomenda.preco?.toStringAsFixed(2)}'),
                            Text('Status: ${encomenda.retirada == true ? 'Retirada' : 'Pendente'}'),
                          ],
                        ),
                        trailing: Icon(
                          encomenda.retirada == true ? Icons.check_circle : Icons.pending,
                          color: encomenda.retirada == true ? Colors.green : Colors.orange,
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: carregarEncomendas,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.orange,
      ),
    );
  }
}