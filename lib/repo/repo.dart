import 'package:session2/data/api/api.dart';
import 'package:session2/data/models/mars_photo.dart';

class Repo {
  late Api _api ;
  Repo (){
    _api = Api();
  }
  Future <List<MarsPhoto>> fechLastPhotos ()async {
final data = await _api.fetchPhotos();
final photos = data.map((e) => MarsPhoto.fromJson(e)).toList();
return photos ;
  }
}