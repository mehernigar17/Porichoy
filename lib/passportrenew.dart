import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'formfillupApplication.dart';
import 'newFormFillpage.dart';

class PassportRenewPage extends StatefulWidget {
  const PassportRenewPage({super.key});

  @override
  State<PassportRenewPage> createState() => _PassportRenewPageState();
}

class _PassportRenewPageState extends State<PassportRenewPage> {
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
            ? " মূল জন্ম সনদ এবং একটি ফটোকপি\n\n"
            " মূল জাতীয় পরিচয়পত্র এবং একটি ফটোকপি\n\n"
            "২–৪টি সাম্প্রতিক পাসপোর্ট সাইজের ছবি\n\n"
            "অভিভাবকের NID এবং সম্পর্কের প্রমাণ (যদি প্রয়োজন হয়)\n\n"
            " পাসপোর্ট আবেদন ফি প্রদানের রশিদ\n\n"
            : " Original birth certificate and a photocopy\n\n"
            " Original National ID card and a photocopy\n\n"
            " 2–4 recent passport-sized photographs\n\n"
            "Parent/Guardian NID and relationship proof (if applicable)\n\n"
            " Passport application fee receipt\n\n",
      },
      {
        "title": appState.isBangla ? "অবস্থান" : "Location",
        "content": appState.isBangla
            ? " আঞ্চলিক পাসপোর্ট অফিস \n\n"
            " জেলা পাসপোর্ট অফিস\n\n"
            " নির্ধারিত পাসপোর্ট সেবা কেন্দ্র\n\n"

            : " Regional Passport Office\n\n"
            " District Passport Office\n\n"
            " Designated Passport Service Centers\n\n"

      },
      {
        "title": appState.isBangla ? "সাধারণ ভুল" : "Common Mistakes",
        "content": appState.isBangla
            ? " আবেদন ফর্মে নাম বা জন্মতারিখ ভুল লেখা\n\n"
            " ভুল বা অসম্পূর্ণ কাগজপত্র জমা দেওয়া\n\n"
            " নির্ধারিত ফি সঠিকভাবে পরিশোধ না করা\n"
            " ছবি সঠিক সাইজ বা মান অনুযায়ী না দেওয়া\n\n"
            "যোগাযোগের ঠিকানা বা ফোন নম্বর ভুল দেওয়া\n\n"
            : " Incorrect name or date of birth in the application form\n\n"
            " Submitting incomplete or wrong documents\n\n"
            " Not paying the correct application fee\n\n"
            " Providing incorrect size or low-quality photographs\n\n"
            " Giving wrong address or contact number\n\n"
      },
      {
        "title": appState.isBangla ? "প্রয়োজনীয় পূর্বশর্ত" : "Prerequisites",
        "content": appState.isBangla
            ? " পুরনো পাসপোর্ট থাকতে হবে\n\n"
            " অনলাইন আবেদন ফর্ম সঠিকভাবে পূরণ করতে হবে\n\n"
            " প্রয়োজনীয় কাগজপত্র প্রস্তুত রাখতে হবে\n\n"
            " নির্ধারিত ফি পরিশোধ করতে হবে\n\n"
            " প্রয়োজনে পুলিশ ভেরিফিকেশন সম্পন্ন থাকতে হবে\n\n"
            : " The old passport must be available\n\n"
            " Online application form must be filled correctly\n\n"
            " Required documents should be prepared\n\n"
            " Prescribed fee must be paid\n\n"
            " Police verification must be completed if required\n\n"

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
                          builder: (context) => const NewFormFillPage(),
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



