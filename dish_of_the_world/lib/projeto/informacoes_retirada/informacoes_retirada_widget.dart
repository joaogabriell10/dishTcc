import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'informacoes_retirada_model.dart';
export 'informacoes_retirada_model.dart';

class InformacoesRetiradaWidget extends StatefulWidget {
  const InformacoesRetiradaWidget({super.key});

  static String routeName = 'InformacoesRetirada';
  static String routePath = '/informacoesRetirada';

  @override
  State<InformacoesRetiradaWidget> createState() => _InformacoesRetiradaWidgetState();
}

class _InformacoesRetiradaWidgetState extends State<InformacoesRetiradaWidget> {
  late InformacoesRetiradaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformacoesRetiradaModel());
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
            'Informações para Retirada',
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
                        colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x404CAF50),
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
                            Icons.info_rounded,
                            color: Colors.white,
                            size: 48.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Informações para Retirada',
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
                          'Tudo que você precisa saber sobre a retirada',
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
                  
                  // Information Cards
                  _buildCard(
                    Icons.assignment_ind,
                    'Documentos Necessários',
                    'Apresente um documento oficial com foto (RG, CNH ou Passaporte). O documento deve estar dentro da validade.',
                    Color(0xFF2196F3),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.confirmation_number,
                    'Código de Retirada',
                    'Tenha em mãos o número do pedido disponível na página "Minhas Encomendas".',
                    Color(0xFFFF9800),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.schedule,
                    'Prazo de Retirada',
                    'Você tem até 5 dias úteis para retirar sua encomenda. Após esse período, o pedido poderá ser cancelado.',
                    Color(0xFF9C27B0),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.person_outline,
                    'Retirada por Terceiros',
                    'Para retirada por terceiros, é necessário procuração simples, documento do titular e do responsável pela retirada.',
                    Color(0xFF607D8B),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.inventory_2,
                    'Conferência do Pedido',
                    'Confira todos os itens na hora da retirada. Após sair do local, não aceitamos reclamações sobre produtos faltantes.',
                    Color(0xFFE91E63),
                  ),
                  SizedBox(height: 24.0),
                  
                  // Location Card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE8F5E8), Color(0xFFC8E6C9)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Color(0xFF81C784),
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x204CAF50),
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
                                    colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x304CAF50),
                                      offset: Offset(0, 4),
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.location_on,
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
                                      'Local de Retirada',
                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                            font: GoogleFonts.nunitoSans(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Color(0xFF2E7D32),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Endereço completo',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.nunitoSans(),
                                            color: Color(0xFF4CAF50),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Praça Senador José Roberto Leite Penteado, 490',
                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                        font: GoogleFonts.nunitoSans(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        color: Color(0xFF2E7D32),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Lapa - São Paulo, SP',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.nunitoSans(),
                                        color: Color(0xFF4CAF50),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                SizedBox(height: 16.0),
                                Container(
                                  padding: EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4CAF50).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Color(0xFF2E7D32),
                                        size: 20.0,
                                      ),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          'Seg-Sex: 08:00-20:00 | Sáb: 08:00-18:00 | Dom: 08:00-14:00',
                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.nunitoSans(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                color: Color(0xFF2E7D32),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
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