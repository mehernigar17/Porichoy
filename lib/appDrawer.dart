import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';
import 'setting.dart';
import 'profile.dart';
import 'complainbox.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Appstate>(
      builder: (context, appState, _) {
        return Drawer(
            backgroundColor: appState.isDark ? Colors.grey[900] : const Color(0xffeefaf6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF0F7A4F),
                          child: Icon(Icons.person, size: 40, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          appState.isBangla ? "আরিয়ার নাওয়ার " : "Ariyer Nawer",
                          style: GoogleFonts.hindSiliguri(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: appState.isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                drawerItem(
                  icon: Icons.bar_chart,
                  title: appState.isBangla ? "প্রগেস" : "Progress",
                  context: context,
                  onTap: () {},
                  appState: appState,
                ),

                const SizedBox(height: 12),

                drawerItem(
                  icon: Icons.report_problem,
                  title: appState.isBangla ? "অভিযোগ" : "Complain",
                  context: context,
                  onTap: () {
                    Navigator.push(
                      context,
                     MaterialPageRoute(
                        builder:(context)=>Complainbox(),
                      ),
                    );
                  },
                  appState: appState,
                ),



                const SizedBox(height: 12),

                drawerItem(
                  icon: Icons.settings,
                  title: appState.isBangla ? "সেটিংস" : "Settings",
                  context: context,
                  onTap: () {
                    Navigator.pop(context);
                    SettingsBottomSheet.show(context);
                  },
                  appState: appState,
                ),

                const SizedBox(height: 20),
              ],
            )
        );
      },
    );
  }
}


Widget drawerItem({
  required IconData icon,
  required String title,
  required BuildContext context,
  required VoidCallback onTap,
  required Appstate appState,
}) {

  final TextStyle textStyle = appState.isBangla
      ? GoogleFonts.hindSiliguri(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: appState.isDark ? Colors.white : Colors.black,
  )
      : GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: appState.isDark ? Colors.white : Colors.black,
  );

  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0F7A4F), size: 26),
          const SizedBox(width: 12),
          Text(
            title,
            style: textStyle,
          ),
        ],
      ),
    ),
  );
}