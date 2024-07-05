import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'survey_widget.dart' show SurveyWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyModel extends FlutterFlowModel<SurveyWidget> {
  ///  Local state fields for this page.

  bool date = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  DateTime? datePicked;
  // State field(s) for moods widget.
  FormFieldController<List<String>>? moodsValueController;
  List<String>? get moodsValues => moodsValueController?.value;
  set moodsValues(List<String>? val) => moodsValueController?.value = val;
  // Stores action output result for [Custom Action - phaseDeterminatorAction] action in Button widget.
  PhaseAndConfidenceStruct? phaseDeterminedInitial;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();
  }
}
