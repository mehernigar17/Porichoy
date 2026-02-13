import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'appDrawer.dart';
import 'BirthPage.dart';
import 'BirthCorrectionPage.dart';
import 'nidapplication.dart';
import 'nidcorrection.dart';

import 'passportapplication.dart';
import 'passportrenew.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

void showoptionDialougue(
    BuildContext context,
    Widget firstpage,
    Widget corrOrrenewpage,


    ){
  final appState=Provider.of<Appstate>(context,listen: false);
  showGeneralDialog(context: context,
      barrierDismissible: true,
      barrierLabel:"Options",
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context,animation,secondaryAnimation) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 280,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appState.isDark?const Color(0xff1e1e1e)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                )
                ]
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    appState.isBangla
                     ?"একটি অপশন নির্বাচন করুন"
                        : "Choose an Option",
                style: appState.isBangla
                    ? GoogleFonts.notoSansBengali(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: appState.isDark ? Colors.white : Colors.black,
                )
                    :GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight:FontWeight.bold,
                      color: appState.isDark? Colors.white
                      : Colors.black,

                    ) ,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_)=>firstpage)
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.green,////////////////
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          appState.isBangla
                              ? " আবেদন"
                              : " Application",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),


                  ),


                  const SizedBox(height: 12),


                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => corrOrrenewpage),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          appState.isBangla ? "সংশোধন/নবায়ন" : "Correction/Renew",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),



        );


  }
  );


 




}





















  Widget categoryCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required double cardWidth,
    required bool isDark,
    required VoidCallback arrowclick,
    required bool isBangla,


  }){
    return SizedBox(
        width: cardWidth,

        child: Container(
          height: 220,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark?Colors.grey[900]:Colors.lightGreen[900],
            borderRadius: BorderRadius.circular(22),
            boxShadow:[
              BoxShadow(
                color:Colors.black.withOpacity(0.08) ,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: Colors.white, size: 26),
                  ),
                  InkWell(
                    onTap: arrowclick,
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  )





                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: isBangla
                    ? GoogleFonts.hindSiliguri(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )
                    : GoogleFonts.bungee(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),


              Text(
                subtitle,
                style: isBangla
                    ? GoogleFonts.hindSiliguri(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[300],
                )
                    : GoogleFonts.bungee(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        )
    );





  }

  @override
  Widget build(BuildContext context) {
    final appstate=Provider.of<Appstate>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = 16;
    double cardWidth =
    screenWidth < 400 ? screenWidth - 32 : screenWidth / 2 - 24;

    return Scaffold(
    // drawer: AppDrawer(appState: appstate),
      //drawer: appDrawer(appState: appstate),
      drawer: const AppDrawer(),
      backgroundColor:
      appstate.isDark ? Colors.black : const Color(0xffeefaf6),
      appBar: AppBar(
        backgroundColor:
        appstate.isDark ? Colors.black : const Color(0xffeefaf6),
        elevation: 0,
        iconTheme: IconThemeData(
          color: appstate.isDark ? Colors.white : Colors.black,
        ),
        actions: [
          Padding(padding:
       const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.lightGreen[900],
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 20,
              ),
            )
          )
        ],





      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  appstate.isBangla
                      ? "আপনার ক্যাটাগরি নির্বাচন করুন"
                      : "Select Your Category",
                  style:
                  appstate.isBangla
                      ? GoogleFonts.hindSiliguri(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: appstate.isDark?Colors.white:Colors.green[900],
                  )
                      :GoogleFonts.bungee(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: appstate.isDark?Colors.white:Colors.green[900],
                  ),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    categoryCard(
                      icon: Icons.description,
                      title: appstate.isBangla
                          ? "জন্ম নিবন্ধন"
                          : "Birth Certificate",

                      subtitle: appstate.isBangla
                          ? "জন্ম নিবন্ধন সনদ"
                          : "Apply for birth registration",
                      cardWidth: cardWidth,
                      isDark: appstate.isDark,
                      isBangla: appstate.isBangla,
                      arrowclick: () {
                        showoptionDialougue(
                          context,
                          const BirthPage(),
                          const BirthCorrectionPage(),
                        );
                      },







                    ),
                    categoryCard(
                      icon: Icons.credit_card,
                      title: appstate.isBangla
                          ? "জাতীয় পরিচয়পত্র"
                          : "National ID Card",
                      subtitle: appstate.isBangla
                          ? "এনআইডি সেবা"
                          : "NID application & services",
                      cardWidth: cardWidth,
                      isDark: appstate.isDark,
                      isBangla: appstate.isBangla,
                        arrowclick: () {
                          showoptionDialougue(
                            context,
                            const NidApplication(),
                            const NidCorrection(),
                          );
                        }
                     // arrowclick: () {
                        // Navigator.push(
                        //context,
                        //MaterialPageRoute(
                        // builder: (_) => const NidPage(),
                        //),
                        // );
                      //},
                    ),
                    categoryCard(
                      icon: Icons.flight,
                      title:
                      appstate.isBangla ? "পাসপোর্ট" : "Passport",
                      subtitle: appstate.isBangla
                          ? "পাসপোর্ট আবেদন"
                          : "Passport application & renewal",
                      cardWidth: cardWidth,
                      isDark: appstate.isDark,
                      isBangla: appstate.isBangla,




                      arrowclick: () {
                        showoptionDialougue (
                          context,
                          const PassportAppliPage(),
                          const PassportRenewPage(),
                        );
                      },
                     // arrowclick: () {
                        // Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        //   builder: (_) => const PassportPage(),
                        // ),
                        // );
                    //  },
                    ),
                    categoryCard(
                      icon: Icons.school,
                      title: appstate.isBangla
                          ? "এসএসসি / এইচএসসি"
                          : "HSC / SSC Certificate",
                      subtitle: appstate.isBangla
                          ? "শিক্ষা সনদ যাচাই"
                          : "Educational certificate verification",
                      cardWidth: cardWidth,
                      isDark: appstate.isDark,
                      isBangla: appstate.isBangla,



                      arrowclick: () {
                        showoptionDialougue(
                          context,
                          const EducationPage(),
                          const EducationRenewPage(),
                        );
                      },
                     // arrowclick: () {
                        // Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        // builder: (_) => const EducationPage(),
                        //),
                        //);
                     // },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
