import 'package:providermovie/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:providermovie/model/restaurant_helper.dart';

class RestaurantRepository {
  List<dynamic> restaurants;

  Future<List<Restaurant>> loadRestaurants() async {
    var response = await http.get('http://121.147.203.150:3000/map/getList/restaurant');

    List responseJson = json.decode(response.body);

      return responseJson.map<Restaurant>((item) => Restaurant.fromJson(item)).toList();
    }


}
