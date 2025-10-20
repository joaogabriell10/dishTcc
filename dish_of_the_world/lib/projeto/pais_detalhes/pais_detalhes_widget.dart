import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/models/produto.dart';
import '/projeto/produto_detalhes/produto_detalhes_widget.dart';
import '/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pais_detalhes_model.dart';
export 'pais_detalhes_model.dart';

class PaisDetalhesWidget extends StatefulWidget {
  const PaisDetalhesWidget({
    super.key,
    required this.paisId,
    required this.paisNome,
    this.imagemPais,
  });

  final int paisId;
  final String paisNome;
  final String? imagemPais;

  static String routeName = 'PaisDetalhes';
  static String routePath = '/paisDetalhes';

  @override
  State<PaisDetalhesWidget> createState() => _PaisDetalhesWidgetState();
}

class _PaisDetalhesWidgetState extends State<PaisDetalhesWidget> {
  late PaisDetalhesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaisDetalhesModel());
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _carregarProdutos();
  }

  Future<void> _carregarProdutos() async {
    try {
      _model.isLoading = true;
      setState(() {});
      
      final response = await ApiService.get('produtos/pais/${widget.paisId}');
      
      if (response['success']) {
        List<dynamic> produtosData = response['data'];
        _model.todosProdutos = produtosData.map((json) => Produto.fromJson(json)).toList();
        _model.produtos = List.from(_model.todosProdutos);
      } else {
        _model.todosProdutos = [];
        _model.produtos = [];
      }
    } catch (e) {
      _model.todosProdutos = [];
      _model.produtos = [];
    } finally {
      _model.isLoading = false;
      setState(() {});
    }
  }

  void _filtrarProdutos(String query) {
    if (query.isEmpty) {
      _model.produtos = List.from(_model.todosProdutos);
    } else {
      _model.produtos = _model.todosProdutos
          .where((produto) => produto.nome.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildProdutoCard(Produto produto) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProdutoDetalhesWidget(produto: produto),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.1),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
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
                        decoration: BoxDecoration(
                          color: Color(0xFF38B6FF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.restaurant_menu,
                          color: Color(0xFF38B6FF),
                          size: 40.0,
                        ),
                      );
                    },
                  ),
                ),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                    child: Text(
                      produto.descricao,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.nunitoSans(),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFD700),
                            size: 16.0,
                          ),
                          Text(
                            '4.5',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.nunitoSans(fontWeight: FontWeight.w500),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
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
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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

          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.notifications_none,
                      color: Color(0xFF38B6FF),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(PaginaNotificacoesWidget.routeName);
                    },
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/dish.png').image,
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: 700.0,
                          height: 108.8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Image.network(
                            'http://localhost:8080/paises/capa/${widget.paisId}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return widget.imagemPais != null
                                  ? Image.asset(widget.imagemPais!, fit: BoxFit.cover)
                                  : Container(
                                      color: Color(0xFF38B6FF),
                                      child: Center(
                                        child: Text(
                                          widget.paisNome,
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          onChanged: (value) => _filtrarProdutos(value),
                          decoration: InputDecoration(
                            hintText: 'Pesquisar pratos...',
                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.nunitoSans(),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).greyG100,
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.nunitoSans(),
                            color: Color(0xFF38B6FF),
                            letterSpacing: 0.0,
                          ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.textControllerValidator.asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 100.0),
                      child: _model.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF38B6FF),
                              ),
                            )
                          : _model.produtos.isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.restaurant_menu_outlined,
                                          size: 64,
                                          color: Colors.grey[400],
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'Nenhum prato encontrado para ${widget.paisNome}',
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: _model.produtos.length,
                                  separatorBuilder: (context, index) => SizedBox(height: 16.0),
                                  itemBuilder: (context, index) {
                                    return _buildProdutoCard(_model.produtos[index]);
                                  },
                                ),
                    ),
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
                        offset: Offset(0.0, -2.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.white.withOpacity(0.2),
                          highlightColor: Colors.white.withOpacity(0.1),
                          onTap: () => context.pushNamed(InicialWidget.routeName),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.home, color: Colors.white, size: 24),
                                SizedBox(height: 4),
                                Text('Início', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.white.withOpacity(0.2),
                          highlightColor: Colors.white.withOpacity(0.1),
                          onTap: () => context.pushNamed(ListadePaisesWidget.routeName),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.search_sharp, color: Colors.white, size: 24),
                                SizedBox(height: 4),
                                Text('Pesquisa', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.white.withOpacity(0.2),
                          highlightColor: Colors.white.withOpacity(0.1),
                          onTap: () => context.pushNamed(PaginaCarrinhoWidget.routeName),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.shopping_cart, color: Colors.white, size: 24),
                                SizedBox(height: 4),
                                Text('Carrinho', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.white.withOpacity(0.2),
                          highlightColor: Colors.white.withOpacity(0.1),
                          onTap: () => context.pushNamed(PerfilPageWidget.routeName),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.person_sharp, color: Colors.white, size: 24),
                                SizedBox(height: 4),
                                Text('Perfil', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 12)),
                              ],
                            ),
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
      ),
    );
  }
}