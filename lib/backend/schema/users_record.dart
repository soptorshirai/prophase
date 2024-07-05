import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "dateOfCycle" field.
  DateTime? _dateOfCycle;
  DateTime? get dateOfCycle => _dateOfCycle;
  bool hasDateOfCycle() => _dateOfCycle != null;

  // "moods" field.
  List<String>? _moods;
  List<String> get moods => _moods ?? const [];
  bool hasMoods() => _moods != null;

  // "currentPhase" field.
  String? _currentPhase;
  String get currentPhase => _currentPhase ?? '';
  bool hasCurrentPhase() => _currentPhase != null;

  // "lastSurveyed" field.
  DateTime? _lastSurveyed;
  DateTime? get lastSurveyed => _lastSurveyed;
  bool hasLastSurveyed() => _lastSurveyed != null;

  // "currentPhaseConfidence" field.
  double? _currentPhaseConfidence;
  double get currentPhaseConfidence => _currentPhaseConfidence ?? 0.0;
  bool hasCurrentPhaseConfidence() => _currentPhaseConfidence != null;

  // "activitiesStarted" field.
  List<ToDoStruct>? _activitiesStarted;
  List<ToDoStruct> get activitiesStarted => _activitiesStarted ?? const [];
  bool hasActivitiesStarted() => _activitiesStarted != null;

  // "indexOfActivitesStarted" field.
  List<int>? _indexOfActivitesStarted;
  List<int> get indexOfActivitesStarted => _indexOfActivitesStarted ?? const [];
  bool hasIndexOfActivitesStarted() => _indexOfActivitesStarted != null;

  // "activitiesCompleted" field.
  List<ToDoStruct>? _activitiesCompleted;
  List<ToDoStruct> get activitiesCompleted => _activitiesCompleted ?? const [];
  bool hasActivitiesCompleted() => _activitiesCompleted != null;

  // "indexOfActivitiesCompleted" field.
  List<int>? _indexOfActivitiesCompleted;
  List<int> get indexOfActivitiesCompleted =>
      _indexOfActivitiesCompleted ?? const [];
  bool hasIndexOfActivitiesCompleted() => _indexOfActivitiesCompleted != null;

  // "lastPhase" field.
  String? _lastPhase;
  String get lastPhase => _lastPhase ?? '';
  bool hasLastPhase() => _lastPhase != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "allPoints" field.
  List<int>? _allPoints;
  List<int> get allPoints => _allPoints ?? const [];
  bool hasAllPoints() => _allPoints != null;

  // "lastDay" field.
  DateTime? _lastDay;
  DateTime? get lastDay => _lastDay;
  bool hasLastDay() => _lastDay != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "emergency" field.
  bool? _emergency;
  bool get emergency => _emergency ?? false;
  bool hasEmergency() => _emergency != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _dateOfCycle = snapshotData['dateOfCycle'] as DateTime?;
    _moods = getDataList(snapshotData['moods']);
    _currentPhase = snapshotData['currentPhase'] as String?;
    _lastSurveyed = snapshotData['lastSurveyed'] as DateTime?;
    _currentPhaseConfidence =
        castToType<double>(snapshotData['currentPhaseConfidence']);
    _activitiesStarted = getStructList(
      snapshotData['activitiesStarted'],
      ToDoStruct.fromMap,
    );
    _indexOfActivitesStarted =
        getDataList(snapshotData['indexOfActivitesStarted']);
    _activitiesCompleted = getStructList(
      snapshotData['activitiesCompleted'],
      ToDoStruct.fromMap,
    );
    _indexOfActivitiesCompleted =
        getDataList(snapshotData['indexOfActivitiesCompleted']);
    _lastPhase = snapshotData['lastPhase'] as String?;
    _points = castToType<int>(snapshotData['points']);
    _allPoints = getDataList(snapshotData['allPoints']);
    _lastDay = snapshotData['lastDay'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _emergency = snapshotData['emergency'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? gender,
  DateTime? dateOfCycle,
  String? currentPhase,
  DateTime? lastSurveyed,
  double? currentPhaseConfidence,
  String? lastPhase,
  int? points,
  DateTime? lastDay,
  String? phoneNumber,
  bool? emergency,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'gender': gender,
      'dateOfCycle': dateOfCycle,
      'currentPhase': currentPhase,
      'lastSurveyed': lastSurveyed,
      'currentPhaseConfidence': currentPhaseConfidence,
      'lastPhase': lastPhase,
      'points': points,
      'lastDay': lastDay,
      'phone_number': phoneNumber,
      'emergency': emergency,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.gender == e2?.gender &&
        e1?.dateOfCycle == e2?.dateOfCycle &&
        listEquality.equals(e1?.moods, e2?.moods) &&
        e1?.currentPhase == e2?.currentPhase &&
        e1?.lastSurveyed == e2?.lastSurveyed &&
        e1?.currentPhaseConfidence == e2?.currentPhaseConfidence &&
        listEquality.equals(e1?.activitiesStarted, e2?.activitiesStarted) &&
        listEquality.equals(
            e1?.indexOfActivitesStarted, e2?.indexOfActivitesStarted) &&
        listEquality.equals(e1?.activitiesCompleted, e2?.activitiesCompleted) &&
        listEquality.equals(
            e1?.indexOfActivitiesCompleted, e2?.indexOfActivitiesCompleted) &&
        e1?.lastPhase == e2?.lastPhase &&
        e1?.points == e2?.points &&
        listEquality.equals(e1?.allPoints, e2?.allPoints) &&
        e1?.lastDay == e2?.lastDay &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.emergency == e2?.emergency;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.gender,
        e?.dateOfCycle,
        e?.moods,
        e?.currentPhase,
        e?.lastSurveyed,
        e?.currentPhaseConfidence,
        e?.activitiesStarted,
        e?.indexOfActivitesStarted,
        e?.activitiesCompleted,
        e?.indexOfActivitiesCompleted,
        e?.lastPhase,
        e?.points,
        e?.allPoints,
        e?.lastDay,
        e?.phoneNumber,
        e?.emergency
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
