import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/models/encomenda.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'minhas_encomendas_model.dart';
export 'minhas_encomendas_model.dart';

class MinhasEncomendasWidget extends StatefulWidget {
  const MinhasEncomendasWidget({super.key});

  static String routeName = 'MinhasEncomendas';
  static String routePath = '/minhasEncomendas';

  @override
  State<MinhasEncomendasWidget> createState() => _MinhasEncomendasWidgetState();
}

class _MinhasEncomendasWidgetState extends State<MinhasEncomendasWidget> {
  late MinhasEncomendasModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhasEncomendasModel());
    _carregarDados();
  }

  void _carregarDados() async {
    await _model.carregarEncomendas();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildSearchAndFilter() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _model.searchController,
            decoration: InputDecoration(
              hintText: 'Buscar por produto ou número do pedido...',
              prefixIcon: Icon(Icons.search, color: Color(0xFF38B6FF)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF38B6FF)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFF38B6FF), width: 2),
              ),
            ),
            onChanged: (value) {
              _model.buscarEncomendas(value);
              setState(() {});
            },
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _model.statusOptions.map((status) {
                final isSelected = _model.filtroStatus == status;
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(status),
                    selected: isSelected,
                    onSelected: (selected) {
                      _model.filtrarPorStatus(status);
                      setState(() {});
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: Color(0xFF38B6FF),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEncomendaCard(Encomenda encomenda) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesEncomendaWidget(encomenda: encomenda),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pedido #${encomenda.id}',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _model.getStatusColor(encomenda.status),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _model.getStatusIcon(encomenda.status),
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          _model.getStatusText(encomenda.status),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Realizado em ${encomenda.dataEncomenda ?? "Data não disponível"}',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Divider(height: 24, thickness: 1),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF38B6FF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.restaurant_menu,
                      color: Color(0xFF38B6FF),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          encomenda.produto?.nome ?? 'Produto não disponível',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Quantidade: ${encomenda.quantidade ?? 0}',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Total: R\$ ${(encomenda.preco ?? 0.0).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF38B6FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (encomenda.comentario != null && encomenda.comentario!.isNotEmpty) ...[
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Observações:',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        encomenda.comentario!,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (_model.podeSerCancelada(encomenda.status)) ...[
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showCancelDialog(encomenda),
                        icon: Icon(Icons.cancel_outlined, color: Colors.red),
                        label: Text(
                          'Cancelar Pedido',
                          style: TextStyle(color: Colors.red),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showCancelDialog(Encomenda encomenda) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Cancelar Pedido',
            style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w700),
          ),
          content: Text(
            'Tem certeza que deseja cancelar o pedido #${encomenda.id}?\n\nEsta ação não pode ser desfeita.',
            style: GoogleFonts.nunitoSans(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Não',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _cancelarEncomenda(encomenda.id!);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Sim, Cancelar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _cancelarEncomenda(int encomendaId) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      await _model.cancelarEncomenda(encomendaId);
      
      Navigator.of(context).pop();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pedido cancelado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      
      setState(() {});
    } catch (e) {
      Navigator.of(context).pop();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao cancelar pedido: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
              context.pushNamed(PerfilPageWidget.routeName);
            },
          ),
          title: Text(
            'Minhas Encomendas',
            style: FlutterFlowTheme.of(context).titleLarge.override(
              font: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700,
              ),
              color: Color(0xFF38B6FF),
              letterSpacing: 0.0,
            ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.refresh,
                color: Color(0xFF38B6FF),
                size: 24.0,
              ),
              onPressed: () async {
                await _model.carregarEncomendas();
                setState(() {});
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                children: [
                  _buildSearchAndFilter(),
                  Expanded(
                    child: _model.isLoading
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Color(0xFF38B6FF),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Carregando encomendas...',
                                  style: GoogleFonts.nunitoSans(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : _model.errorMessage != null
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.all(32),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        size: 64,
                                        color: Colors.red,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Ops! Algo deu errado',
                                        style: GoogleFonts.nunitoSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        _model.errorMessage!,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunitoSans(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      ElevatedButton.icon(
                                        onPressed: () async {
                                          await _model.carregarEncomendas();
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.refresh),
                                        label: Text('Tentar novamente'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF38B6FF),
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : _model.encomendasFiltradas.isEmpty
                                ? Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(32),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            _model.encomendas.isEmpty
                                                ? Icons.shopping_bag_outlined
                                                : Icons.search_off,
                                            size: 80,
                                            color: Colors.grey[400],
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            _model.encomendas.isEmpty
                                                ? 'Você ainda não fez nenhuma encomenda. Explore nossos pratos e faça seu primeiro pedido!'
                                                : 'Nenhuma encomenda encontrada',
                                            style: GoogleFonts.nunitoSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[600],
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          if (!_model.encomendas.isEmpty) ...[
                                            SizedBox(height: 8),
                                            Text(
                                              'Tente ajustar os filtros ou buscar por outro termo',
                                              style: GoogleFonts.nunitoSans(
                                                color: Colors.grey[500],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                          if (_model.encomendas.isEmpty) ...[
                                            SizedBox(height: 24),
                                            ElevatedButton(
                                              onPressed: () {
                                                context.go('/cardapio');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(0xFF38B6FF),
                                                foregroundColor: Colors.white,
                                              ),
                                              child: Text('Explorar Cardápio'),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  )
                                : RefreshIndicator(
                                    onRefresh: () async {
                                      await _model.carregarEncomendas();
                                      setState(() {});
                                    },
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(bottom: 100),
                                      itemCount: _model.encomendasFiltradas.length,
                                      itemBuilder: (context, index) {
                                        return _buildEncomendaCard(
                                          _model.encomendasFiltradas[index],
                                        );
                                      },
                                    ),
                                  ),
                  ),
                ],
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
                        _buildNavItem(Icons.home, 'Início', () {
                          context.pushNamed(InicialWidget.routeName);
                        }),
                        _buildNavItem(Icons.search, 'Pesquisa', () {
                          context.pushNamed(ListadePaisesWidget.routeName);
                        }),
                        _buildNavItem(Icons.shopping_cart, 'Carrinho', () {
                          context.pushNamed(PaginaCarrinhoWidget.routeName);
                        }),
                        _buildNavItem(Icons.person, 'Perfil', () {
                          context.pushNamed(PerfilPageWidget.routeName);
                        }),
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

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}