import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'main_welcome_model.dart';
export 'main_welcome_model.dart';

class MainWelcomeWidget extends StatefulWidget {
  const MainWelcomeWidget({super.key});

  static String routeName = 'MainWelcome';
  static String routePath = '/mainWelcome';

  @override
  State<MainWelcomeWidget> createState() => _MainWelcomeWidgetState();
}

class _MainWelcomeWidgetState extends State<MainWelcomeWidget> {
  late MainWelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainWelcomeModel());

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
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://picsum.photos/seed/757/600',
                      width: 0.0,
                      height: 0.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: 412.6,
                  height: 417.7,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/quiz-ddj6d4/assets/1zjn9tslpk0q/main_logo.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.02, -0.02),
                child: SelectionArea(
                    child: GradientText(
                  FFLocalizations.of(context).getText(
                    'gy6pjjja' /* Welcome to AKTU-FIRM */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.sora(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    color: Color(0xFFFF0000),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    shadows: [
                      Shadow(
                        color: Color(0xFF00CEFF),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  colors: [Color(0xFFE01925), Color(0xFF6AD3FF)],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                )),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.45),
                child: FlutterFlowIconButton(
                  borderColor: Colors.white,
                  borderRadius: 8.0,
                  borderWidth: 5.0,
                  buttonSize: 100.0,
                  fillColor: Color(0xFFFF0010),
                  hoverColor: Color(0xFF00DDFF),
                  icon: Icon(
                    Icons.touch_app_outlined,
                    color: Colors.black,
                    size: 70.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(LoginpageWidget.routeName);
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.06),
                child: GradientText(
                  FFLocalizations.of(context).getText(
                    '5spi63q2' /* Empowering Education Through I... */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  colors: [Color(0xFF3BECF8), Color(0xFFE42B36)],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
