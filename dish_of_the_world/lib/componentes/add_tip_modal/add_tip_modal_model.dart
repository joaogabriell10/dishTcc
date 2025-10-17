import '/componentes/tip_item/tip_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_tip_modal_widget.dart' show AddTipModalWidget;
import 'package:flutter/material.dart';

class AddTipModalModel extends FlutterFlowModel<AddTipModalWidget> {
  ///  Local state fields for this component.

  String selected = '';

  ///  State fields for stateful widgets in this component.

  // Model for TipItem component.
  late TipItemModel tipItemModel1;
  // Model for TipItem component.
  late TipItemModel tipItemModel2;
  // Model for TipItem component.
  late TipItemModel tipItemModel3;
  // Model for TipItem component.
  late TipItemModel tipItemModel4;
  // Model for TipItem component.
  late TipItemModel tipItemModel5;

  @override
  void initState(BuildContext context) {
    tipItemModel1 = createModel(context, () => TipItemModel());
    tipItemModel2 = createModel(context, () => TipItemModel());
    tipItemModel3 = createModel(context, () => TipItemModel());
    tipItemModel4 = createModel(context, () => TipItemModel());
    tipItemModel5 = createModel(context, () => TipItemModel());
  }

  @override
  void dispose() {
    tipItemModel1.dispose();
    tipItemModel2.dispose();
    tipItemModel3.dispose();
    tipItemModel4.dispose();
    tipItemModel5.dispose();
  }
}
