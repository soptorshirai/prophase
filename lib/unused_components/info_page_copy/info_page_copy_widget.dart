import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/unused_components/phase_info/phase_info_widget.dart';
import 'package:flutter/material.dart';
import 'info_page_copy_model.dart';
export 'info_page_copy_model.dart';

class InfoPageCopyWidget extends StatefulWidget {
  const InfoPageCopyWidget({super.key});

  @override
  State<InfoPageCopyWidget> createState() => _InfoPageCopyWidgetState();
}

class _InfoPageCopyWidgetState extends State<InfoPageCopyWidget> {
  late InfoPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoPageCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 50.0, 0.0, 0.0),
                    child: Text(
                      'The Four Phases',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const PhaseInfoWidget(
                                    phaseName: 'Menstruation',
                                    descript:
                                        'Categorized from the first to last day of bleeding. Hormones are low, bringing down productivity and focus for approximately 7 days. ',
                                    biological:
                                        'Your period contains blood, mucus and some cells from the lining of your uterus. ',
                                    productivity:
                                        'Reduce workload and social events, prioritize sleep and rest, practice self forgiveness for slower-paced working',
                                    mood: 'Irritable, tired, moody',
                                    food:
                                        'Iron rich foods such as green leafy vegetables, Vitamin C rich such as citrus, and Vitamin K rich such as eggs',
                                    energy:
                                        'At lowest levels due to low hormonal activity',
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).tertiary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Menstruation',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 34.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const PhaseInfoWidget(
                                    phaseName: 'Follicular',
                                    descript:
                                        'The uterus begins to prepare for pregnancy after menstruation ends, lasting an average of 16 days and sometimes overlapping with ovulation. ',
                                    biological:
                                        'During the follicular phase, fluid-filled sacs in your ovaries called follicles house immature eggs. One of these follicles, the dominant follicle, houses an egg that’s bigger and healthier than the rest.',
                                    productivity:
                                        'Highest productivity level: Work on complex tasks, integrate creative projects to prevent burnout, be proactive, resume socializing (with caution)',
                                    mood:
                                        'Relaxed, social, empathetic, aroused',
                                    food:
                                        'Lean proteins, complex carbs (brown rice, whole wheat, etc.), healthy fats (avocados, flaxseeds), leafy greens and cruciferous vegetables',
                                    energy:
                                        'Energy levels increase as estrogen and progesterone levels go up',
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).tertiary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Follicular',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 34.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const PhaseInfoWidget(
                                    phaseName: 'Ovulation',
                                    descript:
                                        'The egg releases in the middle of one’s cycle, lasting 24 hours. Symptoms may present for 3-4 days depending on the person due to the high levels of estrogen and testosterone. ',
                                    biological:
                                        'Characteristics of your vaginal discharge can let you know if you\'re approaching ovulation. The increase in estrogen before ovulation leads to increased production of cervical mucus.',
                                    productivity:
                                        'Tackle intimate convos or projects, build relationships with peers, attempt lesser projects, work in groups or as a team',
                                    mood: 'Fickle, social, emotional, aroused',
                                    food:
                                        'Lean proteins, complex carbs (ex. brown rice), healthy fats (ex. avocados), leafy greens and cruciferous vegetables',
                                    energy:
                                        'Energy levels remain high because of testosterone and estrogen, but emotions may vary due to heightened emotional sensitivity',
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).tertiary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Ovulation',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 34.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 12.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const PhaseInfoWidget(
                                    phaseName: 'Luteal',
                                    descript:
                                        'The uterus prepares to shed its lining prior to the period when the egg isn’t fertilized. ',
                                    biological:
                                        'Your cervical mucus thickens to a paste to help prevent bacteria from getting inside your uterus.',
                                    productivity:
                                        'Prioritize self care, focus on solo tasks, reflect on emotions, accomplish lighter work tasks',
                                    mood:
                                        'Distressed, irritable, depressed, contemplative',
                                    food:
                                        'High-fiber foods (ex. cruciferous vegetables), sweet snacks (ex. dark chocolate), salty snacks (ex. nuts and seeds), magnesium high foods (ex. sweet potatoes)',
                                    energy:
                                        'Lowest energy levels, with reflective mindset that peaks with progesterone levels',
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).tertiary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Luteal',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 34.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
