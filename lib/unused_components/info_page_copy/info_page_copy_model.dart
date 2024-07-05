import '/flutter_flow/flutter_flow_util.dart';
import 'info_page_copy_widget.dart' show InfoPageCopyWidget;
import 'package:flutter/material.dart';

class InfoPageCopyModel extends FlutterFlowModel<InfoPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
