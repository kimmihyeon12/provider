import 'package:flutter/material.dart';
import 'package:providermovie/model/restaurant_helper.dart';
import 'package:providermovie/repository/restaurant_repository.dart';


class RestaurantProvider extends ChangeNotifier{
  RestaurantRepository  _restaurantRepository = RestaurantRepository();
  List<Restaurant> _restaurants =[];
  List<Restaurant> get restaurants => _restaurants;
  loadRestaurants() async{
    List<Restaurant> listrestaurants = await _restaurantRepository.loadRestaurants();
    _restaurants = listrestaurants;
    notifyListeners();
  }
}
