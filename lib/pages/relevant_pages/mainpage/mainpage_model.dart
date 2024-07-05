import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainpage_widget.dart' show MainpageWidget;
import 'package:flutter/material.dart';

class MainpageModel extends FlutterFlowModel<MainpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - phaseDeterminatorAction] action in mainpage widget.
  PhaseAndConfidenceStruct? phaseDeterminedOnLoad;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
