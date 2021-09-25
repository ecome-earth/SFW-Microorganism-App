import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/models/upload.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class UploadTile extends StatelessWidget {
  const UploadTile({Key? key, this.upload}) : super(key: key);

  final Upload? upload;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '${upload!.percentage}%',
                    style: percentageText,
                  ),
                  Expanded(
                    child: Text(
                      '${upload!.name}',
                      style: tabHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_outlined),
                      Text('${upload!.participants.toString()}'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/profile/placeholder.jpg',
                fit: BoxFit.fitHeight,
              ),
            )
          ],
        ));
  }
}
