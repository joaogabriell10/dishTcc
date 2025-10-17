import 'package:flutter/material.dart';
import 'services/encomenda_service.dart';

class TestConnectionScreen extends StatefulWidget {
  @override
  _TestConnectionScreenState createState() => _TestConnectionScreenState();
}

class _TestConnectionScreenState extends State<TestConnectionScreen> {
  String resultado = 'Clique para testar conexão';
  bool testando = false;

  Future<void> testarConexao() async {
    setState(() {
      testando = true;
      resultado = 'Testando conexão...';
    });

    try {
      final encomendas = await EncomendaService.listarEncomendas();
      setState(() {
        testando = false;
        resultado = 'Conexão OK! Encontradas ${encomendas.length} encomendas';
      });
    } catch (e) {
      setState(() {
        testando = false;
        resultado = 'Erro na conexão: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Conexão'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              testando ? Icons.sync : Icons.wifi,
              size: 64,
              color: testando ? Colors.orange : Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: testando ? null : testarConexao,
              child: Text('Testar Conexão'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}