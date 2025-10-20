import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'erros_encomenda_model.dart';
export 'erros_encomenda_model.dart';

class ErrosEncomendaWidget extends StatefulWidget {
  const ErrosEncomendaWidget({super.key});

  static String routeName = 'ErrosEncomenda';
  static String routePath = '/errosEncomenda';

  @override
  State<ErrosEncomendaWidget> createState() => _ErrosEncomendaWidgetState();
}

class _ErrosEncomendaWidgetState extends State<ErrosEncomendaWidget> {
  late ErrosEncomendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrosEncomendaModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Colors.white,
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF38B6FF),
              size: 28.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Erros com a Encomenda',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                  ),
                  color: Color(0xFF38B6FF),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(28.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE91E63), Color(0xFFC2185B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40E91E63),
                          offset: Offset(0, 8),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 48.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Erros com a Encomenda',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.bold,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Soluções para problemas com seu pedido',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.nunitoSans(),
                                color: Colors.white.withOpacity(0.9),
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  
                  // Problem Cards
                  _buildCard(
                    Icons.cancel,
                    'Pedido Cancelado',
                    'Se seu pedido foi cancelado inesperadamente, verifique seu e-mail para mais informações. Entre em contato conosco se precisar de esclarecimentos.',
                    Color(0xFFFF5722),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.inventory_2,
                    'Produto Incorreto',
                    'Recebeu um produto diferente do pedido? Entre em contato imediatamente para que possamos resolver a situação e fazer a troca.',
                    Color(0xFFFF9800),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.broken_image,
                    'Produto Danificado',
                    'Se o produto chegou danificado ou em más condições, tire fotos e entre em contato conosco para providenciarmos a substituição.',
                    Color(0xFFF44336),
                  ),
                  SizedBox(height: 16.0),
                  

                  
                  _buildCard(
                    Icons.receipt_long,
                    'Problema na Cobrança',
                    'Encontrou alguma inconsistência na cobrança? Verifique os detalhes do pedido e entre em contato para esclarecimentos sobre valores.',
                    Color(0xFF607D8B),
                  ),
                  SizedBox(height: 24.0),
                  
                  // Contact Card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Color(0xFFFF8A65),
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x20FF5722),
                          offset: Offset(0, 6),
                          blurRadius: 15.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFFF5722), Color(0xFFE64A19)],
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x30FF5722),
                                      offset: Offset(0, 4),
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.support_agent,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Precisa de Ajuda?',
                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                            font: GoogleFonts.nunitoSans(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Color(0xFFD84315),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Estamos aqui para você!',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.nunitoSans(),
                                            color: Color(0xFF8D6E63),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF4CAF50),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 18.0,
                                      ),
                                    ),
                                    SizedBox(width: 12.0),
                                    Text(
                                      '(11)99360-9399',
                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                            font: GoogleFonts.nunitoSans(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            color: Color(0xFF2E7D32),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.0),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2196F3),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                        size: 18.0,
                                      ),
                                    ),
                                    SizedBox(width: 12.0),
                                    Expanded(
                                      child: Text(
                                        'suporte@dishoftheworld.com',
                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                              font: GoogleFonts.nunitoSans(
                                                fontWeight: FontWeight.w600,
                                              ),
                                              color: Color(0xFF1565C0),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String description, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        offset: Offset(0, 3),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 26.0,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    title,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                          ),
                          color: Color(0xFF1A1A1A),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: color.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                description,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.nunitoSans(),
                      color: Color(0xFF424242),
                      letterSpacing: 0.0,
                    ).copyWith(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}