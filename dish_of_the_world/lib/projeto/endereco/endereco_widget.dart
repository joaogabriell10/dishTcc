import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'endereco_model.dart';
export 'endereco_model.dart';

class EnderecoWidget extends StatefulWidget {
  const EnderecoWidget({super.key});

  static String routeName = 'Endereco';
  static String routePath = '/Endereco';

  @override
  State<EnderecoWidget> createState() => _EnderecoWidgetState();
}

class _EnderecoWidgetState extends State<EnderecoWidget> {
  late EnderecoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnderecoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Widget _buildInfoCard(IconData icon, String title, String description, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF38B6FF).withOpacity(0.1),
                Colors.white,
              ],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF38B6FF), Color(0xFF206389)],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: SafeArea(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FlutterFlowIconButton(
                                  borderRadius: 12.0,
                                  buttonSize: 44.0,
                                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.0),
                                  onPressed: () {
                                    context.pushNamed(PerfilPageWidget.routeName);
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: FlutterFlowIconButton(
                                  borderRadius: 12.0,
                                  buttonSize: 44.0,
                                  icon: Icon(Icons.notifications_none, color: Colors.white, size: 24.0),
                                  onPressed: () async {
                                    context.pushNamed(PaginaNotificacoesWidget.routeName);
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Icon(Icons.location_on, size: 40, color: Color(0xFF38B6FF)),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Nossa Localização',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Venha nos visitar!',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/loja.png',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    _buildInfoCard(
                                      Icons.location_on,
                                      'Endereço',
                                      'Praça Senador José Roberto Leite Penteado, 490\nLapa - São Paulo, SP\nCEP: 05078-020',
                                      Color(0xFF4CAF50),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          await launchUrl(Uri.parse('https://maps.app.goo.gl/az5DMWQyCLNrieRj9'));
                                        },
                                        icon: Icon(Icons.map, size: 20),
                                        label: Text(
                                          'Ver no Mapa',
                                          style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF4CAF50),
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
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
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _buildInfoCard(
                        Icons.access_time,
                        'Horário de Funcionamento',
                        'Segunda a Sexta: 08:00 - 20:00\nSábado: 08:00 - 18:00\nDomingo: 08:00 - 14:00',
                        Color(0xFF2196F3),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _buildInfoCard(
                        Icons.phone,
                        'Telefone',
                        '(11) 99360-9399',
                        Color(0xFFFF9800),
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
                          onTap: () => context.pushNamed(InicialWidget.routeName),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home, color: Colors.white, size: 24),
                              Text('Inicio', style: GoogleFonts.nunitoSans(color: Colors.white)),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => context.pushNamed(ListadePaisesWidget.routeName),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_sharp, color: Colors.white, size: 24),
                              Text('Pesquisa', style: GoogleFonts.nunitoSans(color: Colors.white)),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => context.pushNamed(PaginaCarrinhoWidget.routeName),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.white, size: 24),
                              Text('Carrinho', style: GoogleFonts.nunitoSans(color: Colors.white)),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => context.pushNamed(PerfilPageWidget.routeName),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_sharp, color: Colors.white, size: 24),
                              Text('Perfil', style: GoogleFonts.nunitoSans(color: Colors.white)),
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
      ),
    );
  }
}
