import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'formfillupApplication.dart';


class PassportAppliPage extends StatefulWidget {
  const PassportAppliPage({super.key});

  @override
  State<PassportAppliPage> createState() => _PassportAppliPageState();
}

class _PassportAppliPageState extends State<PassportAppliPage> {

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
            ? "মূল জন্ম সনদ এবং একটি ফটোকপি\n\n"
               "মূল জাতীয় পরিচয়পত্র এবং একটি ফটোকপি\n\n"
               "২–৪টি সাম্প্রতিক পাসপোর্ট সাইজের ছবি\n\n"
              "পাসপোর্ট আবেদন ফি প্রদানের রশিদ\n\n"

            : "Original birth certificate and a photocopy.\n\n"
            "Original National ID card and photocopy.\n\n"
            "2-4 recent passport-sized photographs.\n\n"
            "Parent/Guardian NID and relationship proof.\n\n"
            "Passport application fee receipt.\n\n"

      },
      {
        "title": appState.isBangla ? "অবস্থান" : "Location",
        "content": appState.isBangla
            ? "জেলা পাসপোর্ট অফিস"
            : "Regional Passport Office."
      },
      {
        "title": appState.isBangla ? "সাধারণ ভুল" : "Common Mistakes",
        "content": appState.isBangla
            ? "অসম্পূর্ণ আবেদন ফর্ম জমা দেওয়া।\n\n"
            "ভুল ছবি সাইজ বা খারাপ মানের ছবি।\n\n"
            "মূল নথি বা ফটোকপি অনুপস্থিত।\n\n"
            "ব্যক্তিগত তথ্য (নাম, জন্মতারিখ) ভুল দেওয়া।\n\n"
            "ফর্মে সঠিকভাবে স্বাক্ষর না করা।\n\n"

            :  "Submitting incomplete application forms.\n\n"
            "Wrong photo size or poor quality photo.\n\n"
            "Missing original documents or photocopies.\n\n"
            "Mismatched personal info.\n\n"
            "Not signing the form properly.\n\n"
      },
      {
        "title": appState.isBangla ? "প্রয়োজনীয় পূর্বশর্ত" : "Prerequisites",
        "content": appState.isBangla
            ? "আবেদনকারীকে অবশ্যই বাংলাদেশের বৈধ নাগরিক হতে হবে।\n\n"
             "১৮ বছর বা তার বেশি হলে জাতীয় পরিচয়পত্র (NID) থাকতে হবে।\n\n"
             "১৮ বছরের কম হলে অনলাইন জন্ম নিবন্ধন সনদ (BRC) প্রয়োজন।\n\n"

            :
               "The applicant must be a valid citizen of Bangladesh.\n\n"
             "If the applicant is 18 years or older, a National Identity Card (NID) is required.\n\n"
             "If the applicant is under 18 years old, an online Birth Registration Certificate (BRC) is required.\n\n"


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
          "পাসপোর্ট আবেদন সংক্রান্ত তথ্য": "Passport Application Information",
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
                      builder: (context) => const FormFillPage(),
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

