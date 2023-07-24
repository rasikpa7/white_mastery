import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:white_mastery/controller/homeController.dart';
import 'package:white_mastery/model/photosModel.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.bg,
    required this.photos,
  });

  final int bg;
  final Photos photos;

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(HomeController());
    return GestureDetector(
      onTap:(){
        Get.bottomSheet(BottomSheet(
          onClosing: (){}, builder: (context) => 
        Container(height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            ElevatedButton(onPressed: ()async{
                controller.downloadImage(downloadUrl: photos.urls!.thumb,ImageName: photos.slug);
              }, child: Text('Download')),
          
          ],
        ),),));
      },
      child: Container(
       margin: EdgeInsets.all(2.h),
       decoration: BoxDecoration(
         color: Color(bg),
         border: Border.all(color: const Color(0xffF4F4F4)),
         borderRadius: BorderRadius.circular(10.r)
       ),
       child: CachedNetworkImage(
          imageUrl: photos.urls!.thumb!,
          errorWidget: (context, url, error) => Icon(Icons.error),
       ),
      
      ),
    );
  }
}