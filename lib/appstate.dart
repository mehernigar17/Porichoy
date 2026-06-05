import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Appstate extends ChangeNotifier {
  bool _isDark = false;
  bool _isBangla = false;
  bool get isDark => _isDark;
  bool get isBangla => _isBangla;

  final Map<String, Map<String, dynamic>> _formData = {};
  final Map<String, Timer?> _debounces = {};
  final Map<String, bool> _syncEnabled = {};

  Map<String, dynamic> get nidFormData => _formData['nid_application'] ?? {};
  set nidFormData(Map<String, dynamic> data) => _formData['nid_application'] = data;

  void setDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  void setLanguage(bool value) {
    _isBangla = value;
    notifyListeners();
  }

  void enableSync(String formId) {
    _syncEnabled[formId] = true;
  }

  void updateForm(String formId, String key, dynamic value) {
    if (_syncEnabled[formId] != true) return;

    _formData[formId] ??= {};
    _formData[formId]![key] = value;

    _debounces[formId]?.cancel();

    _debounces[formId] = Timer(const Duration(milliseconds: 500), () {
      _saveToFirestore(formId);
    });

    notifyListeners();
  }

  void updateNidForm(String key, dynamic value) {
    updateForm('nid_application', key, value);
  }

  Future<void> _saveToFirestore(String formId) async {
    final user = FirebaseAuth.instance.currentUser;
    final data = _formData[formId];

    if (user != null && data != null && data.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('drafts')
            .doc(formId)
            .set(data, SetOptions(merge: true));
        print("[$formId] synced to Firestore!");
      } catch (e) {
        print("[$formId] Error saving: $e");
      }
    }
  }
  Future<Map<String, dynamic>?> loadDraft(String formId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('drafts')
          .doc(formId)
          .get();

      if (doc.exists && doc.data() != null) {
        _formData[formId] = Map<String, dynamic>.from(doc.data()!);
        return _formData[formId];
      }
    } catch (e) {
      print("[$formId] Error loading: $e");
    }
    return null;
  }
}