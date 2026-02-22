import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sscFormFillup.dart';
import 'hscFormFillup.dart';

class Hscpage extends StatefulWidget {
  const Hscpage({super.key});

  @override
  State<Hscpage> createState() => _HscpageState();
}

class _HscpageState extends State<Hscpage> {

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
            ?  "মূল এইচএসসি সনদপত্র এবং মার্কশিট।\n\n"
            "রেজিস্ট্রেশন কার্ড এবং রোল নম্বরের কপি।\n\n"
            "জন্ম নিবন্ধন সনদ বা জাতীয় পরিচয়পত্র ।\n\n"
            "ভুল তথ্য সংশোধনের পক্ষে প্রমাণপত্র (যেমন: এফিডেভিট/গেজেট কপি)।\n\n"
            "সংশোধন ফি প্রদানের রশিদ।\n\n"
            "প্রতিষ্ঠান প্রধানের সুপারিশপত্র (প্রযোজ্য হলে)।\n\n"
            : "Original HSC certificate and mark sheet.\n\n"
            "Copy of registration card and roll number details.\n\n"
            "Birth certificate or National ID (NID).\n\n"
            "Supporting documents for correction (e.g., affidavit or gazette copy).\n\n"
            "Payment receipt of correction fee.\n\n"
            "Recommendation letter from the head of institution (if required).\n\n"

      },
      {
        "title": appState.isBangla ? "অবস্থান" : "Location",
        "content": appState.isBangla
            ? "সংশ্লিষ্ট শিক্ষা বোর্ড অফিসে আবেদন করতে হবে।\n\n"
            "অনেক ক্ষেত্রে শিক্ষা বোর্ডের অফিসিয়াল ওয়েবসাইটের মাধ্যমে অনলাইনে আবেদন করা যায়।\n\n"
            "প্রয়োজনে বোর্ড অফিসে সরাসরি উপস্থিত হতে হতে পারে।\n\n"
            : "Application must be submitted to the respective Education Board office.\n\n"
            "In many cases, applications can be submitted online through the official Education Board website.\n\n"
            "Physical presence at the board office may be required if necessary.\n\n"

      },
      {
        "title": appState.isBangla ? "সাধারণ ভুল" : "Common Mistakes",
        "content": appState.isBangla
            ? "নামের বানান ভুল সংশোধনের জন্য যথাযথ প্রমাণপত্র না দেওয়া।\n\n"
            "আবেদন ফর্ম অসম্পূর্ণভাবে পূরণ করা।\n\n"
            "প্রয়োজনীয় নথির সত্যায়িত কপি জমা না দেওয়া।\n\n"
            "সঠিক ফি পরিশোধ না করা বা রশিদ সংযুক্ত না করা।\n\n"
            "নির্ধারিত সময়সীমার পরে আবেদন করা।\n\n"
            : "Applying for name correction without proper supporting documents.\n\n"
            "Submitting incomplete application forms.\n\n"
            "Not providing attested copies of required documents.\n\n"
            "Incorrect fee payment or not attaching the payment receipt.\n\n"
            "Submitting the application after the official deadline.\n\n"

      },
      {
        "title": appState.isBangla ? "প্রয়োজনীয় পূর্বশর্ত" : "Prerequisites",
        "content": appState.isBangla
            ?  "আবেদনকারীকে সংশ্লিষ্ট শিক্ষা বোর্ডের অধীনে এইচএসসি পরীক্ষায় উত্তীর্ণ হতে হবে।\n\n"
            "ভুল তথ্য সংশোধনের জন্য বৈধ প্রমাণপত্র থাকতে হবে।\n\n"
            "বোর্ড নির্ধারিত সময়ের মধ্যে আবেদন করতে হবে।\n\n"
            "নির্ধারিত সংশোধন ফি পরিশোধ করতে হবে।\n\n"
            : "The applicant must have passed the HSC examination under the respective Education Board.\n\n"
            "Valid supporting documents must be provided for the correction.\n\n"
            "Application must be submitted within the time limit set by the board.\n\n"
            "Required correction fee must be paid.\n\n"

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
                  "এইচএসসি  আবেদন সংক্রান্ত তথ্য": "Hsc Application Information",
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
                          builder: (context) => const hscFormFillPage(),
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
