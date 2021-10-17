import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/components/bottom_navbar.dart';
import 'package:sfw_microorganisms/components/upload_tile.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';
import 'package:sfw_microorganisms/screens/profile/profileInfo.dart';

class ProfileUploads extends StatefulWidget {
  ProfileUploads({Key? key}) : super(key: key);

  @override
  _ProfileUploadsState createState() => _ProfileUploadsState();
}

class _ProfileUploadsState extends State<ProfileUploads>
    with TickerProviderStateMixin {
  late TabController _tabController;
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                ],
              ),
            ),
          ),
          body: Consumer<ProfileProvider>(
            builder: (context, provider, _) {
              return TabBarView(
                controller: _tabController,
                children: [
                  ProfileInfo(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        for (var upload in provider.uploads!)
                          UploadTile(
                            upload: upload,
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          bottomNavigationBar: CustomNavBar(provider: provider, index: 0),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 75,
      color: Color(0xFFFFF7F4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          Spacer(),
          Text(
            '2 Uploads',
            style: tabHeading,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                print('changing to New Upload form');
                //TODO:replace with NewUpload
                Navigator.of(context).pushNamed('newUpload');
              },
              icon: Icon(Icons.add_a_photo_outlined, size: 32)),
        ],
      ),
    );
  }
}
