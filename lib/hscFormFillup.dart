import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

const String _formId = 'hsc_application';

class hscFormFillPage extends StatefulWidget {
  const hscFormFillPage({super.key});

  @override
  State<hscFormFillPage> createState() => _hscFormFillPageState();
}

class _hscFormFillPageState extends State<hscFormFillPage> {
  final formKey = GlobalKey<FormState>();

  final fullNameBn = TextEditingController();
  final fullNameEn = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateBirth = TextEditingController();
  final birthReg = TextEditingController();
  final nid = TextEditingController();
  final examYear = TextEditingController();
  final rollNumber = TextEditingController();
  final regNumber = TextEditingController();
  final correctedValue = TextEditingController();
  final mobile = TextEditingController();
  final altMobile = TextEditingController();
  final email = TextEditingController();
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

  String gender = "Male";
  String board = "Dhaka";
  String group = "Science";
  String fieldToCorrect = "Name";
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
          birthReg.text = data['birthReg'] ?? '';
          nid.text = data['nid'] ?? '';
          examYear.text = data['examYear'] ?? '';
          rollNumber.text = data['rollNumber'] ?? '';
          regNumber.text = data['regNumber'] ?? '';
          correctedValue.text = data['correctedValue'] ?? '';
          mobile.text = data['mobile'] ?? '';
          altMobile.text = data['altMobile'] ?? '';
          email.text = data['email'] ?? '';
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
          gender = data['gender'] ?? 'Male';
          board = data['board'] ?? 'Dhaka';
          group = data['group'] ?? 'Science';
          fieldToCorrect = data['fieldToCorrect'] ?? 'Name';
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
    motherName.dispose(); dateBirth.dispose(); birthReg.dispose();
    nid.dispose(); examYear.dispose(); rollNumber.dispose();
    regNumber.dispose(); correctedValue.dispose(); mobile.dispose();
    altMobile.dispose(); email.dispose(); perVillage.dispose();
    perPost.dispose(); perThana.dispose(); perDistrict.dispose();
    perDivision.dispose(); preVillage.dispose(); prePost.dispose();
    preThana.dispose(); preDistrict.dispose(); preDivision.dispose();
    guardianName.dispose(); guardianNid.dispose(); guardianPhone.dispose();
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

  Widget sectionTitle(String text, bool isBn) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: const Color(0xFF0F7A4F), borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: isBn
              ? GoogleFonts.hindSiliguri(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
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
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool isBn = appState.isBangla;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F7A4F),
        title: Text(
          isBn ? "এইচএসসি সংশোধন ফর্ম" : "HSC Correction Form",
          style: isBn
              ? GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold, color: Colors.white)
              : GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              sectionTitle(isBn ? "ব্যক্তিগত তথ্য" : "Personal Information", isBn),
              field(isBn ? "পূর্ণ নাম (বাংলা)" : "Full Name (Bangla)", 'fullNameBn', fullNameBn, isDark, appState),
              field(isBn ? "পূর্ণ নাম (ইংরেজি)" : "Full Name (English)", 'fullNameEn', fullNameEn, isDark, appState),
              field(isBn ? "পিতার নাম" : "Father's Name", 'fatherName', fatherName, isDark, appState),
              field(isBn ? "মাতার নাম" : "Mother's Name", 'motherName', motherName, isDark, appState),
              GestureDetector(
                onTap: () => pickDate(appState),
                child: AbsorbPointer(
                  child: field(isBn ? "জন্ম তারিখ" : "Date of Birth", 'dateBirth', dateBirth, isDark, appState),
                ),
              ),
              field(isBn ? "জন্ম নিবন্ধন নম্বর" : "Birth Certificate Number", 'birthReg', birthReg, isDark, appState),
              field(isBn ? "এনআইডি (ঐচ্ছিক)" : "NID (Optional)", 'nid', nid, isDark, appState),
              dropdown(isBn ? "লিঙ্গ" : "Gender", 'gender', gender, ["Male", "Female", "Others"],
                      (val) => setState(() => gender = val!), appState, isDark: isDark),

              sectionTitle(isBn ? "এইচএসসি পরীক্ষার তথ্য" : "HSC Exam Information", isBn),
              field(isBn ? "পরীক্ষার বছর" : "Exam Year", 'examYear', examYear, isDark, appState),
              dropdown(isBn ? "বোর্ড" : "Board", 'board', board,
                  ["Dhaka", "Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Comilla", "Jessore"],
                      (val) => setState(() => board = val!), appState, isDark: isDark),
              field(isBn ? "রোল নম্বর" : "Roll Number", 'rollNumber', rollNumber, isDark, appState),
              field(isBn ? "রেজিস্ট্রেশন নম্বর" : "Registration Number", 'regNumber', regNumber, isDark, appState),
              dropdown(isBn ? "বিভাগ" : "Group", 'group', group, ["Science", "Arts", "Commerce"],
                      (val) => setState(() => group = val!), appState, isDark: isDark),

              sectionTitle(isBn ? "সংশোধন বিবরণ" : "Correction Details", isBn),
              dropdown(isBn ? "সংশোধনের ক্ষেত্র" : "Field to Correct", 'fieldToCorrect', fieldToCorrect,
                  ["Name", "Father's Name", "Mother's Name", "Date of Birth", "Other"],
                      (val) => setState(() => fieldToCorrect = val!), appState, isDark: isDark),
              field(isBn ? "সঠিক তথ্যটি লিখুন" : "Corrected Value", 'correctedValue', correctedValue, isDark, appState),

              sectionTitle(isBn ? "যোগাযোগের তথ্য" : "Contact Information", isBn),
              field(isBn ? "মোবাইল নম্বর" : "Mobile Number", 'mobile', mobile, isDark, appState),
              field(isBn ? "স্থায়ী - গ্রাম/বাসা" : "Permanent - Village/House", 'perVillage', perVillage, isDark, appState),
              field(isBn ? "স্থায়ী - জেলা" : "Permanent - District", 'perDistrict', perDistrict, isDark, appState),

              CheckboxListTile(
                value: sameAddress,
                onChanged: (val) {
                  setState(() => sameAddress = val!);
                  appState.updateForm(_formId, 'sameAddress', val);
                },
                title: Text(
                  isBn ? "বর্তমান ঠিকানা স্থায়ী ঠিকানার মতো" : "Current address same as permanent",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                activeColor: const Color(0xFF0F7A4F),
              ),

              if (!sameAddress) ...[
                field(isBn ? "বর্তমান - গ্রাম/বাসা" : "Present - Village/House", 'preVillage', preVillage, isDark, appState),
                field(isBn ? "বর্তমান - জেলা" : "Present - District", 'preDistrict', preDistrict, isDark, appState),
              ],

              sectionTitle(isBn ? "অভিভাবকের তথ্য" : "Guardian Information", isBn),
              field(isBn ? "অভিভাবকের নাম" : "Guardian Name", 'guardianName', guardianName, isDark, appState),
              dropdown(isBn ? "সম্পর্ক" : "Relation", 'relation', relation,
                  ["Father", "Mother", "Legal Guardian"],
                      (val) => setState(() => relation = val!), appState, isDark: isDark),
              field(isBn ? "ফোন নম্বর" : "Phone Number", 'guardianPhone', guardianPhone, isDark, appState),

              sectionTitle(isBn ? "ডকুমেন্ট আপলোড" : "Document Upload", isBn),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    isBn ? "এইচএসসি সার্টিফিকেট/অ্যাডমিট কার্ড আপলোড" : "Upload HSC Certificate/Admit Card",
                    style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
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
                    isBn ? "জমা দিন" : "Submit",
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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