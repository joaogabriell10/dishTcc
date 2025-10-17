import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicial_widget.dart' show InicialWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/produto.dart';
import '/services/api_service.dart';

class InicialModel extends FlutterFlowModel<InicialWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // State field(s) for produtos
  List<Produto> produtos = [];
  bool isLoading = true;

  @override
  void initState(BuildContext context) {
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    try {
      produtos = await ApiService.getProdutosAleatorios();
    } catch (e) {
      print('Erro ao carregar produtos: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> recarregarProdutos() async {
    isLoading = true;
    await carregarProdutos();
  }

  @override
  void dispose() {}
}
