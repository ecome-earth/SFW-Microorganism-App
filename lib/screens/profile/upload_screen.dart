import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/components/upload_tile.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                for (var upload in provider.uploads!)
                  UploadTile(
                    uploadModel: upload,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 75,
      color: Color(0xFFFFF7F4),
      child: Row(
        children: [
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              onPressed: () => print('hello world'),
              icon: Icon(
                Icons.list,
                size: 40,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              '2 Uploads',
              style: tabHeading,
              textAlign: TextAlign.center,
            ),
          )),
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              onPressed: () => print('hello world'),
              icon: Icon(Icons.add_a_photo_outlined, size: 32)),
        ],
      ),
    );
  }
}
