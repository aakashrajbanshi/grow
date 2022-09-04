import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/providers/language_provider.dart';
import 'package:classapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    final themePro = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.settings,
          ),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            onTap: () {
                              language.changeLocale();
                              Navigator.pop(context);
                            },
                            title: Text("English"),
                          ),
                          ListTile(
                            onTap: () {
                              language.changeLocale();
                              Navigator.pop(context);
                            },
                            title: Text("Nepali"),
                          ),
                        ],
                      );
                    });
              },
              leading: Icon(Icons.language),
              title: Text(
                ("Change Language"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.light_mode),
              title: Text(
                "Change Theme",
              ),
              trailing: Switch(
                value: themePro.currentTheme == darkTheme,
                onChanged: (val) {
                  themePro.changeTheme();
                },
              ),
            )
          ],
        ));
  }
}
