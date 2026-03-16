import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appstate.dart';

class hscFormFillPage extends StatefulWidget {
  const hscFormFillPage({super.key});

  @override
  State<hscFormFillPage> createState() => _hscFormFillPageState();
}

class _hscFormFillPageState extends State<hscFormFillPage> {
  final formKey = GlobalKey<FormState>();


  String getUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.email ?? "guest_user";
  }


  final fullNameBn = TextEditingController();
  final fullNameEn = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateBirth = TextEditingController();
  final birthReg = TextEditingController();
  final Nid = TextEditingController();
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


  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = getUserId();

    setState(() {
      fullNameBn.text = prefs.getString("${uid}_HSC_fullNameBn") ?? "";
      fullNameEn.text = prefs.getString("${uid}_HSC_fullNameEn") ?? "";
      fatherName.text = prefs.getString("${uid}_HSC_fatherName") ?? "";
      motherName.text = prefs.getString("${uid}_HSC_motherName") ?? "";
      dateBirth.text = prefs.getString("${uid}_HSC_dob") ?? "";
      birthReg.text = prefs.getString("${uid}_HSC_birthReg") ?? "";
      Nid.text = prefs.getString("${uid}_HSC_nid") ?? "";
      examYear.text = prefs.getString("${uid}_HSC_examYear") ?? "";
      rollNumber.text = prefs.getString("${uid}_HSC_roll") ?? "";
      regNumber.text = prefs.getString("${uid}_HSC_reg") ?? "";
      correctedValue.text = prefs.getString("${uid}_HSC_correctedVal") ?? "";
      mobile.text = prefs.getString("${uid}_HSC_mobile") ?? "";
      altMobile.text = prefs.getString("${uid}_HSC_altMobile") ?? "";
      email.text = prefs.getString("${uid}_HSC_email") ?? "";
      perVillage.text = prefs.getString("${uid}_HSC_perVillage") ?? "";
      perPost.text = prefs.getString("${uid}_HSC_perPost") ?? "";
      perThana.text = prefs.getString("${uid}_HSC_perThana") ?? "";
      perDistrict.text = prefs.getString("${uid}_HSC_perDistrict") ?? "";
      perDivision.text = prefs.getString("${uid}_HSC_perDivision") ?? "";
      preVillage.text = prefs.getString("${uid}_HSC_preVillage") ?? "";
      prePost.text = prefs.getString("${uid}_HSC_prePost") ?? "";
      preThana.text = prefs.getString("${uid}_HSC_preThana") ?? "";
      preDistrict.text = prefs.getString("${uid}_HSC_preDistrict") ?? "";
      preDivision.text = prefs.getString("${uid}_HSC_preDivision") ?? "";
      guardianName.text = prefs.getString("${uid}_HSC_gName") ?? "";
      guardianNid.text = prefs.getString("${uid}_HSC_gNid") ?? "";
      guardianPhone.text = prefs.getString("${uid}_HSC_gPhone") ?? "";
    });
  }


  void autoSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = getUserId();

    prefs.setString("${uid}_HSC_fullNameBn", fullNameBn.text);
    prefs.setString("${uid}_HSC_fullNameEn", fullNameEn.text);
    prefs.setString("${uid}_HSC_fatherName", fatherName.text);
    prefs.setString("${uid}_HSC_motherName", motherName.text);
    prefs.setString("${uid}_HSC_dob", dateBirth.text);
    prefs.setString("${uid}_HSC_birthReg", birthReg.text);
    prefs.setString("${uid}_HSC_nid", Nid.text);
    prefs.setString("${uid}_HSC_examYear", examYear.text);
    prefs.setString("${uid}_HSC_roll", rollNumber.text);
    prefs.setString("${uid}_HSC_reg", regNumber.text);
    prefs.setString("${uid}_HSC_correctedVal", correctedValue.text);
    prefs.setString("${uid}_HSC_mobile", mobile.text);
    prefs.setString("${uid}_HSC_altMobile", altMobile.text);
    prefs.setString("${uid}_HSC_email", email.text);
    prefs.setString("${uid}_HSC_perVillage", perVillage.text);
    prefs.setString("${uid}_HSC_perPost", perPost.text);
    prefs.setString("${uid}_HSC_perThana", perThana.text);
    prefs.setString("${uid}_HSC_perDistrict", perDistrict.text);
    prefs.setString("${uid}_HSC_perDivision", perDivision.text);
    prefs.setString("${uid}_HSC_preVillage", preVillage.text);
    prefs.setString("${uid}_HSC_prePost", prePost.text);
    prefs.setString("${uid}_HSC_preThana", preThana.text);
    prefs.setString("${uid}_HSC_preDistrict", preDistrict.text);
    prefs.setString("${uid}_HSC_preDivision", preDivision.text);
    prefs.setString("${uid}_HSC_gName", guardianName.text);
    prefs.setString("${uid}_HSC_gNid", guardianNid.text);
    prefs.setString("${uid}_HSC_gPhone", guardianPhone.text);
  }

  @override
  void initState() {
    super.initState();
    loadData();


    List<TextEditingController> controllers = [
      fullNameBn, fullNameEn, fatherName, motherName, dateBirth, birthReg, Nid,
      examYear, rollNumber, regNumber, correctedValue, mobile, altMobile, email,
      perVillage, perPost, perThana, perDistrict, perDivision, preVillage,
      prePost, preThana, preDistrict, preDivision, guardianName, guardianNid, guardianPhone
    ];

    for (var controller in controllers) {
      controller.addListener(autoSave);
    }
  }

  Widget field(String label, TextEditingController controller, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        validator: (value) => value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? Colors.white : Color(0xFF0F7A4F),
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0F7A4F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2),
          ),
        ),
      ),
    );
  }

  Widget dropdown(String label, String value, List<String> items, Function(String?) onChanged, {bool isDark = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (val) {
          onChanged(val);
          autoSave();
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? Colors.white : Color(0xFF0F7A4F),
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
        ),
      ),
    );
  }

  Widget sectionTitle(String text, bool isBn) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF0F7A4F),
        borderRadius: BorderRadius.circular(8),
      ),
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

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1944),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Color(0xFF0F7A4F)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateBirth.text = "${picked.day}/${picked.month}/${picked.year}";
      });
      autoSave();
    }
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      autoSave();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form saved successfully!")),
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
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              sectionTitle(isBn ? "ব্যক্তিগত তথ্য" : "Personal Information", isBn),
              field(isBn ? "পূর্ণ নাম (বাংলা)" : "Full Name (Bangla)", fullNameBn, isDark),
              field(isBn ? "পূর্ণ নাম (ইংরেজি)" : "Full Name (English)", fullNameEn, isDark),
              field(isBn ? "পিতার নাম" : "Father's Name", fatherName, isDark),
              field(isBn ? "মাতার নাম" : "Mother's Name", motherName, isDark),
              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(child: field(isBn ? "জন্ম তারিখ" : "Date of Birth", dateBirth, isDark)),
              ),
              field(isBn ? "জন্ম নিবন্ধন নম্বর" : "Birth Certificate Number", birthReg, isDark),
              field(isBn ? "এনআইডি (ঐচ্ছিক)" : "NID (Optional)", Nid, isDark),
              dropdown(isBn ? "লিঙ্গ" : "Gender", gender, ["Male", "Female", "Others"], (val) => setState(() => gender = val!), isDark: isDark),

              sectionTitle(isBn ? "এইচএসসি পরীক্ষার তথ্য" : "HSC Exam Information", isBn),
              field(isBn ? "পরীক্ষার বছর" : "Exam Year", examYear, isDark),
              dropdown(isBn ? "বোর্ড" : "Board", board, ["Dhaka","Chittagong","Rajshahi","Khulna","Barisal","Sylhet","Comilla","Jessore"], (val) => setState(()=>board=val!), isDark: isDark),
              field(isBn ? "রোল নম্বর" : "Roll Number", rollNumber, isDark),
              field(isBn ? "রেজিস্ট্রেশন নম্বর" : "Registration Number", regNumber, isDark),
              dropdown(isBn ? "বিভাগ" : "Group", group, ["Science","Arts","Commerce"], (val) => setState(()=>group=val!), isDark: isDark),

              sectionTitle(isBn ? "সংশোধন বিবরণ" : "Correction Details", isBn),
              dropdown(isBn ? "সংশোধনের ক্ষেত্র" : "Field to Correct", fieldToCorrect, ["Name","Father's Name","Mother's Name","Date of Birth","Other"], (val)=>setState(()=>fieldToCorrect=val!), isDark: isDark),
              field(isBn ? "সঠিক তথ্যটি লিখুন" : "Corrected Value", correctedValue, isDark),

              sectionTitle(isBn ? "যোগাযোগের তথ্য" : "Contact Information", isBn),
              field(isBn ? "মোবাইল নম্বর" : "Mobile Number", mobile, isDark),
              field(isBn ? "স্থায়ী - গ্রাম/বাসা" : "Permanent - Village/House", perVillage, isDark),
              field(isBn ? "স্থায়ী - জেলা" : "Permanent - District", perDistrict, isDark),

              CheckboxListTile(
                value: sameAddress,
                onChanged: (val) => setState(() => sameAddress = val!),
                title: Text(isBn ? "বর্তমান ঠিকানা স্থায়ী ঠিকানার মতো" : "Current address same as permanent", style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              ),

              if (!sameAddress) ...[
                field(isBn ? "বর্তমান - গ্রাম/বাসা" : "Present - Village/House", preVillage, isDark),
                field(isBn ? "বর্তমান - জেলা" : "Present - District", preDistrict, isDark),
              ],

              sectionTitle(isBn ? "অভিভাবকের তথ্য" : "Guardian Information", isBn),
              field(isBn ? "অভিভাবকের নাম" : "Guardian Name", guardianName, isDark),
              dropdown(isBn ? "সম্পর্ক" : "Relation", relation, ["Father","Mother","Legal Guardian"], (val) => setState(() => relation = val!), isDark: isDark),
              field(isBn ? "ফোন নম্বর" : "Phone Number", guardianPhone, isDark),

              sectionTitle(isBn ? "ডকুমেন্ট আপলোড" : "Document Upload", isBn),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(8)),
                child: Center(child: Text(isBn ? "এইচএসসি সার্টিফিকেট/অ্যাডমিট কার্ড আপলোড" : "Upload HSC Certificate/Admit Card", style: TextStyle(color: isDark ? Colors.white70 : Colors.black54))),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0F7A4F), padding: EdgeInsets.symmetric(vertical: 14)),
                  child: Text(isBn ? "জমা দিন" : "Submit", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}