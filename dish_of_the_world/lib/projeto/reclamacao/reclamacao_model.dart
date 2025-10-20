import '/flutter_flow/flutter_flow_util.dart';
import 'reclamacao_widget.dart' show ReclamacaoWidget;
import 'package:flutter/material.dart';

class ReclamacaoModel extends FlutterFlowModel<ReclamacaoWidget> {
  TextEditingController? textController;
  FocusNode? textFieldFocusNode;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController?.dispose();
    textFieldFocusNode?.dispose();
  }
}