import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/used_components/activitydescript/activitydescript_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'comp_model.dart';
export 'comp_model.dart';

class CompWidget extends StatefulWidget {
  const CompWidget({
    super.key,
    required this.toDoActivity,
    required this.index,
  });

  final ToDoStruct? toDoActivity;
  final int? index;

  @override
  State<CompWidget> createState() => _CompWidgetState();
}

class _CompWidgetState extends State<CompWidget> with TickerProviderStateMixin {
  late CompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 90.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: SizedBox(
                  height: 500.0,
                  width: double.infinity,
                  child: ActivitydescriptWidget(
                    todoActivity: widget.toDoActivity!,
                    index: widget.index,
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        child: Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: 189.0,
            constraints: const BoxConstraints(
              minHeight: 160.0,
              maxHeight: 300.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: Text(
                        widget.toDoActivity!.activity,
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        if ((currentUserDocument?.indexOfActivitiesCompleted
                                        .toList() ??
                                    [])
                                .contains(widget.index) ==
                            true)
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 100.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C8D00),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Completed',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        if ((currentUserDocument?.indexOfActivitiesCompleted
                                        .toList() ??
                                    [])
                                .contains(widget.index) ==
                            false)
                          AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                if ((currentUserDocument
                                                ?.indexOfActivitesStarted
                                                .toList() ??
                                            [])
                                        .contains(widget.index) ==
                                    true) {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'activitiesCompleted':
                                            FieldValue.arrayUnion([
                                          getToDoFirestoreData(
                                            createToDoStruct(
                                              activity:
                                                  widget.toDoActivity?.activity,
                                              points:
                                                  widget.toDoActivity?.points,
                                              phase: widget.toDoActivity?.phase,
                                              activityDescription: widget
                                                  .toDoActivity
                                                  ?.activityDescription,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                        'indexOfActivitiesCompleted':
                                            FieldValue.arrayUnion(
                                                [widget.index]),
                                        'points': FieldValue.increment(
                                            widget.toDoActivity!.points),
                                      },
                                    ),
                                  });
                                } else {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'activitiesStarted':
                                            FieldValue.arrayUnion([
                                          getToDoFirestoreData(
                                            updateToDoStruct(
                                              widget.toDoActivity,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                        'indexOfActivitesStarted':
                                            FieldValue.arrayUnion(
                                                [widget.index]),
                                      },
                                    ),
                                  });
                                }
                              },
                              text: (currentUserDocument
                                                  ?.indexOfActivitesStarted
                                                  .toList() ??
                                              [])
                                          .contains(widget.index) ==
                                      false
                                  ? 'Begin'
                                  : 'Mark Complete',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: (currentUserDocument
                                                    ?.indexOfActivitesStarted
                                                    .toList() ??
                                                [])
                                            .contains(widget.index) ==
                                        false
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
