import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'birthFormfillup.dart';


class BirthPage extends StatefulWidget {
  const BirthPage({super.key});

  @override
  State<BirthPage> createState() => _BirthPage();
}

class _BirthPage extends State<BirthPage> {

  List <bool> isExpandedList=[false,false,false,false];
  List<bool> isHoveredList = [false, false, false, false];
  Widget buildCard({
    required int index,
    required String title,
    required bool expanded,
    required VoidCallback ontap,
    required String content,

  }){
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool  isBangla= appState.isBangla;
    return  Column(
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              isHoveredList[index]= true;
            });
          },
          onExit: (_) {
            setState(() {
              isHoveredList[index] = false;
            });
          },
          child: GestureDetector(
            onTap: ontap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:   isHoveredList[index]|| isExpandedList[index] ? Colors.white : const Color(0xFF0F7A4F),
                borderRadius: BorderRadius.circular(16),

              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(title,
                          style:isBangla?
                          GoogleFonts.hindSiliguri(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:   isHoveredList[index]  || expanded
                                ? (isDark ?const Color(0xFF0F7A4F)  : const Color(0xFF0F7A4F))
                                : (isDark ?Colors.white : Colors.white),
                          )
                              : GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:   isHoveredList[index]  || expanded
                                ? (isDark ? const Color(0xFF0F7A4F): const Color(0xFF0F7A4F))
                                : (isDark ? Colors.white: Colors.white),
                          ),

                        )
                      ],
                    ),
                  ),
                  Icon(
                    expanded?Icons.close:Icons.add_box_rounded,
                    color:   isHoveredList[index]|| expanded ? const Color(0xFF0F7A4F) : Colors.white,
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
              style: const TextStyle(color: Color(0xFF0F7A4F)),
            ),
          ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    bool isDark = appState.isDark;
    bool  isBangla= appState.isBangla;
    final cardData = [
      {
        "title": appState.isBangla ? "প্রয়োজনীয় নথি" : "Necessary Documents",
        "content": appState.isBangla
            ? "পিতামাতার জাতীয় পরিচয়পত্র বা জন্মনিবন্ধন সনদ।\n\n"
            "হাসপাতাল বা জন্ম নিবন্ধন রেকর্ড।\n\n"
            "ঠিকানার প্রমাণ (যেমন ইউটিলিটি বিল বা ভাড়ার চুক্তি)\n\n"
            "পূর্ণ করা ও স্বাক্ষরিত আবেদন ফর্ম।\n\n"
            "পাসপোর্ট সাইজের ছবি (কখনও কখনও প্রয়োজন)।\n\n"

            : "1.Parents’ National ID cards or birth certificates.\n\n"
            "2.Hospital or birth registration record.\n\n"
            "3.Proof of address (like utility bill or rental agreement).\n\n"
            "4.Application form filled out and signed.\n\n"
            "5.Passport-sized photographs (sometimes required)\n\n"

      },
      {
        "title": appState.isBangla ? "অবস্থান" : "Location",
        "content": appState.isBangla
            ? "স্থানীয় ইউনিয়ন পরিষদ বা সিটি কর্পোরেশন অফিসে আবেদন করুন"
            : "Apply at the local Union Parishad or City Corporation office for a birth certificate."
      },
      {
        "title": appState.isBangla ? "সাধারণ ভুল" : "Common Mistakes",
        "content": appState.isBangla
            ? "অসম্পূর্ণ বা ভুল দলিল জমা দেওয়া।\n\n"
            "নাম বা তারিখের ভুল বানান।\n\n"
            "মঠিকানার প্রমাণ না দেওয়া।\n\n"
            "পিতামাতার আইডি বা জন্মনথি অনুপস্থিত।\n\n"
            "নির্ধারিত সময়সীমার পর আবেদন করা।\n\n"

            :  "1.Submitting incomplete or incorrect documents.\n\n"
            "2.Wrong spelling of names or dates.\n\n"
            "3.Not providing proof of address.\n\n"
            "4.Missing parents’ ID or birth records.\n\n"
            "5.Delaying the application beyond the official registration period.\n\n"
      },
      {
        "title": appState.isBangla ? "প্রয়োজনীয় পূর্বশর্ত" : "Prerequisites",
        "content": appState.isBangla
            ?"শিশুটি বাংলাদেশে জন্মগ্রহণ করেছে।\n\n"
             "পিতামাতার বৈধ পরিচয়পত্র বা জন্মনথি থাকতে হবে।\n\n"
             "নির্দিষ্ট জন্মস্থান ও জন্মতারিখ জানা থাকতে হবে।\n\n"
              "ঠিকানার প্রমাণ থাকা।\n\n"
               "পূর্ণ করা আবেদন ফর্ম প্রস্তুত।\n\n"

            :"Child must be born in Bangladesh.\n\n"
            "Parents should have valid ID or birth records.\n\n"
            "Know the exact place and date of birth.\n\n"
            "Have proof of residence.\n\n"
            " Completed application form ready..\n\n"


      },
    ];

    return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 150, 16, 16),

            child: Column(
                children: [

                  Text(isBangla?
                  "জন্ম নিবন্ধনের আবেদন সংক্রান্ত তথ্য": "Birth Certificate Application Information",
                      textAlign: TextAlign.center,
                      style:isBangla?GoogleFonts.hindSiliguri(  fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark?Colors.white:const Color(0xFF0F7A4F))
                          :GoogleFonts.inter(  fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark?Colors.white:const Color(0xFF0F7A4F),)


                  ),
                  const SizedBox(height: 40),
                  ...List.generate(cardData.length, (index) {
                    const SizedBox(height: 20);
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

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Birthformfillup(),
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
                              ? "ফর্ম পূরণ করতে এখানে ক্লিক করুন"
                              : "Click Here to Fill Up the Form",
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
                ]
            ),
          ),
        )
    );
  }
}

