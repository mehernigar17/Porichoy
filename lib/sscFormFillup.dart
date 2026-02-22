
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class sscFormFillPage extends StatefulWidget {
  const sscFormFillPage({super.key});

  @override
  State<sscFormFillPage> createState() => _SscCorrectionPageState();
}

class _SscCorrectionPageState extends State<sscFormFillPage> {
  final formKey = GlobalKey<FormState>();

  bool sameAddress = false;


  final fullNameBn = TextEditingController();
  final fullNameEn = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateBirth = TextEditingController();
  final birthReg = TextEditingController();
  final Nid = TextEditingController();

  String gender = "Male";


  final examYear = TextEditingController();
  String board = "Dhaka";
  final rollNumber = TextEditingController();
  final regNumber = TextEditingController();
  String group = "Science";


  String fieldToCorrect = "Name";
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
  String relation = "Father";
  final guardianNid = TextEditingController();
  final guardianPhone = TextEditingController();


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
            borderSide: const BorderSide(color: Color(0xFF0F7A4F)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0F7A4F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }

  Widget dropdown(String label, String value, List<String> items, Function(String?) onChanged, {bool isDark = false}) {
    List<DropdownMenuItem<String>> menuItems = items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
            borderSide: const BorderSide(color: Color(0xFF0F7A4F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF0F7A4F), width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
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
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
            colorScheme: ColorScheme.light(
              primary: Color(0xFF0F7A4F),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      dateBirth.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form validated successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F7A4F),
        title: Text(
          "SSC Correction Form",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              sectionTitle("Personal Information"),
              field("Full Name (Bangla)", fullNameBn, isDark),
              field("Full Name (English)", fullNameEn, isDark),
              field("Father's Name", fatherName, isDark),
              field("Mother's Name", motherName, isDark),
              GestureDetector(
                onTap: pickDate,
                child: AbsorbPointer(
                  child: field("Date of Birth", dateBirth, isDark),
                ),
              ),
              field("Birth Certificate Number", birthReg, isDark),
              field("NID (Optional)", Nid, isDark),
              dropdown("Gender", gender, ["Male", "Female", "Others"], (val) => setState(() => gender = val!), isDark: isDark),


              sectionTitle("SSC Exam Information"),
              field("Exam Year", examYear, isDark),
              dropdown("Board", board, ["Dhaka","Chittagong","Rajshahi","Khulna","Barisal","Sylhet","Comilla","Jessore"], (val) => setState(()=>board=val!), isDark: isDark),
              field("Roll Number", rollNumber, isDark),
              field("Registration Number", regNumber, isDark),
              dropdown("Group", group, ["Science","Arts","Commerce"], (val) => setState(()=>group=val!), isDark: isDark),


              sectionTitle("Correction Details"),
              dropdown("Field to Correct", fieldToCorrect, ["Name","Father's Name","Mother's Name","Date of Birth","Other"], (val)=>setState(()=>fieldToCorrect=val!), isDark: isDark),
              field("Corrected Value", correctedValue, isDark),


              sectionTitle("Contact Information"),
              field("Mobile Number", mobile, isDark),
              field("Alternate Mobile (Optional)", altMobile, isDark),
              field("Email (Optional)", email, isDark),
              field("Permanent - Village/House", perVillage, isDark),
              field("Permanent - Post Office", perPost, isDark),
              field("Permanent - Thana", perThana, isDark),
              field("Permanent - District", perDistrict, isDark),
              field("Permanent - Division", perDivision, isDark),

              CheckboxListTile(
                value: sameAddress,
                onChanged: (val) {
                  setState(() => sameAddress = val!);
                },
                title: Text("Current address same as permanent"),
                checkColor: Colors.white,
                activeColor: isDark ? Colors.greenAccent : Colors.green,
                tileColor: isDark ? Colors.grey[850] : Colors.white,
              ),

              if (!sameAddress) ...[
                field("Present - Village/House", preVillage, isDark),
                field("Present - Post Office", prePost, isDark),
                field("Present - Thana", preThana, isDark),
                field("Present - District", preDistrict, isDark),
                field("Present - Division", preDivision, isDark),
              ],

              sectionTitle("Guardian Information"),
              field("Guardian Name", guardianName, isDark),
              dropdown("Relation", relation, ["Father","Mother","Legal Guardian"], (val)=>setState(()=>relation=val!), isDark: isDark),
              field("Guardian NID", guardianNid, isDark),
              field("Phone Number", guardianPhone, isDark),

              sectionTitle("Document Upload"),
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
                      Icon(Icons.upload_file, size: 40, color: Colors.green),
                      SizedBox(height: 8),
                      Text("Upload SSC Certificate / Admit Card"),
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
                    "Submit",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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