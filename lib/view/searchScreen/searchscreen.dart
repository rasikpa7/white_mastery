import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:white_mastery/controller/homeController.dart';
import 'package:white_mastery/view/homeScreen/homescreen.dart';
import 'package:white_mastery/view/homeScreen/widgets/ImageWidget.dart';
import 'package:white_mastery/view/searchScreen/searchResultWidget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return  Scaffold(
           body: Obx(() => 
           controller.isSearchloading.value==true?
            Center(
              child: CircularProgressIndicator(),
            ):
            controller.searchResult!.results!.isEmpty?
            Center(child: Text('no photos',
            style: TextStyle(fontSize: 13.sp),),)
            :

            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            physics: BouncingScrollPhysics(),
            itemCount: controller.searchResult?.results?.length,
             itemBuilder: (context, index) {
              final result = controller.searchResult?.results?[index];
              final color = result?.color!.split('#')[1];
              final bg = int.parse('0xff$color');
               return SearchResult(bg: bg, result: result!);
             },),
          ),
    );
  }
}