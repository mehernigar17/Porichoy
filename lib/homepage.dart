import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'appDrawer.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});
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
                    color: Colors.green[900],
                  )
                      :GoogleFonts.bungee(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.green[900],
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
                        //Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (_) => const BirthPage(),
                        // ),
                        // );
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
                        // Navigator.push(
                        //context,
                        //MaterialPageRoute(
                        // builder: (_) => const NidPage(),
                        //),
                        // );
                      },
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
                        // Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        //   builder: (_) => const PassportPage(),
                        // ),
                        // );
                      },
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
                        // Navigator.push(
                        //  context,
                        //  MaterialPageRoute(
                        // builder: (_) => const EducationPage(),
                        //),
                        //);
                      },
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
