import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'problemas_retirada_model.dart';
export 'problemas_retirada_model.dart';

class ProblemasRetiradaWidget extends StatefulWidget {
  const ProblemasRetiradaWidget({super.key});

  static String routeName = 'ProblemasRetirada';
  static String routePath = '/problemasRetirada';

  @override
  State<ProblemasRetiradaWidget> createState() => _ProblemasRetiradaWidgetState();
}

class _ProblemasRetiradaWidgetState extends State<ProblemasRetiradaWidget> {
  late ProblemasRetiradaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProblemasRetiradaModel());
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
            'Problemas de Retirada',
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
                        colors: [Color(0xFF38B6FF), Color(0xFF1976D2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x4038B6FF),
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
                            Icons.help_center_rounded,
                            color: Colors.white,
                            size: 48.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Problemas de Retirada',
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
                          'Soluções rápidas para os problemas mais comuns',
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
                    Icons.location_on,
                    'Local de Retirada',
                    'Verifique o endereço correto do estabelecimento no seu pedido. Caso tenha dúvidas sobre a localização, entre em contato conosco.',
                    Color(0xFF4CAF50),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.access_time,
                    'Horário de Funcionamento',
                    'Segunda a sexta: 08:00-20:00\nSábado: 08:00-18:00\nDomingo: 08:00-14:00',
                    Color(0xFF2196F3),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.badge,
                    'Documentação Necessária',
                    'Para retirar seu pedido, apresente um documento com foto e o código do pedido que foi enviado por e-mail ou SMS.',
                    Color(0xFFFF9800),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.schedule,
                    'Prazo para Retirada',
                    'Seu pedido ficará disponível por até 2 horas após o horário agendado. Após esse período, será necessário fazer um novo pedido.',
                    Color(0xFF9C27B0),
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
                                      '(11) 9999-9999',
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