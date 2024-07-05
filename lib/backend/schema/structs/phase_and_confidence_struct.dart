// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhaseAndConfidenceStruct extends FFFirebaseStruct {
  PhaseAndConfidenceStruct({
    String? phase,
    double? confidence,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _phase = phase,
        _confidence = confidence,
        super(firestoreUtilData);

  // "phase" field.
  String? _phase;
  String get phase => _phase ?? 'None';
  set phase(String? val) => _phase = val;
  bool hasPhase() => _phase != null;

  // "confidence" field.
  double? _confidence;
  double get confidence => _confidence ?? 0.0;
  set confidence(double? val) => _confidence = val;
  void incrementConfidence(double amount) => _confidence = confidence + amount;
  bool hasConfidence() => _confidence != null;

  static PhaseAndConfidenceStruct fromMap(Map<String, dynamic> data) =>
      PhaseAndConfidenceStruct(
        phase: data['phase'] as String?,
        confidence: castToType<double>(data['confidence']),
      );

  static PhaseAndConfidenceStruct? maybeFromMap(dynamic data) => data is Map
      ? PhaseAndConfidenceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'phase': _phase,
        'confidence': _confidence,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'phase': serializeParam(
          _phase,
          ParamType.String,
        ),
        'confidence': serializeParam(
          _confidence,
          ParamType.double,
        ),
      }.withoutNulls;

  static PhaseAndConfidenceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PhaseAndConfidenceStruct(
        phase: deserializeParam(
          data['phase'],
          ParamType.String,
          false,
        ),
        confidence: deserializeParam(
          data['confidence'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PhaseAndConfidenceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PhaseAndConfidenceStruct &&
        phase == other.phase &&
        confidence == other.confidence;
  }

  @override
  int get hashCode => const ListEquality().hash([phase, confidence]);
}

PhaseAndConfidenceStruct createPhaseAndConfidenceStruct({
  String? phase,
  double? confidence,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhaseAndConfidenceStruct(
      phase: phase,
      confidence: confidence,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PhaseAndConfidenceStruct? updatePhaseAndConfidenceStruct(
  PhaseAndConfidenceStruct? phaseAndConfidence, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    phaseAndConfidence
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPhaseAndConfidenceStructData(
  Map<String, dynamic> firestoreData,
  PhaseAndConfidenceStruct? phaseAndConfidence,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (phaseAndConfidence == null) {
    return;
  }
  if (phaseAndConfidence.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && phaseAndConfidence.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final phaseAndConfidenceData =
      getPhaseAndConfidenceFirestoreData(phaseAndConfidence, forFieldValue);
  final nestedData =
      phaseAndConfidenceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      phaseAndConfidence.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPhaseAndConfidenceFirestoreData(
  PhaseAndConfidenceStruct? phaseAndConfidence, [
  bool forFieldValue = false,
]) {
  if (phaseAndConfidence == null) {
    return {};
  }
  final firestoreData = mapToFirestore(phaseAndConfidence.toMap());

  // Add any Firestore field values
  phaseAndConfidence.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhaseAndConfidenceListFirestoreData(
  List<PhaseAndConfidenceStruct>? phaseAndConfidences,
) =>
    phaseAndConfidences
        ?.map((e) => getPhaseAndConfidenceFirestoreData(e, true))
        .toList() ??
    [];
