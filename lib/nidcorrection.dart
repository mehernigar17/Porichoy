import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'nidCorrectionForm.dart'; // Routes to your correction form

class NidCorrection extends StatefulWidget {
  const NidCorrection({super.key});

  @override
  State<NidCorrection> createState() => _NidCorrectionState();
}

class _NidCorrectionState extends State<NidCorrection> {
  // Logic to track expansion and hover exactly like your NID page
  List<bool> isExpandedList = [false, false, false, false];
  List<bool> isHoveredList = [false, false, false, false];

  Widget buildCard({
    required int index,
    required String title,
    required bool expanded,
    required VoidCallback ontap,
    required String content,
  }) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool isBangla = appState.isBangla;

    return Column(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => isHoveredList[index] = true),
          onExit: (_) => setState(() => isHoveredList[index] = false),
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isHoveredList[index] || expanded
                    ? Colors.white
                    : const Color(0xFF0F7A4F),
                borderRadius: BorderRadius.circular(16),
                border: expanded
                    ? Border.all(color: const Color(0xFF0F7A4F), width: 1)
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        style: isBangla
                            ? GoogleFonts.hindSiliguri(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isHoveredList[index] || expanded
                              ? const Color(0xFF0F7A4F)
                              : Colors.white,
                        )
                            : GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isHoveredList[index] || expanded
                              ? const Color(0xFF0F7A4F)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    expanded ? Icons.close : Icons.add_box_rounded,
                    color: isHoveredList[index] || expanded
                        ? const Color(0xFF0F7A4F)
                        : Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        if (expanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              content,
              style: const TextStyle(color: Color(0xFF0F7A4F), height: 1.5),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool isBangla = appState.isBangla;

    final cardData = [
      {
        "title": isBangla ? "সংশোধনের প্রমাণপত্র" : "Proof for Correction",
        "content": isBangla
            ? "• এসএসসির সনদ (নাম/জন্ম তারিখের জন্য)\n• বৈবাহিক অবস্থার জন্য নিকাহনামা\n• ঠিকানার জন্য ইউটিলিটি বিলের কপি\n• বাবা/মায়ের এনআইডি সংশোধিত কপি"
            : "• SSC Certificate (for Name/DOB)\n• Nikahnama for Marital Status\n• Utility Bill for Address change\n• Corrected NID of Parents"
      },
      {
        "title": isBangla ? "সংশোধন ফি" : "Correction Fee",
        "content": isBangla
            ? "সংশোধনের ধরন অনুযায়ী সরকারি ফি নির্ধারিত ব্যাংকে বা মোবাইল ব্যাংকিংয়ে জমা দিতে হবে।"
            : "Government fees depend on the type of correction and must be paid via designated banks or mobile banking."
      },
      {
        "title": isBangla ? "প্রক্রিয়ার সময়কাল" : "Processing Time",
        "content": isBangla
            ? "তথ্য যাচাইয়ের ভিত্তিতে সাধারণত ১৫ থেকে ৪৫ কার্যদিবস সময় লাগতে পারে।"
            : "It usually takes 15 to 45 working days based on information verification."
      },
      {
        "title": isBangla ? "আবেদন পদ্ধতি" : "Application Method",
        "content": isBangla
            ? "অনলাইনে আবেদন করার পর প্রিন্ট কপি এবং মূল নথি নির্বাচন অফিসে জমা দিতে হতে পারে।"
            : "After applying online, the print copy and original documents may need to be submitted to the Election Office."
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          child: Column(
            children: [
              Text(
                isBangla ? "এনআইডি সংশোধন সংক্রান্ত তথ্য" : "NID Correction Information",
                textAlign: TextAlign.center,
                style: isBangla
                    ? GoogleFonts.hindSiliguri(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0F7A4F))
                    : GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0F7A4F)),
              ),
              const SizedBox(height: 40),

              ...List.generate(cardData.length, (index) {
                return Column(
                  children: [
                    buildCard(
                      index: index,
                      title: cardData[index]["title"]!,
                      content: cardData[index]["content"]!,
                      expanded: isExpandedList[index],
                      ontap: () {
                        setState(() {
                          isExpandedList[index] = !isExpandedList[index];
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              }),

              const SizedBox(height: 38),

              // Corrected Route to NidCorrection Form
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NidCorrectionForm(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F7A4F),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      isBangla
                          ? "সংশোধন ফর্ম পূরণ করুন"
                          : "Fill Up Correction Form",
                      style: isBangla
                          ? GoogleFonts.hindSiliguri(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                          : GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
