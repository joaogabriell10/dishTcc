import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import '/models/encomenda.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detalhes_encomenda_model.dart';
export 'detalhes_encomenda_model.dart';

class DetalhesEncomendaWidget extends StatefulWidget {
  const DetalhesEncomendaWidget({
    super.key,
    required this.encomenda,
  });

  final Encomenda encomenda;
  static String routeName = 'DetalhesEncomenda';
  static String routePath = '/detalhesEncomenda';

  @override
  State<DetalhesEncomendaWidget> createState() => _DetalhesEncomendaWidgetState();
}

class _DetalhesEncomendaWidgetState extends State<DetalhesEncomendaWidget> {
  late DetalhesEncomendaModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesEncomendaModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String getStatusText(int? status) {
    switch (status) {
      case 1:
        return 'Confirmada';
      case 2:
        return 'Em preparo';
      case 3:
        return 'Pronta para retirada';
      case 4:
        return 'Retirada';
      case 5:
        return 'Cancelada';
      default:
        return 'Desconhecido';
    }
  }

  Color getStatusColor(int? status) {
    switch (status) {
      case 1:
        return Color(0xFF38B6FF);
      case 2:
        return Color(0xFFFF9800);
      case 3:
        return Color(0xFF4CAF50);
      case 4:
        return Color(0xFF2196F3);
      case 5:
        return Color(0xFFD0132E);
      default:
        return Color(0xFF757575);
    }
  }

  IconData getStatusIcon(int? status) {
    switch (status) {
      case 1:
        return Icons.check_circle_outline;
      case 2:
        return Icons.restaurant;
      case 3:
        return Icons.notifications_active;
      case 4:
        return Icons.done_all;
      case 5:
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF38B6FF),
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Detalhes do Pedido',
          style: FlutterFlowTheme.of(context).titleLarge.override(
            font: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w700,
            ),
            color: Color(0xFF38B6FF),
            letterSpacing: 0.0,
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho do pedido
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pedido #${widget.encomenda.id}',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: getStatusColor(widget.encomenda.status),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                getStatusIcon(widget.encomenda.status),
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 6),
                              Text(
                                getStatusText(widget.encomenda.status),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Realizado em ${widget.encomenda.dataEncomenda ?? "Data não disponível"}',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              // Detalhes do produto
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produto',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF38B6FF).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.restaurant_menu,
                            color: Color(0xFF38B6FF),
                            size: 40,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.encomenda.produto?.nome ?? 'Produto não disponível',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Quantidade: ${widget.encomenda.quantidade ?? 0}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Preço unitário: R\$ ${((widget.encomenda.preco ?? 0.0) / (widget.encomenda.quantidade ?? 1)).toStringAsFixed(2).replaceAll('.', ',')}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              // Resumo financeiro
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resumo do Pedido',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'R\$ ${(widget.encomenda.preco ?? 0.0).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'R\$ ${(widget.encomenda.preco ?? 0.0).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF38B6FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Observações se houver
              if (widget.encomenda.comentario != null && widget.encomenda.comentario!.isNotEmpty) ...[
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x1A000000),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Observações',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          widget.encomenda.comentario!,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              
              SizedBox(height: 32),
              
              // Botão de voltar
              Container(
                width: double.infinity,
                child: FFButtonWidget(
                  onPressed: () {
                    context.pop();
                  },
                  text: 'Voltar às Minhas Encomendas',
                  options: FFButtonOptions(
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF38B6FF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w600,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}