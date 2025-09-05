import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_repository.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// This provider no longer needs to know about the user's auth state.
final databaseRepositoryProvider = Provider<DatabaseRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return DatabaseRepository(firestore);
});