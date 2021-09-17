import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/models/upload_model.dart';

class ProfileProvider extends ChangeNotifier {
  final List<UploadModel>? _uploads = [
    UploadModel(
      name: 'Nematode',
      percentage: '85',
      participants: 35,
    ),
    UploadModel(
      name: 'Nematode',
      percentage: '85',
      participants: 35,
    ),
  ];

  List<UploadModel>? get uploads => _uploads;

  Map<int, bool>? _bottomNavItems = {0: true, 1: false, 2: false};
  Map<int, bool>? get bottomNavItems => _bottomNavItems;

  int? _previousIndex = 0;
  int? get previousIndex => _previousIndex;

  void selectItem({required int index}) {
    if (index != previousIndex) {
      _bottomNavItems!.update(index, (value) => true);
      _bottomNavItems!.update(_previousIndex!, (value) => false);
    }
    notifyListeners();
  }

  void setPreviousIndex({required int index}) {
    _previousIndex = index;
    notifyListeners();
  }
}
