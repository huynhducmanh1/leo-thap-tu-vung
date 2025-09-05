import 'package:firebase_auth/firebase_auth.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_repository.dart';

class AuthRepository {
  // We get the FirebaseAuth instance.
  AuthRepository(this._firebaseAuth, this._databaseRepository);
  final FirebaseAuth _firebaseAuth;
  final DatabaseRepository _databaseRepository;

  /// A stream that emits the current user when the auth state changes.
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  /// Signs a user in with email and password.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Creates a new user account with email and password.
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // 1. Create the user in Firebase Auth
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // 2. Create the user profile document in Firestore
    if (userCredential.user != null) {
      await _databaseRepository.createUserProfile(userCredential.user!);
    }

    return userCredential;
  }

  /// Signs the current user out.
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}