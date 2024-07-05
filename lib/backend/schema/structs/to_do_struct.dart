// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToDoStruct extends FFFirebaseStruct {
  ToDoStruct({
    String? activity,
    int? points,
    String? phase,
    String? activityDescription,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _activity = activity,
        _points = points,
        _phase = phase,
        _activityDescription = activityDescription,
        _index = index,
        super(firestoreUtilData);

  // "activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  set activity(String? val) => _activity = val;
  bool hasActivity() => _activity != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;
  void incrementPoints(int amount) => _points = points + amount;
  bool hasPoints() => _points != null;

  // "phase" field.
  String? _phase;
  String get phase => _phase ?? '';
  set phase(String? val) => _phase = val;
  bool hasPhase() => _phase != null;

  // "activityDescription" field.
  String? _activityDescription;
  String get activityDescription => _activityDescription ?? '';
  set activityDescription(String? val) => _activityDescription = val;
  bool hasActivityDescription() => _activityDescription != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  static ToDoStruct fromMap(Map<String, dynamic> data) => ToDoStruct(
        activity: data['activity'] as String?,
        points: castToType<int>(data['points']),
        phase: data['phase'] as String?,
        activityDescription: data['activityDescription'] as String?,
        index: castToType<int>(data['index']),
      );

  static ToDoStruct? maybeFromMap(dynamic data) =>
      data is Map ? ToDoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'activity': _activity,
        'points': _points,
        'phase': _phase,
        'activityDescription': _activityDescription,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'activity': serializeParam(
          _activity,
          ParamType.String,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
        'phase': serializeParam(
          _phase,
          ParamType.String,
        ),
        'activityDescription': serializeParam(
          _activityDescription,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static ToDoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ToDoStruct(
        activity: deserializeParam(
          data['activity'],
          ParamType.String,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
        phase: deserializeParam(
          data['phase'],
          ParamType.String,
          false,
        ),
        activityDescription: deserializeParam(
          data['activityDescription'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ToDoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ToDoStruct &&
        activity == other.activity &&
        points == other.points &&
        phase == other.phase &&
        activityDescription == other.activityDescription &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([activity, points, phase, activityDescription, index]);
}

ToDoStruct createToDoStruct({
  String? activity,
  int? points,
  String? phase,
  String? activityDescription,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ToDoStruct(
      activity: activity,
      points: points,
      phase: phase,
      activityDescription: activityDescription,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ToDoStruct? updateToDoStruct(
  ToDoStruct? toDo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    toDo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addToDoStructData(
  Map<String, dynamic> firestoreData,
  ToDoStruct? toDo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (toDo == null) {
    return;
  }
  if (toDo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && toDo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final toDoData = getToDoFirestoreData(toDo, forFieldValue);
  final nestedData = toDoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = toDo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getToDoFirestoreData(
  ToDoStruct? toDo, [
  bool forFieldValue = false,
]) {
  if (toDo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(toDo.toMap());

  // Add any Firestore field values
  toDo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getToDoListFirestoreData(
  List<ToDoStruct>? toDos,
) =>
    toDos?.map((e) => getToDoFirestoreData(e, true)).toList() ?? [];
