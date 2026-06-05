import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

const String _formId = 'birth_correction';

class Birthcorrectform extends StatefulWidget {
  const Birthcorrectform({super.key});

  @override
  State<Birthcorrectform> createState() => _BirthcorrectformState();
}

class _BirthcorrectformState extends State<Birthcorrectform> {
  final formkey = GlobalKey<FormState>();

  final fullNameBn = TextEditingController();
  final fullNameEn = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateBirth = TextEditingController();
  final religion = TextEditingController();
  final perVillage = TextEditingController();
  final perPost = TextEditingController();
  final perThana = TextEditingController();
  final perDistrict = TextEditingController();
  final perDivision = TextEditingController();
  final preVillage = TextEditingController();
  final prePost = TextEditingController();
  final preThana = TextEditingController();
  final preDistrict = TextEditingController();
  final preDivision = TextEditingController();
  final guardianName = TextEditingController();
  final guardianNid = TextEditingController();
  final guardianPhone = TextEditingController();
  final mobile = TextEditingController();
  final altMobile = TextEditingController();
  final email = TextEditingController();

  String gender = "Male";
  String relation = "Father";
  bool sameAddress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = Provider.of<Appstate>(context, listen: false);
      final data = await appState.loadDraft(_formId);
      if (data != null) {
        setState(() {
          fullNameBn.text = data['fullNameBn'] ?? '';
          fullNameEn.text = data['fullNameEn'] ?? '';
          fatherName.text = data['fatherName'] ?? '';
          motherName.text = data['motherName'] ?? '';
          dateBirth.text = data['dateBirth'] ?? '';
          religion.text = data['religion'] ?? '';
          perVillage.text = data['perVillage'] ?? '';
          perPost.text = data['perPost'] ?? '';
          perThana.text = data['perThana'] ?? '';
          perDistrict.text = data['perDistrict'] ?? '';
          perDivision.text = data['perDivision'] ?? '';
          preVillage.text = data['preVillage'] ?? '';
          prePost.text = data['prePost'] ?? '';
          preThana.text = data['preThana'] ?? '';
          preDistrict.text = data['preDistrict'] ?? '';
          preDivision.text = data['preDivision'] ?? '';
          guardianName.text = data['guardianName'] ?? '';
          guardianNid.text = data['guardianNid'] ?? '';
          guardianPhone.text = data['guardianPhone'] ?? '';
          mobile.text = data['mobile'] ?? '';
          altMobile.text = data['altMobile'] ?? '';
          email.text = data['email'] ?? '';
          gender = data['gender'] ?? 'Male';
          relation = data['relation'] ?? 'Father';
          sameAddress = data['sameAddress'] ?? false;
        });
      }
      appState.enableSync(_formId);
    });
  }

  @override
  void dispose() {
    fullNameBn.dispose(); fullNameEn.dispose(); fatherName.dispose();
    motherName.dispose(); dateBirth.dispose(); religion.dispose();
    perVillage.dispose(); perPost.dispose(); perThana.dispose();
    perDistrict.dispose(); perDivision.dispose(); preVillage.dispose();
    prePost.dispose(); preThana.dispose(); preDistrict.dispose();
    preDivision.dispose(); guardianName.dispose(); guardianNid.dispose();
    guardianPhone.dispose(); mobile.dispose(); altMobile.dispose();
    email.dispose();
    super.dispose();
  }

  Widget field(String label, String dbKey, TextEditingController controller, bool isDark, Appstate appState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        onChanged: (val) => appState.updateForm(_formId, dbKey, val),
        validator: (value) => value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: isDark ? Colors.white : const Color(0xFF0F7A4F), fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2)),
          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.green, width: 2)),
        ),
      ),
    );
  }

  Widget dropdown(String label, String dbKey, String value, List<String> items, Function(String?) onChanged, Appstate appState, {bool isDark = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: isDark ? Colors.grey[900] : Colors.white,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (val) {
          onChanged(val);
          if (val != null) appState.updateForm(_formId, dbKey, val);
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: isDark ? Colors.white : const Color(0xFF0F7A4F), fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2)),
        ),
      ),
    );
  }

  Widget sectionTitle(String text, bool isBangla) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: const Color(0xFF0F7A4F), borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: isBangla
              ? GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
              : GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> pickDate(Appstate appState) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1944),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(colorScheme: const ColorScheme.light(primary: Color(0xFF0F7A4F))),
        child: child!,
      ),
    );
    if (picked != null) {
      final dateStr = "${picked.day}/${picked.month}/${picked.year}";
      setState(() => dateBirth.text = dateStr);
      appState.updateForm(_formId, 'dateBirth', dateStr);
    }
  }

  void submit() {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool isBangla = appState.isBangla;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F7A4F),
        title: Text(
          isBangla ? "জন্ম নিবন্ধনের সংশোধন ফর্ম" : "Birth Certificate Correction Form",
          style: isBangla
              ? GoogleFonts.hindSiliguri(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
              : GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              sectionTitle(isBangla ? "ব্যক্তিগত তথ্য" : "Personal Information", isBangla),
              field(isBangla ? "পূর্ণ নাম (বাংলায়)" : "Full Name In Bangla", 'fullNameBn', fullNameBn, isDark, appState),
              field(isBangla ? "পূর্ণ নাম (ইংরেজিতে)" : "Full Name In English", 'fullNameEn', fullNameEn, isDark, appState),
              field(isBangla ? "পিতার নাম" : "Father's Name", 'fatherName', fatherName, isDark, appState),
              field(isBangla ? "মাতার নাম" : "Mother's Name", 'motherName', motherName, isDark, appState),
              field(isBangla ? "ধর্ম" : "Religion", 'religion', religion, isDark, appState),
              GestureDetector(
                onTap: () => pickDate(appState),
                child: AbsorbPointer(
                  child: field(isBangla ? "জন্ম তারিখ" : "Date of Birth", 'dateBirth', dateBirth, isDark, appState),
                ),
              ),
              dropdown(isBangla ? "লিঙ্গ" : "Gender", 'gender', gender, ["Male", "Female", "Others"],
                      (val) => setState(() => gender = val!), appState, isDark: isDark),

              sectionTitle(isBangla ? "যোগাযোগের ঠিকানা" : "Contact Address", isBangla),
              field(isBangla ? "স্থায়ী - গ্রাম/বাসা" : "Permanent - Village/House", 'perVillage', perVillage, isDark, appState),
              field(isBangla ? "স্থায়ী - পোস্ট অফিস" : "Permanent - Post Office", 'perPost', perPost, isDark, appState),
              field(isBangla ? "স্থায়ী - থানা" : "Permanent - Thana", 'perThana', perThana, isDark, appState),
              field(isBangla ? "স্থায়ী - জেলা" : "Permanent - District", 'perDistrict', perDistrict, isDark, appState),
              field(isBangla ? "স্থায়ী - বিভাগ" : "Permanent - Division", 'perDivision', perDivision, isDark, appState),

              CheckboxListTile(
                value: sameAddress,
                onChanged: (val) {
                  setState(() => sameAddress = val!);
                  appState.updateForm(_formId, 'sameAddress', val);
                },
                title: Text(
                  isBangla ? "বর্তমান ঠিকানা স্থায়ী ঠিকানার মতো" : "Current address same as permanent",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                checkColor: Colors.white,
                activeColor: isDark ? Colors.greenAccent : Colors.green,
                tileColor: isDark ? Colors.grey[850] : Colors.white,
              ),

              if (!sameAddress) ...[
                field(isBangla ? "বর্তমান - গ্রাম/বাসা" : "Present - Village/House", 'preVillage', preVillage, isDark, appState),
                field(isBangla ? "বর্তমান - পোস্ট অফিস" : "Present - Post Office", 'prePost', prePost, isDark, appState),
                field(isBangla ? "বর্তমান - থানা" : "Present - Thana", 'preThana', preThana, isDark, appState),
                field(isBangla ? "বর্তমান - জেলা" : "Present - District", 'preDistrict', preDistrict, isDark, appState),
                field(isBangla ? "বর্তমান - বিভাগ" : "Present - Division", 'preDivision', preDivision, isDark, appState),
              ],

              sectionTitle(isBangla ? "অভিভাবকের তথ্য" : "Guardian Information", isBangla),
              field(isBangla ? "অভিভাবকের নাম" : "Guardian Name", 'guardianName', guardianName, isDark, appState),
              dropdown(isBangla ? "সম্পর্ক" : "Relation", 'relation', relation,
                  ["Father", "Mother", "Husband", "Legal Guardian"],
                      (val) => setState(() => relation = val!), appState, isDark: isDark),
              field(isBangla ? "অভিভাবকের NID" : "Guardian NID", 'guardianNid', guardianNid, isDark, appState),
              field(isBangla ? "ফোন নম্বর" : "Phone Number", 'guardianPhone', guardianPhone, isDark, appState),

              sectionTitle(isBangla ? "যোগাযোগ তথ্য" : "Contact Information", isBangla),
              field(isBangla ? "মোবাইল নম্বর" : "Mobile Number", 'mobile', mobile, isDark, appState),
              field(isBangla ? "বিকল্প মোবাইল" : "Alternate Mobile", 'altMobile', altMobile, isDark, appState),
              field(isBangla ? "ইমেইল ঠিকানা" : "Email Address", 'email', email, isDark, appState),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F7A4F),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    isBangla ? "জমা দিন" : "Submit",
                    style: isBangla
                        ? GoogleFonts.hindSiliguri(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                        : GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}