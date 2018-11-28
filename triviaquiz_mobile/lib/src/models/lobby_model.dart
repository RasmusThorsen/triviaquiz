import 'package:triviaquiz_mobile/src/models/category_model.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';

class LobbyModel {
  String id;
  String gameCode;
  List<PlayerModel> players;
  List<CategoryModel> categories;
}