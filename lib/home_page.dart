import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journal_app/agreement_page.dart';
import 'package:journal_app/tabs/dummy_tab.dart';
import 'package:journal_app/tabs/judgment_tab.dart';
import 'package:journal_app/widgets/custom_action_bar.dart';
import 'package:journal_app/widgets/side_tabs.dart';
import 'package:journal_app/widgets/warning_sign.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _tabsPageController;
  int _selectedTab = 2;

  @override
  void initState() {
    _tabsPageController = PageController(initialPage: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AgreementPage());
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.red, Color(0xff4A82FF)],
                ),
              ),
            ),
            const Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Column(
          children: [
            const CustomActionBar(
              title: "Research Result",
              isHome: true,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: WarningSign(),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 10, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SideTabs(
                      selectedTab: _selectedTab,
                      tabPressed: (number) {
                        _tabsPageController.animateToPage(number,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic);
                      },
                    ),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                      ),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabsPageController,
                        scrollDirection: Axis.vertical,
                        children: [
                          const DummyTab(),
                          const DummyTab(),
                          JudgmentTab(),
                          const DummyTab(),
                          const DummyTab(),
                          const DummyTab(),
                        ],
                        onPageChanged: (number) {
                          setState(() {
                            _selectedTab = number;
                          });
                        },
                      ),
                    )),
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
