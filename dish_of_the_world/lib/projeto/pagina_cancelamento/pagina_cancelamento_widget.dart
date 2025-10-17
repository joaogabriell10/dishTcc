import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pagina_cancelamento_model.dart';
export 'pagina_cancelamento_model.dart';

class PaginaCancelamentoWidget extends StatefulWidget {
  const PaginaCancelamentoWidget({super.key});

  static String routeName = 'PaginaCancelamento';
  static String routePath = '/paginaCancelamento';

  @override
  State<PaginaCancelamentoWidget> createState() =>
      _PaginaCancelamentoWidgetState();
}

class _PaginaCancelamentoWidgetState extends State<PaginaCancelamentoWidget> {
  late PaginaCancelamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaCancelamentoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController?.text = '\n\n';
        }));
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Stack(
                                children: [
                                  Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          Stack(
                                            children: [
                                              Stack(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Stack(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    Stack(
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        Stack(
                                                                                                          children: [
                                                                                                            Stack(
                                                                                                              children: [
                                                                                                                Stack(
                                                                                                                  children: [
                                                                                                                    Stack(
                                                                                                                      children: [
                                                                                                                        Stack(
                                                                                                                          children: [
                                                                                                                            Stack(
                                                                                                                              children: [
                                                                                                                                Stack(
                                                                                                                                  children: [
                                                                                                                                    Stack(
                                                                                                                                      children: [
                                                                                                                                        Align(
                                                                                                                                          alignment: AlignmentDirectional(-0.04, -0.8),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              'Conte-nos o porque deseja cancelar',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    font: GoogleFonts.nunitoSans(
                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                    ),
                                                                                                                                                    fontSize: 20.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Align(
                                                                                                                                          alignment: AlignmentDirectional(-0.73, 0.49),
                                                                                                                                          child: Text(
                                                                                                                                            'Podemos tentar solucionar seu problema?',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  font: GoogleFonts.nunitoSans(
                                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                  ),
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Align(
                                                                                                                                          alignment: AlignmentDirectional(-0.88, 0.53),
                                                                                                                                          child: InkWell(
                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                            onTap: () async {
                                                                                                                                              context.pushNamed(AjudaPageWidget.routeName);
                                                                                                                                            },
                                                                                                                                            child: Text(
                                                                                                                                              'Ajuda',
                                                                                                                                              textAlign: TextAlign.start,
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    font: GoogleFonts.nunitoSans(
                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                    ),
                                                                                                                                                    color: Color(0xFFF50505),
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                    decoration: TextDecoration.underline,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: AlignmentDirectional(-0.33, -0.32),
                                                                                                                      child: Container(
                                                                                                                        width: 327.3,
                                                                                                                        height: 445.3,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: Color(0xFF38B6FF),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                          child: Container(
                                                                                                                            width: 200.0,
                                                                                                                            child: TextFormField(
                                                                                                                              controller: _model.textController,
                                                                                                                              focusNode: _model.textFieldFocusNode,
                                                                                                                              autofocus: false,
                                                                                                                              obscureText: false,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                isDense: true,
                                                                                                                                labelText: 'Descreva o motivo do cancelamento:',
                                                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                      font: GoogleFonts.nunitoSans(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                hintText: ' ',
                                                                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                      font: GoogleFonts.nunitoSans(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                                                  borderSide: BorderSide(
                                                                                                                                    color: Color(0x00000000),
                                                                                                                                    width: 1.0,
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                ),
                                                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                                                  borderSide: BorderSide(
                                                                                                                                    color: Color(0x00000000),
                                                                                                                                    width: 1.0,
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                ),
                                                                                                                                errorBorder: OutlineInputBorder(
                                                                                                                                  borderSide: BorderSide(
                                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                                    width: 1.0,
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                ),
                                                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                                                  borderSide: BorderSide(
                                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                                    width: 1.0,
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                ),
                                                                                                                                filled: true,
                                                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    font: GoogleFonts.nunitoSans(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              validator: _model.textControllerValidator.asValidator(context),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 1.11),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(InicialWidget.routeName);
                                                                                                    },
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Inicio',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.nunitoSans(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.white,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Pesquisa',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.nunitoSans(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(PaginaCarrinhoWidget.routeName);
                                                                                                    },
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Carrinho',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.nunitoSans(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(PerfilPageWidget.routeName);
                                                                                                    },
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Perfil',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.nunitoSans(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.77),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      44.0, 0.0, 44.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context
                                          .pushNamed(InicialWidget.routeName);
                                    },
                                    text: 'Confirmar',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF38B6FF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.nunitoSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF206389),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.9, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF38B6FF),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.07, -1.06),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 0.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.asset(
                              'assets/images/dish.png',
                            ).image,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.6, -1.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.notifications_none,
                      color: Color(0xFF38B6FF),
                      size: 28.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(PaginaNotificacoesWidget.routeName);
                    },
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
