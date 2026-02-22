import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Appstate>(
      builder: (context, appState, _) {
        final Color scaffoldBg = appState.isDark ? Colors.grey[900]! : Colors.white;
        final Color textColor = appState.isDark ? Colors.white : Colors.black;
        final Color brandColor = const Color(0xFF0F7A4F);

        return Scaffold(
          backgroundColor: scaffoldBg,
          appBar: AppBar(
            title: Text(appState.isBangla? "প্রোফাইল" : "Profile"),
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: textColor,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(           ////why
            padding: const EdgeInsets.all(20.0),     ////why
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: brandColor,
                            child: const Icon(Icons.person, size: 70, color: Colors.white),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: appState.isDark ? Colors.grey[800] : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: scaffoldBg, width: 2),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 18,
                                color: brandColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        appState.isBangla ? "আরিয়ার নাওয়ার" : "Ariyer Nawer",
                        style: GoogleFonts.hindSiliguri(
                          fontSize: 22,
                          color: textColor,
                        ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  appState.isBangla ? "ব্যক্তিগত তথ্য" : "Personal Information",
                  style: GoogleFonts.hindSiliguri(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.phone, color: Color(0xFF0F7A4F)),
                title: Text(
                    appState.isBangla ? "ফোন নম্বর" : "Phone Number",
                    style: TextStyle(color: textColor, fontSize: 12)
                ),
                subtitle: Text(
                    appState.isBangla ? "+৮৮০ ১৯০০ ০০০০০০" : "+880 1900 000000",
                    style: TextStyle(color: textColor, fontSize: 16)
                ),
              ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.email, color: Color(0xFF0F7A4F)),
                  title: Text(
                      appState.isBangla ? "ইমেইল" : "Email",
                      style: TextStyle(color: textColor, fontSize: 12)
                  ),
                  subtitle: Text(
                      "ariyernawer@gmail.com",
                      style: TextStyle(color: textColor, fontSize: 16)
                  ),
                ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.location_on, color: Color(0xFF0F7A4F)),
                  title: Text(
                      appState.isBangla ? "স্থায়ী ঠিকানা" : "Permanent Address",
                      style: TextStyle(color: textColor, fontSize: 12)
                  ),
                  subtitle: Text(
                      appState.isBangla ? "ঢাকা, বাংলাদেশ" : "Dhaka, Bangladesh",
                      style: TextStyle(color: textColor, fontSize: 16)
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
