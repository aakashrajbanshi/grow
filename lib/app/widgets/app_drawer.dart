import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/image_constants.dart';
import '../../helpers/confirmation_dialog.dart';
import '../../locator.dart';
import '../routes/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Drawer(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ClipOval(
                // borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  ImageConstants.profileImage,
                  fit: BoxFit.fitWidth,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settingsRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.settings,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  final bool isConfirmed = await getConfirmationDialog(context);
                  if (isConfirmed) {
                    locator.get<SharedPreferences>().clear();
                    // //redirect to login page
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.loginRoute, (route) => false);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
