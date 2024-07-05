// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FunFactsStruct extends FFFirebaseStruct {
  FunFactsStruct({
    String? fact,
    String? tag1,
    String? tag2,
    String? tag3,
    String? phase,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fact = fact,
        _tag1 = tag1,
        _tag2 = tag2,
        _tag3 = tag3,
        _phase = phase,
        super(firestoreUtilData);

  // "fact" field.
  String? _fact;
  String get fact => _fact ?? '';
  set fact(String? val) => _fact = val;
  bool hasFact() => _fact != null;

  // "tag1" field.
  String? _tag1;
  String get tag1 => _tag1 ?? 'na';
  set tag1(String? val) => _tag1 = val;
  bool hasTag1() => _tag1 != null;

  // "tag2" field.
  String? _tag2;
  String get tag2 => _tag2 ?? 'na';
  set tag2(String? val) => _tag2 = val;
  bool hasTag2() => _tag2 != null;

  // "tag3" field.
  String? _tag3;
  String get tag3 => _tag3 ?? 'na';
  set tag3(String? val) => _tag3 = val;
  bool hasTag3() => _tag3 != null;

  // "phase" field.
  String? _phase;
  String get phase => _phase ?? '';
  set phase(String? val) => _phase = val;
  bool hasPhase() => _phase != null;

  static FunFactsStruct fromMap(Map<String, dynamic> data) => FunFactsStruct(
        fact: data['fact'] as String?,
        tag1: data['tag1'] as String?,
        tag2: data['tag2'] as String?,
        tag3: data['tag3'] as String?,
        phase: data['phase'] as String?,
      );

  static FunFactsStruct? maybeFromMap(dynamic data) =>
      data is Map ? FunFactsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fact': _fact,
        'tag1': _tag1,
        'tag2': _tag2,
        'tag3': _tag3,
        'phase': _phase,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fact': serializeParam(
          _fact,
          ParamType.String,
        ),
        'tag1': serializeParam(
          _tag1,
          ParamType.String,
        ),
        'tag2': serializeParam(
          _tag2,
          ParamType.String,
        ),
        'tag3': serializeParam(
          _tag3,
          ParamType.String,
        ),
        'phase': serializeParam(
          _phase,
          ParamType.String,
        ),
      }.withoutNulls;

  static FunFactsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FunFactsStruct(
        fact: deserializeParam(
          data['fact'],
          ParamType.String,
          false,
        ),
        tag1: deserializeParam(
          data['tag1'],
          ParamType.String,
          false,
        ),
        tag2: deserializeParam(
          data['tag2'],
          ParamType.String,
          false,
        ),
        tag3: deserializeParam(
          data['tag3'],
          ParamType.String,
          false,
        ),
        phase: deserializeParam(
          data['phase'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FunFactsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FunFactsStruct &&
        fact == other.fact &&
        tag1 == other.tag1 &&
        tag2 == other.tag2 &&
        tag3 == other.tag3 &&
        phase == other.phase;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fact, tag1, tag2, tag3, phase]);
}

FunFactsStruct createFunFactsStruct({
  String? fact,
  String? tag1,
  String? tag2,
  String? tag3,
  String? phase,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FunFactsStruct(
      fact: fact,
      tag1: tag1,
      tag2: tag2,
      tag3: tag3,
      phase: phase,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FunFactsStruct? updateFunFactsStruct(
  FunFactsStruct? funFacts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    funFacts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFunFactsStructData(
  Map<String, dynamic> firestoreData,
  FunFactsStruct? funFacts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (funFacts == null) {
    return;
  }
  if (funFacts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && funFacts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final funFactsData = getFunFactsFirestoreData(funFacts, forFieldValue);
  final nestedData = funFactsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = funFacts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFunFactsFirestoreData(
  FunFactsStruct? funFacts, [
  bool forFieldValue = false,
]) {
  if (funFacts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(funFacts.toMap());

  // Add any Firestore field values
  funFacts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFunFactsListFirestoreData(
  List<FunFactsStruct>? funFactss,
) =>
    funFactss?.map((e) => getFunFactsFirestoreData(e, true)).toList() ?? [];
