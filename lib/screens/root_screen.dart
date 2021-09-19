import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/components/upload_tile.dart';
import 'package:sfw_microorganisms/providers/bottomnavbar_provider.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 10.0),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFF03DAC5),
                labelColor: Color(0xFF03DAC5),
                unselectedLabelColor: Colors.grey[500],
                labelStyle: tabHeading,
                labelPadding: const EdgeInsets.symmetric(vertical: 8.0),
                tabs: [
                  Tab(
                    text: 'Info',
                  ),
                  Tab(
                    text: 'Uploads',
                  ),
                  Tab(
                    text: 'Microdex',
                  )
                ],
              ),
            ),
          ),
          body: Provider.of<BottomNavBarProvider>(context, listen: false)
              .pages[provider.selectedIndex],
          bottomNavigationBar: _buildBottomNavBar(provider: provider),
        );
      },
    );
  }

  Widget _buildBottomNavBar({required ProfileProvider provider}) {
    return SizedBox(
      height: 120,
      child: BottomNavigationBar(
        onTap: (index) {
          provider.selectItem(index: index);
          provider.setPreviousIndex(index: index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 40,
                color: provider.bottomNavItems![0]!
                    ? Color(0xFF03DAC5)
                    : Colors.black,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Profile',
                style: TextStyle(
                  color: provider.bottomNavItems![0]!
                      ? Color(0xFF03DAC5)
                      : Colors.black,
                ),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/profile/quiz.png',
                height: 40,
                width: 40,
                color: provider.bottomNavItems![1]!
                    ? Color(0xFF03DAC5)
                    : Colors.black,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Quiz',
                style: TextStyle(
                  color: provider.bottomNavItems![1]!
                      ? Color(0xFF03DAC5)
                      : Colors.black,
                ),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/profile/microdex.png',
                height: 40,
                width: 40,
                color: provider.bottomNavItems![2]!
                    ? Color(0xFF03DAC5)
                    : Colors.black,
              ),
              // ignore: deprecated_member_use
              title: Text('Microdex',
                  style: TextStyle(
                    color: provider.bottomNavItems![2]!
                        ? Color(0xFF03DAC5)
                        : Colors.black,
                  ))),
        ],
      ),
    );
  }
}
