
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:white_mastery/controller/homeController.dart';
import 'package:white_mastery/view/searchScreen/searchscreen.dart';

class HomeSearch extends SearchDelegate{

  final search = Get.put(HomeController());
  @override
  List<Widget>? buildActions(BuildContext context) =>[
    IconButton(onPressed: (){
      if(query.isEmpty){

      
      close(context, null);
      }else{
        query='';
      }
    }, icon: Icon(CupertinoIcons.xmark_circle,size: 2.sp,))
  ];

  @override
  Widget? buildLeading(BuildContext context) =>

    IconButton(onPressed: (){
      close(context, null);

    },icon: Icon(Icons.arrow_back_ios,size: 17.sp,),
    );
  

  @override
  Widget buildResults(BuildContext context) {
    search.getSearch(query: query);
    return SearchScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Press enter to search',style: TextStyle(
              fontSize: 14.sp
            ),),
          ),
        ],
      ),
    );
  }
}