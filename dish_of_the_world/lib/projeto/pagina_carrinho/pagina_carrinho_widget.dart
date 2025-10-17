import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import '/services/carrinho_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pagina_carrinho_model.dart';
export 'pagina_carrinho_model.dart';

class PaginaCarrinhoWidget extends StatefulWidget {
  const PaginaCarrinhoWidget({super.key});

  static String routeName = 'PaginaCarrinho';
  static String routePath = '/paginaCarrinho';

  @override
  State<PaginaCarrinhoWidget> createState() => _PaginaCarrinhoWidgetState();
}

class _PaginaCarrinhoWidgetState extends State<PaginaCarrinhoWidget> {
  late PaginaCarrinhoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaCarrinhoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).customColor5,
              size: 24.0,
            ),
            onPressed: () {
              context.safePop();
            },
          ),
          title: Text(
            'Carrinho',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold,
                  ),
                  color: FlutterFlowTheme.of(context).customColor5,
                  fontSize: 28.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
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
            Container(
              width: 60.0,
              height: 60.0,
              margin: EdgeInsets.only(right: 16.0),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset('assets/images/dish.png').image,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80.0),
              child: Column(
                children: [
                  // Lista de itens do carrinho
                  ...CarrinhoService().itens.map((item) {
                    final produto = item['produto'];
                    final quantidade = item['quantidade'];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  produto.imagemUrl,
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 80.0,
                                      height: 80.0,
                                      color: Colors.grey[300],
                                      child: Icon(Icons.image_not_supported),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        produto.nome,
                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                              font: GoogleFonts.nunitoSans(
                                                fontWeight: FontWeight.w600,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        produto.descricao.length > 50
                                            ? '${produto.descricao.substring(0, 50)}...'
                                            : produto.descricao,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                              font: GoogleFonts.nunitoSans(),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                  font: GoogleFonts.nunitoSans(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  color: Color(0xFF206389),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  CarrinhoService().atualizarQuantidade(produto.id, quantidade - 1);
                                                  safeSetState(() {});
                                                },
                                                icon: Icon(Icons.remove, size: 20),
                                              ),
                                              Text('$quantidade'),
                                              IconButton(
                                                onPressed: () {
                                                  CarrinhoService().atualizarQuantidade(produto.id, quantidade + 1);
                                                  safeSetState(() {});
                                                },
                                                icon: Icon(Icons.add, size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  // Mensagem se carrinho vazio
                  if (CarrinhoService().itens.isEmpty)
                    Container(
                      height: 300.0,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 80.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Seu carrinho está vazio',
                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.nunitoSans(),
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // Resumo do pedido
                  if (CarrinhoService().itens.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w500,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'R\$ ${CarrinhoService().total.toStringAsFixed(2).replaceAll('.', ',')}',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                          font: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'R\$ ${CarrinhoService().total.toStringAsFixed(2).replaceAll('.', ',')}',
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                          font: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          color: FlutterFlowTheme.of(context).primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Finalizar pedido');
                                },
                                text: 'Finalizar Pedido',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                        font: GoogleFonts.nunitoSans(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Menu inferior
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
                      offset: Offset(0.0, -2.0),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => context.pushNamed(InicialWidget.routeName),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, color: Colors.white, size: 24.0),
                          Text('Inicio', style: TextStyle(color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => context.pushNamed(ListadePaisesWidget.routeName),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_sharp, color: Colors.white, size: 24.0),
                          Text('Pesquisa', style: TextStyle(color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => context.pushNamed(PaginaCarrinhoWidget.routeName),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.white, size: 24.0),
                          Text('Carrinho', style: TextStyle(color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => context.pushNamed(PerfilPageWidget.routeName),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_sharp, color: Colors.white, size: 24.0),
                          Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 12.0)),
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
    );
  }
}