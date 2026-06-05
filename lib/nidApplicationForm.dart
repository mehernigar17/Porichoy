import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class NidApplicationForm extends StatefulWidget {
  const NidApplicationForm({super.key});

  @override
  State<NidApplicationForm> createState() => _NidApplicationFormState();
}

class _NidApplicationFormState extends State<NidApplicationForm> {
  final formkey = GlobalKey<FormState>();

  final fullNameBn = TextEditingController();
  final fullNameEn = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateBirth = TextEditingController();
  final birthReg = TextEditingController();
  final religion = TextEditingController();
  final birthPlace = TextEditingController();
  final bloodGroup = TextEditingController();

  final perVillage = TextEditingController();
  final perPost = TextEditingController();
  final perThana = TextEditingController();
  final perDistrict = TextEditingController();

  final preVillage = TextEditingController();
  final prePost = TextEditingController();
  final preThana = TextEditingController();
  final preDistrict = TextEditingController();

  final mobile = TextEditingController();
  final email = TextEditingController();

  String gender = "Male";
  String maritalStatus = "Single";
  bool sameAddress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = Provider.of<Appstate>(context, listen: false);
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        try {
          var doc = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('drafts')
              .doc('nid_application')
              .get();

          if (doc.exists && doc.data() != null) {
            var data = doc.data()!;
            setState(() {
              fullNameBn.text = data['fullNameBn'] ?? "";
              fullNameEn.text = data['fullNameEn'] ?? "";
              fatherName.text = data['fatherName'] ?? "";
              motherName.text = data['motherName'] ?? "";
              dateBirth.text = data['dateBirth'] ?? "";
              birthReg.text = data['birthReg'] ?? "";
              religion.text = data['religion'] ?? "";
              birthPlace.text = data['birthPlace'] ?? "";
              bloodGroup.text = data['bloodGroup'] ?? "";
              perVillage.text = data['perVillage'] ?? "";
              perPost.text = data['perPost'] ?? "";
              perThana.text = data['perThana'] ?? "";
              perDistrict.text = data['perDistrict'] ?? "";
              preVillage.text = data['preVillage'] ?? "";
              prePost.text = data['prePost'] ?? "";
              preThana.text = data['preThana'] ?? "";
              preDistrict.text = data['preDistrict'] ?? "";
              mobile.text = data['mobile'] ?? "";
              email.text = data['email'] ?? "";
              gender = data['gender'] ?? "Male";
              maritalStatus = data['maritalStatus'] ?? "Single";
              sameAddress = data['sameAddress'] ?? false;
            });
            appState.nidFormData = Map<String, dynamic>.from(data);
          }
        } catch (e) {
          print("Error loading data: $e");
        }
        appState.enableSync('nid_application');
      }
    });
  }

  Widget field(String label, String dbKey, TextEditingController controller, bool isDark, Appstate appState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        onChanged: (value) => appState.updateNidForm(dbKey, value),
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        validator: (value) => value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? Colors.grey[400] : const Color(0xFF0F7A4F),
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2)),
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
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: (val) {
          onChanged(val);
          if (val != null) appState.updateNidForm(dbKey, val);
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? Colors.grey[400] : const Color(0xFF0F7A4F),
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget sectionTitle(String text, bool isBangla) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F7A4F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: isBangla
              ? GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)
              : GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> pickDate(Appstate appState) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      String dateStr = "${picked.day}/${picked.month}/${picked.year}";
      setState(() {
        dateBirth.text = dateStr;
      });
      appState.updateNidForm("dateBirth", dateStr);
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
        foregroundColor: Colors.white,
        title: Text(
          isBangla ? "নতুন এনআইডি আবেদন" : "New NID Application",
          style: isBangla ? GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold) : GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              sectionTitle(isBangla ? "ব্যক্তিগত তথ্য" : "Personal Information", isBangla),
              field(isBangla ? "নাম (বাংলা)" : "Name (Bangla)", "fullNameBn", fullNameBn, isDark, appState),
              field(isBangla ? "নাম (ইংরেজি)" : "Name (English)", "fullNameEn", fullNameEn, isDark, appState),
              field(isBangla ? "পিতার নাম" : "Father's Name", "fatherName", fatherName, isDark, appState),
              field(isBangla ? "মাতার নাম" : "Mother's Name", "motherName", motherName, isDark, appState),
              GestureDetector(
                onTap: () => pickDate(appState),
                child: AbsorbPointer(
                  child: field(isBangla ? "জন্ম তারিখ" : "Date of Birth", "dateBirth", dateBirth, isDark, appState),
                ),
              ),
              field(isBangla ? "জন্ম নিবন্ধন নম্বর" : "Birth Registration No", "birthReg", birthReg, isDark, appState),
              field(isBangla ? "রক্তের গ্রুপ" : "Blood Group", "bloodGroup", bloodGroup, isDark, appState),
              dropdown(isBangla ? "লিঙ্গ" : "Gender", "gender", gender, ["Male", "Female", "Others"], (val) => setState(() => gender = val!), appState, isDark: isDark),
              dropdown(isBangla ? "বৈবাহিক অবস্থা" : "Marital Status", "maritalStatus", maritalStatus, ["Single", "Married", "Widowed"], (val) => setState(() => maritalStatus = val!), appState, isDark: isDark),
              sectionTitle(isBangla ? "ঠিকানা" : "Address", isBangla),
              field(isBangla ? "স্থায়ী গ্রাম/রাস্তা" : "Permanent Village/Road", "perVillage", perVillage, isDark, appState),
              field(isBangla ? "স্থায়ী জেলা" : "Permanent District", "perDistrict", perDistrict, isDark, appState),
              CheckboxListTile(
                value: sameAddress,
                onChanged: (val) {
                  setState(() => sameAddress = val!);
                  appState.updateNidForm("sameAddress", val.toString());
                },
                title: Text(
                  isBangla ? "বর্তমান ও স্থায়ী ঠিকানা একই" : "Present address same as permanent",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                activeColor: const Color(0xFF0F7A4F),
              ),
              if (!sameAddress) ...[
                field(isBangla ? "বর্তমান গ্রাম/রাস্তা" : "Present Village/Road", "preVillage", preVillage, isDark, appState),
                field(isBangla ? "বর্তমান জেলা" : "Present District", "preDistrict", preDistrict, isDark, appState),
              ],
              sectionTitle(isBangla ? "যোগাযোগ" : "Contact", isBangla),
              field(isBangla ? "মোবাইল নম্বর" : "Mobile Number", "mobile", mobile, isDark, appState),
              field(isBangla ? "ইমেইল" : "Email", "email", email, isDark, appState),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Application Submitted Successfully")));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F7A4F)),
                  child: Text(
                    isBangla ? "জমা দিন" : "Submit Application",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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