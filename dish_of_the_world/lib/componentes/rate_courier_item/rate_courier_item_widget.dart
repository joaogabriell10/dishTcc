import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rate_courier_item_model.dart';
export 'rate_courier_item_model.dart';

class RateCourierItemWidget extends StatefulWidget {
  const RateCourierItemWidget({
    super.key,
    this.action,
    required this.activeItem,
    this.icon,
    this.text,
  });

  final Future Function(String? buttonName)? action;
  final String? activeItem;
  final Widget? icon;
  final String? text;

  @override
  State<RateCourierItemWidget> createState() => _RateCourierItemWidgetState();
}

class _RateCourierItemWidgetState extends State<RateCourierItemWidget> {
  late RateCourierItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateCourierItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.action?.call(
          widget.text,
        );
      },
      child: Container(
        width: 68.0,
        height: 68.0,
        decoration: BoxDecoration(
          color: widget.text == widget.activeItem
              ? FlutterFlowTheme.of(context).secondary
              : FlutterFlowTheme.of(context).greyG75,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon!,
                Text(
                  widget.text!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.nunitoSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
