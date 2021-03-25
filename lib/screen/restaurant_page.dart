import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:providermovie/model/restaurant_helper.dart';
import 'package:providermovie/provider/restaurant_provider.dart';
class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {


  PageController _pageController;
  int initialPage = 1;
  RestaurantProvider _restaurantProvider;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  var listimage = [
    "https://uahage.s3.ap-northeast-2.amazonaws.com/restaurant_image/image1.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/restaurant_image/image2.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/restaurant_image/image3.png",
  ];
  // Widget _makeListView(List<Restaurant> restaurant) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 25),
  //     child: AspectRatio(
  //       aspectRatio: 0.85,
  //       child: PageView.builder(
  //           itemBuilder: (context, index) =>
  //               Container(
  //                 // color: Colors.blueAccent,
  //                 margin: EdgeInsets.all(25),
  //                 child: _makeListrestaurant(restaurant[index]),
  //               )),
  //     ),
  //   );
  // };
  Widget _makeListView(List<Restaurant> restaurant) {
    return ListView.separated(
      itemCount: restaurant.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child:Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          restaurant[index].store_name,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Container(
                            child: Text(
                              restaurant[index].store_name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                              maxLines: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 1);
      },
    );


  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1500, height: 2667);
    _restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
    _restaurantProvider.loadRestaurants();
    return Scaffold(
      appBar: AppBar(
        title: Text("restaurant provider"),
      ),
      body: Consumer<RestaurantProvider>(
        builder: (BuildContext context, RestaurantProvider value, Widget child) {
          if (value.restaurants != null && value.restaurants.length > 0) {
            print(value.restaurants);
                return _makeListView(value.restaurants);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
