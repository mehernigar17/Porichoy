import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'nidApplicationForm.dart';

class NidApplication extends StatefulWidget {
  const NidApplication({super.key});

  @override
  State<NidApplication> createState() => _NidApplicationState();
}

class _NidApplicationState extends State<NidApplication> {
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
                border: expanded ? Border.all(color: const Color(0xFF0F7A4F)) : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isHoveredList[index] || expanded
                            ? const Color(0xFF0F7A4F)
                            : Colors.white,
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
        "title": isBangla ? "প্রয়োজনীয় নথি" : "Necessary Documents",
        "content": isBangla
            ? "• অনলাইন জন্ম নিবন্ধন সনদ\n• বাবা/মায়ের এনআইডি ফটোকপি\n• শিক্ষা সনদ\n• ইউটিলিটি বিলের কপি"
            : "• Online Birth Registration Certificate\n• Parent's NID Photocopy\n• Educational Certificate\n• Utility Bill Copy"
      },
      {
        "title": isBangla ? "অবস্থান" : "Location",
        "content": isBangla ? "উপজেলা নির্বাচন অফিস।" : "Upazila Election Office."
      },
      {
        "title": isBangla ? "সাধারণ ভুল" : "Common Mistakes",
        "content": isBangla ? "ভুল নাম বা জন্ম তারিখ প্রদান।" : "Providing wrong name or DOB."
      },
      {
        "title": isBangla ? "প্রয়োজনীয় পূর্বশর্ত" : "Prerequisites",
        "content": isBangla ? "১৮ বছর বা তার বেশি বয়স হতে হবে।" : "Must be 18 years or older."
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          child: Column(
            children: [
              Text(
                isBangla ? "এনআইডি আবেদন সংক্রান্ত তথ্য" : "NID Application Information",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF0F7A4F),
                ),
              ),
              const SizedBox(height: 40),
              ...List.generate(cardData.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: buildCard(
                    index: index,
                    title: cardData[index]["title"]!,
                    content: cardData[index]["content"]!,
                    expanded: isExpandedList[index],
                    ontap: () => setState(() => isExpandedList[index] = !isExpandedList[index]),
                  ),
                );
              }),
              const SizedBox(height: 38),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NidApplicationForm()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F7A4F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      isBangla ? "ফর্ম পূরণ করতে এখানে ক্লিক করুন" : "Click Here to Fill Up the Form",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}