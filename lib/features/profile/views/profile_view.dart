import 'package:classapp/app/routes.dart';
import 'package:classapp/constants/image_constants.dart';
import 'package:classapp/features/profile/model/profile_model.dart';
import 'package:classapp/features/profile/services/profile_services.dart';
import 'package:classapp/helpers/confirmation_dialog.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/models/dummy_page_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../locator.dart';
import '../../../pages/login_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
                              return Text("Hello");
                            });
                      },
                      icon: const Icon(Icons.edit)),
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
                      child: Text("Navigate")),
                  ElevatedButton(
                    onPressed: () {
                      AppSnacks.showSuccessToast("this is a toast");
                    },
                    child: const Text(
                      "Press",
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
