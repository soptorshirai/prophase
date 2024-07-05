import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'activitydescript_model.dart';
export 'activitydescript_model.dart';

class ActivitydescriptWidget extends StatefulWidget {
  const ActivitydescriptWidget({
    super.key,
    required this.todoActivity,
    this.index,
    this.began,
    this.complete,
  });

  final ToDoStruct? todoActivity;
  final int? index;
  final bool? began;
  final bool? complete;

  @override
  State<ActivitydescriptWidget> createState() => _ActivitydescriptWidgetState();
}

class _ActivitydescriptWidgetState extends State<ActivitydescriptWidget> {
  late ActivitydescriptModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivitydescriptModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            minHeight: 100.0,
            maxWidth: 570.0,
            maxHeight: 800.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: const Color(0xFFE0E3E7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Text(
                                widget.todoActivity!.activity,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 50.0,
                            borderWidth: 1.0,
                            buttonSize: 44.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.expand_more_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 5.0, 0.0),
                            child: Icon(
                              Icons.stars_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Text(
                              '${widget.todoActivity?.points.toString()} Points Possible',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: 250.0,
                              constraints: const BoxConstraints(
                                minWidth: 150.0,
                                maxWidth: 300.0,
                              ),
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.todoActivity?.activityDescription,
                                    'None',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!((((widget.index != null) &&
                                      ((currentUserDocument
                                                      ?.indexOfActivitesStarted
                                                      .toList() ??
                                                  [])
                                              .contains(widget.index) ==
                                          true)) ||
                                  (widget.began == true)) &&
                              (((widget.index != null) &&
                                      (currentUserDocument
                                                  ?.indexOfActivitiesCompleted
                                                  .toList() ??
                                              [])
                                          .contains(widget.index)) ||
                                  (widget.complete == true)) &&
                              !_model.pointsDone))
                            AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  if ((((widget.index != null) &&
                                              ((currentUserDocument
                                                              ?.indexOfActivitesStarted
                                                              .toList() ??
                                                          [])
                                                      .contains(widget.index) ==
                                                  true)) ||
                                          (widget.began == true)) &&
                                      !_model.pointsDone) {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'activitiesCompleted':
                                              FieldValue.arrayUnion([
                                            getToDoFirestoreData(
                                              updateToDoStruct(
                                                widget.todoActivity,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                          'points': FieldValue.increment(
                                              widget.todoActivity!.points),
                                        },
                                      ),
                                    });
                                    setState(() {
                                      _model.pointsDone = true;
                                    });
                                    if (widget.index != null) {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'indexOfActivitiesCompleted':
                                                FieldValue.arrayUnion(
                                                    [widget.index]),
                                          },
                                        ),
                                      });
                                    }
                                  } else {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'activitiesStarted':
                                              FieldValue.arrayUnion([
                                            getToDoFirestoreData(
                                              createToDoStruct(
                                                activity: widget
                                                    .todoActivity?.activity,
                                                points:
                                                    widget.todoActivity?.points,
                                                phase:
                                                    widget.todoActivity?.phase,
                                                activityDescription: widget
                                                    .todoActivity
                                                    ?.activityDescription,
                                                index: widget.index,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                        },
                                      ),
                                    });
                                    setState(() {
                                      _model.pointsDone = false;
                                    });
                                    if (widget.index != null) {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'indexOfActivitesStarted':
                                                FieldValue.arrayUnion(
                                                    [widget.index]),
                                          },
                                        ),
                                      });
                                    }
                                  }
                                },
                                text: () {
                                  if ((widget.index != null) &&
                                      ((currentUserDocument
                                                      ?.indexOfActivitesStarted
                                                      .toList() ??
                                                  [])
                                              .contains(widget.index) ==
                                          true)) {
                                    return 'Mark Complete';
                                  } else if (widget.began == true) {
                                    return 'Mark Complete';
                                  } else if (_model.pointsDone == true) {
                                    return 'Completed';
                                  } else {
                                    return 'Begin Activity';
                                  }
                                }(),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: () {
                                    if ((widget.index != null) &&
                                        ((currentUserDocument
                                                        ?.indexOfActivitesStarted
                                                        .toList() ??
                                                    [])
                                                .contains(widget.index) ==
                                            true)) {
                                      return FlutterFlowTheme.of(context).info;
                                    } else if (widget.began == true) {
                                      return FlutterFlowTheme.of(context).info;
                                    } else if (_model.pointsDone == true) {
                                      return const Color(0xFF1C8D00);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .success;
                                    }
                                  }(),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
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
                Stack(
                  children: [
                    if ((((widget.index != null) &&
                                ((currentUserDocument?.indexOfActivitesStarted
                                                .toList() ??
                                            [])
                                        .contains(widget.index) ==
                                    true)) ||
                            (widget.began == true)) &&
                        (((widget.index != null) &&
                                !(currentUserDocument
                                            ?.indexOfActivitiesCompleted
                                            .toList() ??
                                        [])
                                    .contains(widget.index)) ||
                            (widget.complete == false)))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 100.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Started',
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
                      ),
                    if ((((widget.index != null) &&
                                ((currentUserDocument?.indexOfActivitesStarted
                                                .toList() ??
                                            [])
                                        .contains(widget.index) ==
                                    true)) ||
                            (widget.began == true)) &&
                        (((widget.index != null) &&
                                (currentUserDocument?.indexOfActivitiesCompleted
                                            .toList() ??
                                        [])
                                    .contains(widget.index)) ||
                            (widget.complete == true)))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: AuthUserStreamWidget(
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
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
