import 'package:flutter/material.dart';

class RoundedTabBar extends StatelessWidget {
  const RoundedTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: TabBar(
          controller: tabController,
          splashBorderRadius: BorderRadius.circular(25),
          physics: const NeverScrollableScrollPhysics(),
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.all(4),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.white),
          tabs: const [
            Tab(
              child: Text(
                'Recharge',
              ),
            ),
            Tab(
              child: Text(
                'History',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
