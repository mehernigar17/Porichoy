
  import 'dart:async';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';

  class Appstate extends ChangeNotifier {
  bool _isDark = false;
  bool _isBangla = false;
  bool get isDark => _isDark;
  bool get isBangla => _isBangla;

  Map<String, dynamic> nidFormData = {};
  Timer? _debounce;
  bool isSyncingEnabled = false;

  void setDark(bool value) {
  _isDark = value;
  notifyListeners();
  }

  void setLanguage(bool value) {
  _isBangla = value;
  notifyListeners();
  }

  void enableSync() => isSyncingEnabled = true;

  void updateNidForm(String key, dynamic value) {
  if (!isSyncingEnabled) return;

  nidFormData[key] = value;

  if (_debounce?.isActive ?? false) _debounce!.cancel();
  _debounce = Timer(const Duration(milliseconds: 500), () {
  _saveToFirestore();
  });
  notifyListeners();
  }

  Future<void> _saveToFirestore() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null && nidFormData.isNotEmpty) {
  try {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('drafts')
      .doc('nid_application')
      .set(nidFormData, SetOptions(merge: true));
  print("Data synced to Cloud!");
  } catch (e) {
  print("Error saving: $e");
  }
  }
  }
  }