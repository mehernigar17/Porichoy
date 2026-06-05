import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

const String _formId = 'nid_correction';

class NidCorrectionForm extends StatefulWidget {
  const NidCorrectionForm({super.key});

  @override
  State<NidCorrectionForm> createState() => _NidCorrectionFormState();
}

class _NidCorrectionFormState extends State<NidCorrectionForm> {
  final formKey = GlobalKey<FormState>();

  final nidNumber = TextEditingController();
  final currentName = TextEditingController();
  final correctedName = TextEditingController();
  final currentDOB = TextEditingController();
  final correctedDOB = TextEditingController();
  final currentFather = TextEditingController();
  final correctedFather = TextEditingController();
  final reason = TextEditingController();
  final mobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = Provider.of<Appstate>(context, listen: false);
      final data = await appState.loadDraft(_formId);
      if (data != null) {
        setState(() {
          nidNumber.text = data['nidNumber'] ?? '';
          currentName.text = data['currentName'] ?? '';
          correctedName.text = data['correctedName'] ?? '';
          currentDOB.text = data['currentDOB'] ?? '';
          correctedDOB.text = data['correctedDOB'] ?? '';
          currentFather.text = data['currentFather'] ?? '';
          correctedFather.text = data['correctedFather'] ?? '';
          reason.text = data['reason'] ?? '';
          mobile.text = data['mobile'] ?? '';
        });
      }
      appState.enableSync(_formId);
    });
  }

  @override
  void dispose() {
    nidNumber.dispose(); currentName.dispose(); correctedName.dispose();
    currentDOB.dispose(); correctedDOB.dispose(); currentFather.dispose();
    correctedFather.dispose(); reason.dispose(); mobile.dispose();
    super.dispose();
  }

  Widget field(String label, String dbKey, TextEditingController controller, bool isDark, bool isBangla, Appstate appState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: controller,
        onChanged: (val) => appState.updateForm(_formId, dbKey, val),
        style: isBangla
            ? GoogleFonts.hindSiliguri(color: isDark ? Colors.white : Colors.black)
            : GoogleFonts.poppins(color: isDark ? Colors.white : Colors.black),
        validator: (value) => value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: isBangla
              ? GoogleFonts.hindSiliguri(color: isDark ? Colors.grey[400] : const Color(0xFF0F7A4F), fontWeight: FontWeight.bold)
              : GoogleFonts.poppins(color: isDark ? Colors.grey[400] : const Color(0xFF0F7A4F), fontWeight: FontWeight.bold),
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
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF0F7A4F), borderRadius: BorderRadius.circular(8)),
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

  void submit() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Correction Request Submitted!")),
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
          isBangla ? "এনআইডি সংশোধন ফর্ম" : "NID Correction Form",
          style: isBangla ? GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold) : GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              sectionTitle(isBangla ? "বর্তমান এনআইডি তথ্য" : "Existing NID Information", isBangla),
              field(isBangla ? "এনআইডি নম্বর" : "NID Number", 'nidNumber', nidNumber, isDark, isBangla, appState),
              field(isBangla ? "বর্তমান নাম" : "Current Name", 'currentName', currentName, isDark, isBangla, appState),

              sectionTitle(isBangla ? "সংশোধন বিবরণ" : "Correction Details", isBangla),
              field(isBangla ? "সংশোধিত নাম" : "Corrected Name", 'correctedName', correctedName, isDark, isBangla, appState),
              field(isBangla ? "সংশোধিত জন্ম তারিখ" : "Corrected Date of Birth", 'correctedDOB', correctedDOB, isDark, isBangla, appState),
              field(isBangla ? "সংশোধিত পিতার নাম" : "Corrected Father's Name", 'correctedFather', correctedFather, isDark, isBangla, appState),

              sectionTitle(isBangla ? "অন্যান্য" : "Others", isBangla),
              field(isBangla ? "সংশোধনের কারণ" : "Reason for Correction", 'reason', reason, isDark, isBangla, appState),
              field(isBangla ? "মোবাইল নম্বর" : "Mobile Number", 'mobile', mobile, isDark, isBangla, appState),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F7A4F)),
                  child: Text(
                    isBangla ? "আবেদন জমা দিন" : "Submit Correction",
                    style: isBangla
                        ? GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)
                        : GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
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