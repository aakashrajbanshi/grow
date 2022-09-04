import 'dart:developer';

import 'package:classapp/app/routes/routes.dart';
import 'package:classapp/features/daily-updates/model/daily_update_model.dart';
import 'package:classapp/features/daily-updates/services/daily_update_services.dart';
import 'package:classapp/features/daily-updates/widgets/list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DailyUpdatesView extends StatefulWidget {
  const DailyUpdatesView({Key? key}) : super(key: key);

  @override
  State<DailyUpdatesView> createState() => _DailyUpdatesViewState();
}

class _DailyUpdatesViewState extends State<DailyUpdatesView> {
  List<DailyUpdateModel> dailyUpdates = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getDailyUpdates();
  }

  getDailyUpdates() async {
    DailyUpdateServices dailyUpdate = DailyUpdateServices();
    dailyUpdates = await dailyUpdate.fetchDailyUpdates();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addDailyUpdateRoute);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.dailyUpdates),
      ),
      body: _isLoading
          ? ListShimmer()
          : ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: dailyUpdates.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(dailyUpdates[index].title ?? ""),
                  subtitle: Text(dailyUpdates[index].description ?? ""),
                  trailing: dailyUpdates[index].acknowledgedAt == null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                log("Edit Tapped");
                              },
                              child: const Icon(
                                Icons.edit,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                log("Delete Tapped");
                              },
                              child: const Icon(
                                Icons.delete,
                              ),
                            )
                          ],
                        )
                      : const SizedBox(),
                );
              },
            ),
    );
  }
}
