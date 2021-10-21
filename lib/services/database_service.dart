import 'package:photo_view/photo_view.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

addVote(
  String vote,
    String uploadId
) async {
  QueryBuilder<ParseObject> queryUpload =
      QueryBuilder<ParseObject>(ParseObject('Uploads'))
        ..whereEqualTo('objectId', uploadId);
  final ParseResponse uploadResponse = await queryUpload.query();
  if (uploadResponse.success && uploadResponse.result != null) {
    print('Okaay Its Working good, Got upload object');
  }

  QueryBuilder<ParseObject> queryVote =
      QueryBuilder<ParseObject>(ParseObject('Votes'))
        ..whereEqualTo('userID', await getUser());
  final ParseResponse voteResponse = await queryVote.query();
  if (voteResponse.success && voteResponse.results?.first != null) {
    print('User has already Voted');
  } else {
    ParseObject vote = ParseObject('Votes')
      ..set('userID', await getUser())
      ..set(
        'uploadID',
        await uploadResponse.results!.first,
      )
      ..set('type', 'Bacteria');

    final ParseResponse parseResponse = await vote.save();
    if (parseResponse.success) {
      print('Vote Saved');
    } else {
      print(parseResponse.error!.message);
    }
  }
}

getOwnUploads() async {
  QueryBuilder<ParseObject> queryuploads =
      QueryBuilder<ParseObject>(ParseObject('Uploads'))
        ..whereEqualTo('userID', await getUser());
  final ParseResponse parseResponse = await queryuploads.query();
  return parseResponse.results;
}

addUpload(
    String url,
    String width,
    String height,
    String country,
    String state,
    String type,
    PhotoViewControllerValue initialController,
    List<String> boxValues) async {
  ParseObject upload = ParseObject('Uploads')
    ..set('userID', await getUser())
    ..set('umWidth', width)
    ..set('umHeight', height)
    ..set('country', country)
    ..set('state', state)
    ..set('type', type)
    ..set('initialController', initialController)
    ..set('boxStart', boxValues)
    ..set('photoURL', url);

  ParseResponse reponse = await upload.save();
  if (reponse.success) {
    print('Saved New Infos');
  } else {
    print('something wrong happened, couldnt upload new photo');
    print(reponse.error!.message);
  }
}

Future<ParseUser?> getUser() async {
  ParseUser? currentUser = await ParseUser.currentUser();
  return currentUser;
}

Future<List<ParseObject>> getUploads() async {
  QueryBuilder<ParseObject> queryUploads =
      QueryBuilder<ParseObject>(ParseObject('Uploads'))
        ..orderByDescending('updatedAt')
        ..setLimit(10);
  final ParseResponse apiResponse = await queryUploads.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}
