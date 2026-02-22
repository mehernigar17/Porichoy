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

  Widget field(String label, TextEditingController controller, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
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

  Widget dropdown(String label, String value, List<String> items, Function(String?) onChanged, {bool isDark = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: isDark ? Colors.grey[900] : Colors.white,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
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

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateBirth.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void submit() {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("NID Application Submitted")),
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
              field(isBangla ? "নাম (বাংলা)" : "Name (Bangla)", fullNameBn, isDark),
              field(isBangla ? "নাম (ইংরেজি)" : "Name (English)", fullNameEn, isDark),
              field(isBangla ? "পিতার নাম" : "Father's Name", fatherName, isDark),
              field(isBangla ? "মাতার নাম" : "Mother's Name", motherName, isDark),

              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(
                  child: field(isBangla ? "জন্ম তারিখ" : "Date of Birth", dateBirth, isDark),
                ),
              ),

              field(isBangla ? "জন্ম নিবন্ধন নম্বর" : "Birth Registration No", birthReg, isDark),
              field(isBangla ? "রক্তের গ্রুপ" : "Blood Group", bloodGroup, isDark),

              dropdown(isBangla ? "লিঙ্গ" : "Gender", gender, ["Male", "Female", "Others"], (val) => setState(() => gender = val!), isDark: isDark),
              dropdown(isBangla ? "বৈবাহিক অবস্থা" : "Marital Status", maritalStatus, ["Single", "Married", "Widowed"], (val) => setState(() => maritalStatus = val!), isDark: isDark),

              sectionTitle(isBangla ? "ঠিকানা" : "Address", isBangla),
              field(isBangla ? "স্থায়ী গ্রাম/রাস্তা" : "Permanent Village/Road", perVillage, isDark),
              field(isBangla ? "স্থায়ী জেলা" : "Permanent District", perDistrict, isDark),

              CheckboxListTile(
                value: sameAddress,
                onChanged: (val) => setState(() => sameAddress = val!),
                title: Text(
                  isBangla ? "বর্তমান ও স্থায়ী ঠিকানা একই" : "Present address same as permanent",
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                activeColor: const Color(0xFF0F7A4F),
              ),

              if (!sameAddress) ...[
                field(isBangla ? "বর্তমান গ্রাম/রাস্তা" : "Present Village/Road", preVillage, isDark),
                field(isBangla ? "বর্তমান জেলা" : "Present District", preDistrict, isDark),
              ],

              sectionTitle(isBangla ? "যোগাযোগ" : "Contact", isBangla),
              field(isBangla ? "মোবাইল নম্বর" : "Mobile Number", mobile, isDark),
              field(isBangla ? "ইমেইল" : "Email", email, isDark),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: submit,
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

