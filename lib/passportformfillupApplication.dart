
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appstate.dart';

class FormFillPage extends StatefulWidget {
  const FormFillPage({super.key});

  @override
  State<FormFillPage> createState() => _FormFillPageState();
}

class _FormFillPageState extends State<FormFillPage> {
  bool isBangla = false;
  bool isDark = false;
  final formkey = GlobalKey<FormState>();


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

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = getUserId();

    setState(() {
      fullNameBn.text = prefs.getString("${uid}_fullNameBn") ?? "";
      fullNameEn.text = prefs.getString("${uid}_fullNameEn") ?? "";
      fatherName.text = prefs.getString("${uid}_fatherName") ?? "";
      motherName.text = prefs.getString("${uid}_motherName") ?? "";
      dateBirth.text = prefs.getString("${uid}_dob") ?? "";
      birthReg.text = prefs.getString("${uid}_birthReg") ?? "";
      Nid.text = prefs.getString("${uid}_nid") ?? "";
      religion.text = prefs.getString("${uid}_religion") ?? "";
      birthPlace.text = prefs.getString("${uid}_birthPlace") ?? "";

      perVillage.text = prefs.getString("${uid}_perVillage") ?? "";
      perPost.text = prefs.getString("${uid}_perPost") ?? "";
      perThana.text = prefs.getString("${uid}_perThana") ?? "";
      perDistrict.text = prefs.getString("${uid}_perDistrict") ?? "";
      perDivision.text = prefs.getString("${uid}_perDivision") ?? "";

      preVillage.text = prefs.getString("${uid}_preVillage") ?? "";
      prePost.text = prefs.getString("${uid}_prePost") ?? "";
      preThana.text = prefs.getString("${uid}_preThana") ?? "";
      preDistrict.text = prefs.getString("${uid}_preDistrict") ?? "";
      preDivision.text = prefs.getString("${uid}_preDivision") ?? "";

      guardianName.text = prefs.getString("${uid}_guardianName") ?? "";
      guardianNid.text = prefs.getString("${uid}_guardianNid") ?? "";
      guardianPhone.text = prefs.getString("${uid}_guardianPhone") ?? "";

      mobile.text = prefs.getString("${uid}_mobile") ?? "";
      altMobile.text = prefs.getString("${uid}_altMobile") ?? "";
      email.text = prefs.getString("${uid}_email") ?? "";
    });
  }

  void autoSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = getUserId();

    prefs.setString("${uid}_fullNameBn", fullNameBn.text);
    prefs.setString("${uid}_fullNameEn", fullNameEn.text);
    prefs.setString("${uid}_fatherName", fatherName.text);
    prefs.setString("${uid}_motherName", motherName.text);
    prefs.setString("${uid}_dob", dateBirth.text);
    prefs.setString("${uid}_birthReg", birthReg.text);
    prefs.setString("${uid}_nid", Nid.text);
    prefs.setString("${uid}_religion", religion.text);
    prefs.setString("${uid}_birthPlace", birthPlace.text);

    prefs.setString("${uid}_perVillage", perVillage.text);
    prefs.setString("${uid}_perPost", perPost.text);
    prefs.setString("${uid}_perThana", perThana.text);
    prefs.setString("${uid}_perDistrict", perDistrict.text);
    prefs.setString("${uid}_perDivision", perDivision.text);

    prefs.setString("${uid}_preVillage", preVillage.text);
    prefs.setString("${uid}_prePost", prePost.text);
    prefs.setString("${uid}_preThana", preThana.text);
    prefs.setString("${uid}_preDistrict", preDistrict.text);
    prefs.setString("${uid}_preDivision", preDivision.text);

    prefs.setString("${uid}_guardianName", guardianName.text);
    prefs.setString("${uid}_guardianNid", guardianNid.text);
    prefs.setString("${uid}_guardianPhone", guardianPhone.text);

    prefs.setString("${uid}_mobile", mobile.text);
    prefs.setString("${uid}_altMobile", altMobile.text);
    prefs.setString("${uid}_email", email.text);
  }

  @override
  void initState() {
    super.initState();
    loadData();

    fullNameBn.addListener(autoSave);
    fullNameEn.addListener(autoSave);
    fatherName.addListener(autoSave);
    motherName.addListener(autoSave);
    dateBirth.addListener(autoSave);
    birthReg.addListener(autoSave);
    Nid.addListener(autoSave);
    religion.addListener(autoSave);
    birthPlace.addListener(autoSave);
    perVillage.addListener(autoSave);
    perPost.addListener(autoSave);
    perThana.addListener(autoSave);
    perDistrict.addListener(autoSave);
    perDivision.addListener(autoSave);
    preVillage.addListener(autoSave);
    prePost.addListener(autoSave);
    preThana.addListener(autoSave);
    preDistrict.addListener(autoSave);
    preDivision.addListener(autoSave);
    guardianName.addListener(autoSave);
    guardianNid.addListener(autoSave);
    guardianPhone.addListener(autoSave);
    mobile.addListener(autoSave);
    altMobile.addListener(autoSave);
    email.addListener(autoSave);
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
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2)),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            )),
      ),
    );
  }

  Widget dropdown(String label, String value, List<String> items,
      Function(String?) onChanged,
      {bool isDark = false}) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: value,
        items: menuItems,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: isDark ? Colors.white : Color(0xFF0F7A4F),
              fontWeight: FontWeight.bold,
            ),
            floatingLabelStyle: TextStyle(
              color: isDark ? Colors.white : Color(0xFF0F7A4F),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF0F7A4F)),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF0F7A4F))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2)),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            )),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF0F7A4F),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF0F7A4F)),
      ),
      child: Center(
          child: Text(
            text,
            style: isBangla
                ? GoogleFonts.hindSiliguri(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            )
                : GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
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
              colorScheme: ColorScheme.light(
                primary: Color(0xFF0F7A4F),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      dateBirth.text = "${picked.day}-${picked.month}-${picked.year}";
      autoSave();
    }
  }


  void submit() async {
    if (formkey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid = getUserId();

      await prefs.setString("${uid}_fullNameBn", fullNameBn.text);
      await prefs.setString("${uid}_fullNameEn", fullNameEn.text);
      await prefs.setString("${uid}_fatherName", fatherName.text);
      await prefs.setString("${uid}_motherName", motherName.text);
      await prefs.setString("${uid}_dob", dateBirth.text);
      await prefs.setString("${uid}_birthReg", birthReg.text);
      await prefs.setString("${uid}_nid", Nid.text);
      await prefs.setString("${uid}_religion", religion.text);
      await prefs.setString("${uid}_birthPlace", birthPlace.text);

      await prefs.setString("${uid}_perVillage", perVillage.text);
      await prefs.setString("${uid}_perPost", perPost.text);
      await prefs.setString("${uid}_perThana", perThana.text);
      await prefs.setString("${uid}_perDistrict", perDistrict.text);
      await prefs.setString("${uid}_perDivision", perDivision.text);

      await prefs.setString("${uid}_preVillage", preVillage.text);
      await prefs.setString("${uid}_prePost", prePost.text);
      await prefs.setString("${uid}_preThana", preThana.text);
      await prefs.setString("${uid}_preDistrict", preDistrict.text);
      await prefs.setString("${uid}_preDivision", preDivision.text);

      await prefs.setString("${uid}_guardianName", guardianName.text);
      await prefs.setString("${uid}_guardianNid", guardianNid.text);
      await prefs.setString("${uid}_guardianPhone", guardianPhone.text);

      await prefs.setString("${uid}_mobile", mobile.text);
      await prefs.setString("${uid}_altMobile", altMobile.text);
      await prefs.setString("${uid}_email", email.text);

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Form validated and saved successfully!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    isDark = appState.isDark;
    isBangla = appState.isBangla;

    return Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F7A4F),
          title: Text(
            isBangla ? "পাসপোর্ট আবেদন ফর্ম" : "Passport Application Form",
            textAlign: TextAlign.center,
            style: isBangla
                ? GoogleFonts.hindSiliguri(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)
                : GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    sectionTitle(isBangla ? "ব্যক্তিগত তথ্য" : "Personal Information"),
                    field(isBangla ? "পূর্ণ নাম (বাংলায়)" : "Full Name In Bangla", fullNameBn, isDark),
                    field(isBangla ? " পূর্ণ নাম (ইংরেজিতে)" : "Full Name In English", fullNameEn, isDark),
                    field(isBangla ? "পিতার নাম" : "Fathers's Name", fatherName, isDark),
                    field(isBangla ? "মাতার নাম" : "Mothers's Name", motherName, isDark),
                    field(isBangla ? "ধর্ম" : "Religion", religion, isDark),
                    field(isBangla ? "জন্মস্থান" : "Place of Birth", birthPlace, isDark),
                    GestureDetector(
                      onTap: pickDate,
                      child: AbsorbPointer(
                        child: field(isBangla ? "জন্ম তারিখ" : "Date of Birth", dateBirth, isDark),
                      ),
                    ),
                    field(isBangla ? "জন্ম নিবন্ধন নম্বর" : "Birth Certificate Number", birthReg, isDark),
                    field(isBangla ? "জাতীয় পরিচয়পত্র নম্বর (NID)" : "Nation Id Card Number", Nid, isDark),
                    dropdown(isBangla ? "লিঙ্গ" : "Gender", gender, ["Male", "Female", "Others"], (val) => setState(() => gender = val!), isDark: isDark),
                    dropdown(isBangla ? "বৈবাহিক অবস্থা" : "Marital Status", maritalStatus, ["Single", "Married"], (val) => setState(() => maritalStatus = val!), isDark: isDark),
                    sectionTitle(isBangla ? "যোগাযোগের ঠিকানা" : "Contact Address"),
                    field(isBangla ? "স্থায়ী - গ্রাম/বাসা" : "Permanent - Village/House", perVillage, isDark),
                    field(isBangla ? "স্থায়ী - পোস্ট অফিস" : "Permanent - Post Office", perPost, isDark),
                    field(isBangla ? "স্থায়ী - থানা" : "Permanent - Thana", perThana, isDark),
                    field(isBangla ? "স্থায়ী - জেলা" : "Permanent - District", perDistrict, isDark),
                    field(isBangla ? "স্থায়ী - বিভাগ" : "Permanent - Division", perDivision, isDark),
                    CheckboxListTile(
                      value: sameAddress,
                      onChanged: (val) {
                        setState(() => sameAddress = val!);
                      },
                      title: Text(isBangla ? "বর্তমান ঠিকানা স্থায়ী ঠিকানার মতো" : "Current address same as permanent"),
                      checkColor: Colors.white,
                      activeColor: isDark ? Colors.greenAccent : Colors.green,
                      tileColor: isDark ? Colors.grey[850] : Colors.white,
                    ),
                    if (!sameAddress) ...[
                      field(isBangla ? "বর্তমান - গ্রাম/বাসা" : "Present - Village/House", preVillage, isDark),
                      field(isBangla ? "বর্তমান - পোস্ট অফিস" : "Present - Post Office", prePost, isDark),
                      field(isBangla ? "বর্তমান - থানা" : "Present - Thana", preThana, isDark),
                      field(isBangla ? "বর্তমান - জেলা" : "Present - District", preDistrict, isDark),
                      field(isBangla ? "বর্তমান - বিভাগ" : "Present - Division", preDivision, isDark),
                    ],
                    sectionTitle(isBangla ? "অভিভাবকের তথ্য" : "Guardian Information"),
                    field(isBangla ? "অভিভাবকের নাম" : "Guardian Name", guardianName, isDark),
                    dropdown(isBangla ? "সম্পর্ক" : "Relation", relation, ["Father", "Mother", "Husband", "Legal Guardian"], (val) => setState(() => relation = val!), isDark: isDark),
                    field(isBangla ? "অভিভাবকের NID" : "Guardian NID", guardianNid, isDark),
                    field(isBangla ? "ফোন নম্বর" : "Phone Number", guardianPhone, isDark),
                    sectionTitle(isBangla ? "যোগাযোগ তথ্য" : "Contact Information"),
                    field(isBangla ? "মোবাইল নম্বর" : "Mobile Number", mobile, isDark),
                    field(isBangla ? "বিকল্প মোবাইল" : "Alternate Mobile", altMobile, isDark),
                    field(isBangla ? "ইমেইল ঠিকানা" : "Email Address", email, isDark),
                    sectionTitle(isBangla ? "পাসপোর্ট সংক্রান্ত তথ্য" : "Passport Information"),
                    dropdown(isBangla ? "পাসপোর্ট টাইপ" : "Passport Type", passportType, ["Ordinary", "Official", "Diplomatic"], (val) => setState(() => passportType = val!), isDark: isDark),
                    dropdown(isBangla ? "পৃষ্ঠা সংখ্যা" : "Page Count", pageCount, ["48", "64"], (val) => setState(() => pageCount = val!), isDark: isDark),
                    dropdown(isBangla ? "মেয়াদ" : "Validity", validity, ["5 Years", "10 Years"], (val) => setState(() => validity = val!), isDark: isDark),
                    dropdown(isBangla ? "পুলিশ ভেরিফিকেশন প্রয়োজন?" : "Police Verification Required?", policeVerify, ["Yes", "No"], (val) => setState(() => policeVerify = val!), isDark: isDark),
                    dropdown(isBangla ? "জরুরি আবেদন?" : "Urgent Application?", urgentType, ["Regular", "Express"], (val) => setState(() => urgentType = val!), isDark: isDark),
                    sectionTitle(isBangla ? "ছবি আপলোড" : "Photo Upload"),
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 40, color: Colors.green),
                            SizedBox(height: 8),
                            Text(isBangla ? "ছবি আপলোড করুন" : "upload picture here"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0F7A4F),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isBangla ? "জমা দিন" : "Submit",
                          style: isBangla
                              ? GoogleFonts.hindSiliguri(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                              : GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ))));
  }
}