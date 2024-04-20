import 'package:das_assignment/presentation/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Mobile Recharge',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            ClipRRect(
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
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
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
            ),
            Form(
              key: formKey,
              child: Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        const Text("Current Beneficiaries:"),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return const ContactCard();
                            },
                          ),
                        ),
                        Text('Add a new beneficiary'),
                        TextFormField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                    const Center(
                      child: Text('Tab 2 content'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
