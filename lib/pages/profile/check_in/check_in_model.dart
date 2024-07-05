import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'check_in_widget.dart' show CheckInWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckInModel extends FlutterFlowModel<CheckInWidget> {
  ///  Local state fields for this page.

  bool date = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for moods widget.
  FormFieldController<List<String>>? moodsValueController;
  List<String>? get moodsValues => moodsValueController?.value;
  set moodsValues(List<String>? val) => moodsValueController?.value = val;
  // Stores action output result for [Custom Action - phaseDeterminatorAction] action in Button widget.
  PhaseAndConfidenceStruct? phaseDetermined;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
