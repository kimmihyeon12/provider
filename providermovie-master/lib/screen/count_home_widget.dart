import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermovie/components/viewcount.dart';
import 'package:providermovie/provider/countprovider.dart';


class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key key}) : super(key: key);
  CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Count App'),
        centerTitle: true,
      ),
      body: VidwCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            _countProvider.add();
          }),
          IconButton(icon: Icon(Icons.remove), onPressed: (){
            _countProvider.remove();
          })
        ],
      ),  
    );
  }
}





