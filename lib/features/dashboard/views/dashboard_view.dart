import 'package:classapp/features/dashboard/model/dashboard_card_model.dart';
import 'package:classapp/features/dashboard/services/dashboard_services.dart';
import 'package:classapp/features/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardCardModel? dashboardCard;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDashboardCardData();
  }

  fetchDashboardCardData() async {
    DashboardServices services = DashboardServices();
    DashboardCardModel? response = await services.fetchDashboardCardData();
    dashboardCard = response;
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : dashboardCard == null
              ? const Center(
                  child: Text("something went wromg"),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          DashboardCard(
                              icon: const Icon(
                                Icons.leave_bags_at_home,
                              ),
                              containerColor: Colors.blue,
                              title: "My leaves",
                              count: dashboardCard!.myLeaveBalance.toString()),
                          DashboardCard(
                              icon: const Icon(Icons.dashboard_customize),
                              title: "My ghost count",
                              count: dashboardCard!.myghostCount.toString()),
                          DashboardCard(
                              icon: const Icon(Icons.dashboard_customize),
                              title: "My leave balance",
                              count: dashboardCard!.myLeaveBalance.toString()),
                          DashboardCard(
                              icon: const Icon(Icons.dashboard_customize),
                              title: "My missing checkout",
                              count: dashboardCard!.myMissingCheckoutCount
                                  .toString()),
                          DashboardCard(
                              icon: const Icon(Icons.dashboard_customize),
                              title: "My not acknowledged",
                              count:
                                  dashboardCard!.myNotAcknowledged.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }
}
