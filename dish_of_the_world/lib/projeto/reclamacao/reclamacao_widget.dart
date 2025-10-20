import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reclamacao_model.dart';
export 'reclamacao_model.dart';

class ReclamacaoWidget extends StatefulWidget {
  const ReclamacaoWidget({super.key});

  static String routeName = 'Reclamacao';
  static String routePath = '/reclamacao';

  @override
  State<ReclamacaoWidget> createState() => _ReclamacaoWidgetState();
}

class _ReclamacaoWidgetState extends State<ReclamacaoWidget> {
  late ReclamacaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReclamacaoModel());
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            'Reclamação',
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
                        colors: [Color(0xFFFF5722), Color(0xFFE64A19)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40FF5722),
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
                            Icons.report_problem_rounded,
                            color: Colors.white,
                            size: 48.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Fazer uma Reclamação',
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
                          'Sua opinião é importante para nós',
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
                    Icons.feedback,
                    'Como Funciona',
                    'Descreva sua reclamação de forma detalhada. Nossa equipe analisará e entrará em contato em até 24 horas.',
                    Color(0xFF2196F3),
                  ),
                  SizedBox(height: 16.0),
                  
                  _buildCard(
                    Icons.privacy_tip,
                    'Privacidade',
                    'Suas informações são tratadas com total confidencialidade e utilizadas apenas para resolução da reclamação.',
                    Color(0xFF4CAF50),
                  ),
                  SizedBox(height: 24.0),
                  
                  // Form Section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x10000000),
                          offset: Offset(0, 4),
                          blurRadius: 12.0,
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
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                'Descreva sua reclamação',
                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                      font: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      color: Color(0xFF1A1A1A),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Digite sua reclamação aqui...',
                              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.nunitoSans(),
                                    color: Color(0xFF9E9E9E),
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E0E0),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF38B6FF),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F5F5),
                              contentPadding: EdgeInsets.all(20.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.nunitoSans(),
                                  color: Color(0xFF1A1A1A),
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 8,
                            minLines: 5,
                          ),
                          SizedBox(height: 24.0),
                          Center(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Reclamação Enviada!'),
                                      content: Text(
                                          'Sua reclamação foi registrada com sucesso. Nossa equipe entrará em contato em até 24 horas.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                _model.textController?.clear();
                              },
                              text: 'Enviar Reclamação',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF38B6FF),
                                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                      font: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                      'Outros Canais',
                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                            font: GoogleFonts.nunitoSans(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            color: Color(0xFFD84315),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Entre em contato conosco',
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
                                        'reclamacoes@dishoftheworld.com',
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