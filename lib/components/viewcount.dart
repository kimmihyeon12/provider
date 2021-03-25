import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermovie/provider/countprovider.dart';


class VidwCountWidget extends StatelessWidget {
  const VidwCountWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ddddd');
    return Center(
      child: Consumer<CountProvider>(builder: (context, provider, child) {
        return Text(
          Provider.of<CountProvider>(context).count.toString(),
          style: TextStyle(fontSize: 35),
        );
      }),
    );
  }
}