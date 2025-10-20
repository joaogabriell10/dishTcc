import '/flutter_flow/flutter_flow_util.dart';
import '/models/produto.dart';
import 'pais_detalhes_widget.dart' show PaisDetalhesWidget;
import 'package:flutter/material.dart';

class PaisDetalhesModel extends FlutterFlowModel<PaisDetalhesWidget> {
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  
  List<Produto> produtos = [];
  List<Produto> todosProdutos = [];
  bool isLoading = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}