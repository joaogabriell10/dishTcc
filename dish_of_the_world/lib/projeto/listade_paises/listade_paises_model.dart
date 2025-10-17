import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'listade_paises_widget.dart' show ListadePaisesWidget;
import 'package:flutter/material.dart';
import '../../models/pais.dart';
import '../../services/api_service.dart';

class ListadePaisesModel extends FlutterFlowModel<ListadePaisesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  
  // Lista de países
  List<Pais> _todosPaises = [];
  List<Pais> _paisesFiltrados = [];
  bool _isLoading = true;
  
  List<Pais> get paisesFiltrados => _paisesFiltrados;
  bool get isLoading => _isLoading;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // State field(s) for RatingBar widget.
  double? ratingBarValue6;
  // State field(s) for RatingBar widget.
  double? ratingBarValue7;

  @override
  void initState(BuildContext context) {
    _carregarPaises();
  }
  
  Future<void> _carregarPaises() async {
    try {
      _isLoading = true;
      final paises = await ApiService.getPaises();
      _todosPaises = paises;
      _paisesFiltrados = List.from(_todosPaises);
    } catch (e) {
      print('Erro ao carregar países: $e');
      _todosPaises = [];
      _paisesFiltrados = [];
    } finally {
      _isLoading = false;
    }
  }
  
  Future<void> recarregarPaises() async {
    await _carregarPaises();
  }
  
  void filtrarPaises(String termo) {
    if (termo.isEmpty) {
      _paisesFiltrados = List.from(_todosPaises);
    } else {
      _paisesFiltrados = _todosPaises
          .where((pais) => pais.nome.toLowerCase().contains(termo.toLowerCase()))
          .toList();
    }
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
