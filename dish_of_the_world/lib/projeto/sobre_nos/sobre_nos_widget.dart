import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sobre_nos_model.dart';
export 'sobre_nos_model.dart';

class SobreNosWidget extends StatefulWidget {
  const SobreNosWidget({super.key});

  static String routeName = 'SobreNos';
  static String routePath = '/SobreNos';

  @override
  State<SobreNosWidget> createState() => _SobreNosWidgetState();
}

class _SobreNosWidgetState extends State<SobreNosWidget> {
  late SobreNosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SobreNosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          backgroundColor: Color(0xFF38B6FF),
          elevation: 0,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Sobre Nós',
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(PaginaNotificacoesWidget.routeName);
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            'assets/images/Dish_of_The_Wor_2.png',
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.history,
                                    color: Color(0xFF38B6FF),
                                    size: 24,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Nossa História',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D3748),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Nossa equipe tomou a iniciativa de transformar essa incrível ideia em realidade, pois identificamos diversos problemas nas comidas congeladas disponíveis no mercado, como a falta de cor, o sabor artificial e a ausência de criatividade, algo comum, ainda que prático.',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Dessa forma, criamos a Dish of the World, uma marca que oferece aos nossos clientes pratos únicos, práticos e repletos de personalidade, trazendo comidas típicas de diversas partes do mundo sem que precisem sair do conforto de casa.',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.flag,
                              color: Color(0xFF4CAF50),
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Nosso Objetivo',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Nosso objetivo não é apenas resolver os problemas citados, mas também proporcionar novidades e experiências fora da rotina para nossos estimados clientes.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 15,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
            Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF38B6FF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            -2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(InicialWidget.routeName);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Inicio',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.nunitoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(ListadePaisesWidget.routeName);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.search_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Pesquisa',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.nunitoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(PaginaCarrinhoWidget.routeName);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Carrinho',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.nunitoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(PerfilPageWidget.routeName);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.person_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context
                                        .pushNamed(PerfilPageWidget.routeName);
                                  },
                                ),
                                Text(
                                  'Perfil',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.nunitoSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
