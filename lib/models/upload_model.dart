import 'dart:async';
import 'dart:math';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/services/authentication_service.dart';
import 'dart:ui' as ui;

class UploadDataModel {
  late double imageWidth;
  late String organismWidth;
  late String organsimeLength;
  late String scale;
  late String position;
  final NetworkImage networkImage;

  final double imageMicroWidth;

  late List<Offset> points;
  Offset p1 = Offset(0, 0), p2 = Offset(0, 0);
  Offset p1Rect = Offset(0, 0), p2Rect = Offset(0, 0);

  UploadDataModel({
    required this.imageMicroWidth,
    required this.networkImage,
  });


  initialize(String width, String length, String currentScale, String currentPosition) async {
    // ui.Image myImage = await _getImage(networkImage.url);
    // imageWidth = myImage.width.toDouble();
    // print(myImage.width);
    position=currentPosition;
     organismWidth= width;
    organsimeLength= length;
  }



  updateBox(Offset p1, Offset p2) {
    p1Rect = p1;
    p2Rect = p2;
  }

  addUpload(
      String url,
      String imageWidth,
      String imageHeight,
      String country,
      String state,
      String type,
      String scale,
      String position,
      String p1,
      String p2,
      String organismWidth,
      String organismHeight) async {
    ParseObject upload = ParseObject('Uploads')
      ..set('userID', await getUser())
      ..set('umWidth', imageWidth)
      ..set('umHeight', imageHeight)
      ..set('country', country)
      ..set('state', state)
      ..set('scale', scale)
      ..set('position', position)
      ..set('boxStart', p1)
      ..set('boxEnd', p2)
      ..set('photoURL', url)
      ..set('organismWidth', organismWidth)
      ..set('organismHeight', organismHeight);

    ParseResponse reponse = await upload.save();
    if (reponse.success) {
      print('Saved New Infos');
    } else {
      print('something wrong happened, couldnt upload new photo');
      print(reponse.error!.message);
    }
  }

  List<Offset> getBox() {
    return [
      p1,
      p2,
    ];
  }
}
