import 'package:classapp/app/routes/routes.dart';
import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/app/themes/light_theme.dart';
import 'package:classapp/app/widgets/app_drawer.dart';
import 'package:classapp/constants/image_constants.dart';
import 'package:classapp/features/profile/model/profile_model.dart';
import 'package:classapp/features/profile/services/profile_services.dart';
import 'package:classapp/helpers/confirmation_dialog.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/models/dummy_page_model.dart';
import 'package:classapp/providers/language_provider.dart';
import 'package:classapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../locator.dart';
import '../../../pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileModel? _profileModel;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initialFunction();
  }

  initialFunction() async {
    _profileModel = await ProfileServices().fetchProfile();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themepro = Provider.of<ThemeProvider>(context);
    final language = Provider.of<LanguageProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
        centerTitle: true,
        actions: [
          // This is for logout
          IconButton(
            onPressed: () async {
              final bool isConfirmed = await getConfirmationDialog(context);
              if (isConfirmed) {
                locator.get<SharedPreferences>().clear();
                // //redirect to login page
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.loginRoute, (route) => false);
              }
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),

          InkWell(
            onTap: () {
              themepro.changeTheme();
            },
            child: Icon(
              themepro.currentTheme == lightTheme
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          InkWell(
            onTap: () {
              language.changeLocale();
            },
            child: const Icon(Icons.language),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ClipOval(
                    // borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      ImageConstants.profileImage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Text("Hahha");
                          });
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _profileModel?.fullName.toString() ?? "",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date of birth: ${_profileModel?.dateOfBirth}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Supervisor: ${_profileModel?.supervisorName}"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.dummyRoute,
                          arguments: DummyPageModel(
                            name: "Hello",
                            address: "Kathmandu",
                            age: 2,
                          ));
                    },
                    child: const Text("Navigate"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // AppSnacks.showErrorToast("Button is clicked");
                      AppSnacks.showErrorToast("hello");
                    },
                    child: const Text(
                      "Press",
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
