import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pagina_notificacoes_model.dart';
export 'pagina_notificacoes_model.dart';

class PaginaNotificacoesWidget extends StatefulWidget {
  const PaginaNotificacoesWidget({super.key});

  static String routeName = 'PaginaNotificacoes';
  static String routePath = '/paginaNotificacoes';

  @override
  State<PaginaNotificacoesWidget> createState() =>
      _PaginaNotificacoesWidgetState();
}

class _PaginaNotificacoesWidgetState extends State<PaginaNotificacoesWidget> {
  late PaginaNotificacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaNotificacoesModel());

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
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
          actions: [
            FlutterFlowIconButton(
              buttonSize: 60.0,
              fillColor: Color(0x000FFFFF),
              icon: Icon(
                Icons.notifications_none_sharp,
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
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/dish.png',
                  ).image,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildNotificationCard(
                      icon: Icons.food_bank,
                      title: 'Pedido Agendado !',
                      time: '4 min',
                      description: 'Feijoada marcada para ser retirada até 06/07 às 12h.',
                    ),
                    _buildNotificationCard(
                      icon: Icons.local_offer,
                      title: 'Cupom exclusivo !',
                      time: '1 dia',
                      description: 'Use: FOOD10 até 15/07 para 10% off',
                    ),
                    _buildNotificationCard(
                      icon: Icons.local_offer,
                      title: 'Promoção especial !',
                      time: '5 dias',
                      description: 'Compre dois pratos do mesmo país e ganhe 20% de desconto',
                    ),
                    _buildNotificationCard(
                      icon: Icons.cancel,
                      title: 'Pedido cancelado !',
                      time: '6 dias',
                      description: 'Você cancelou o pedido do dia 01/07 às 13h.',
                    ),
                    _buildNotificationCard(
                      icon: Icons.restaurant,
                      title: 'Festival de Massas !',
                      time: '9 dias',
                      description: 'Venha experimentar massas e sabores típicos da Itália nesta sexta-feira.',
                    ),
                    _buildNotificationCard(
                      icon: Icons.star,
                      title: 'Desafio da Semana !',
                      time: '15 dias',
                      description: 'Experimente 3 pratos novos esta semana e ganhe 15% na próxima compra',
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomNavItem(
                      icon: Icons.home,
                      label: 'Inicio',
                      onTap: () => context.pushNamed(InicialWidget.routeName),
                    ),
                    _buildBottomNavItem(
                      icon: Icons.search_sharp,
                      label: 'Pesquisa',
                      onTap: () => context.pushNamed(ListadePaisesWidget.routeName),
                    ),
                    _buildBottomNavItem(
                      icon: Icons.shopping_cart,
                      label: 'Carrinho',
                      onTap: () => context.pushNamed(PaginaCarrinhoWidget.routeName),
                    ),
                    _buildBottomNavItem(
                      icon: Icons.person_sharp,
                      label: 'Perfil',
                      onTap: () => context.pushNamed(PerfilPageWidget.routeName),
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

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String time,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF38B6FF),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
          child: Row(
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Color(0xFF38B6FF),
                  size: 24.0,
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.0,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
          SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}