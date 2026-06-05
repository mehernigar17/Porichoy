import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

const String _formId = 'passport_application';

class FormFillPage extends StatefulWidget {
  const FormFillPage({super.key});

  @override
  State<FormFillPage> createState() => _FormFillPageState();
}

class _FormFillPageState extends State<FormFillPage> {
  final formkey = GlobalKey<FormState>();

  final fullNameBn = TextEditingController();
  final fullNameEn = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateBirth = TextEditingController();
  final birthReg = TextEditingController();
  final nid = TextEditingController();
  final religion = TextEditingController();
  final birthPlace = TextEditingController();
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
  String maritalStatus = "Single";
  String relation = "Father";
  String passportType = "Ordinary";
  String pageCount = "48";
  String validity = "5 Years";
  String policeVerify = "Yes";
  String urgentType = "Regular";
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
          birthReg.text = data['birthReg'] ?? '';
          nid.text = data['nid'] ?? '';
          religion.text = data['religion'] ?? '';
          birthPlace.text = data['birthPlace'] ?? '';
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
          maritalStatus = data['maritalStatus'] ?? 'Single';
          relation = data['relation'] ?? 'Father';
          passportType = data['passportType'] ?? 'Ordinary';
          pageCount = data['pageCount'] ?? '48';
          validity = data['validity'] ?? '5 Years';
          policeVerify = data['policeVerify'] ?? 'Yes';
          urgentType = data['urgentType'] ?? 'Regular';
          sameAddress = data['sameAddress'] ?? false;
        });
      }
      appState.enableSync(_formId);
    });
  }

  @override
  void dispose() {
    fullNameBn.dispose(); fullNameEn.dispose(); fatherName.dispose();
    motherName.dispose(); dateBirth.dispose(); birthReg.dispose();
    nid.dispose(); religion.dispose(); birthPlace.dispose();
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
          isBangla ? "পাসপোর্ট আবেদন ফর্ম" : "Passport Application Form",
          style: isBangla
              ? GoogleFonts.hindSiliguri(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)
              : GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
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
              field(isBangla ? "জন্মস্থান" : "Place of Birth", 'birthPlace', birthPlace, isDark, appState),
              GestureDetector(
                onTap: () => pickDate(appState),
                child: AbsorbPointer(
                  child: field(isBangla ? "জন্ম তারিখ" : "Date of Birth", 'dateBirth', dateBirth, isDark, appState),
                ),
              ),
              field(isBangla ? "জন্ম নিবন্ধন নম্বর" : "Birth Certificate Number", 'birthReg', birthReg, isDark, appState),
              field(isBangla ? "জাতীয় পরিচয়পত্র নম্বর (NID)" : "National ID Card Number", 'nid', nid, isDark, appState),
              dropdown(isBangla ? "লিঙ্গ" : "Gender", 'gender', gender, ["Male", "Female", "Others"],
                      (val) => setState(() => gender = val!), appState, isDark: isDark),
              dropdown(isBangla ? "বৈবাহিক অবস্থা" : "Marital Status", 'maritalStatus', maritalStatus, ["Single", "Married"],
                      (val) => setState(() => maritalStatus = val!), appState, isDark: isDark),

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

              sectionTitle(isBangla ? "পাসপোর্ট সংক্রান্ত তথ্য" : "Passport Information", isBangla),
              dropdown(isBangla ? "পাসপোর্ট টাইপ" : "Passport Type", 'passportType', passportType,
                  ["Ordinary", "Official", "Diplomatic"],
                      (val) => setState(() => passportType = val!), appState, isDark: isDark),
              dropdown(isBangla ? "পৃষ্ঠা সংখ্যা" : "Page Count", 'pageCount', pageCount, ["48", "64"],
                      (val) => setState(() => pageCount = val!), appState, isDark: isDark),
              dropdown(isBangla ? "মেয়াদ" : "Validity", 'validity', validity, ["5 Years", "10 Years"],
                      (val) => setState(() => validity = val!), appState, isDark: isDark),
              dropdown(isBangla ? "পুলিশ ভেরিফিকেশন প্রয়োজন?" : "Police Verification Required?", 'policeVerify', policeVerify, ["Yes", "No"],
                      (val) => setState(() => policeVerify = val!), appState, isDark: isDark),
              dropdown(isBangla ? "জরুরি আবেদন?" : "Urgent Application?", 'urgentType', urgentType, ["Regular", "Express"],
                      (val) => setState(() => urgentType = val!), appState, isDark: isDark),

              sectionTitle(isBangla ? "ছবি আপলোড" : "Photo Upload", isBangla),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt, size: 40, color: Colors.green),
                      const SizedBox(height: 8),
                      Text(
                        isBangla ? "ছবি আপলোড করুন" : "Upload picture here",
                        style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),

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