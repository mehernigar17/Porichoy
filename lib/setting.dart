import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class SettingsBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer<Appstate>(
          builder: (context, appState, _) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appState.isDark ? Colors.grey[900] : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      appState.isBangla ? "ডার্ক মোড" : "Dark Mode",
                      style: appState.isBangla
                          ? GoogleFonts.hindSiliguri(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: appState.isDark ? Colors.white : Colors.black,
                      )
                          : GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: appState.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    value: appState.isDark,
                    onChanged: (value) {
                      appState.setDark(value);
                    },
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green[200],
                  ),

                  const SizedBox(height: 8),


                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      appState.isBangla ? "বাংলা / English" : "Bangla / English",
                      style: appState.isBangla
                          ? GoogleFonts.hindSiliguri(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: appState.isDark ? Colors.white : Colors.black,
                      )
                          : GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: appState.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    value: appState.isBangla,
                    onChanged: (value) {
                      appState.setLanguage(value);
                    },
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green[200],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}