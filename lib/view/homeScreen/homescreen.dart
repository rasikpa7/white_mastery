import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:white_mastery/controller/homeController.dart';
import 'package:white_mastery/view/homeScreen/widgets/ImageWidget.dart';
import 'package:white_mastery/view/searchScreen/searchDelegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int selectedIndex = 0;

  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
        bottomNavigationBar:
            BottomNavigationBar(
              onTap: (value)async{
                setState(() {
                  selectedIndex=value;

                
                });
                if(value==1){
                  controller.getLocalImages();
                }
              },
              currentIndex: selectedIndex, items: [
          BottomNavigationBarItem(
              label: 'Photos', icon: Icon(Icons.photo_album)),
          BottomNavigationBarItem(label: 'CropImages', icon: Icon(Icons.edit))
        ]),
        appBar: AppBar(
          title: Text(
            'White Mastery',
            style: TextStyle(fontSize: 17.sp),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  showSearch(context: context, delegate: HomeSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: selectedIndex==0?
         Obx(
          () => controller.isPhotosloading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.photos.length,
                  itemBuilder: (context, index) {
                    final photos = controller.photos[index];
                    final color = photos.color!.split('#')[1];
                    final bg = int.parse('0xff$color');
                    return ImageWidget(bg: bg, photos: photos);
                  },
                ),
        ):

          
        GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.photos.length,
                  itemBuilder: (context, index) {
                    final photos = controller.photos[index];
                    final color = photos.color!.split('#')[1];
                    final bg = int.parse('0xff$color');
                    return ImageWidget(bg: bg, photos: photos);
                  },
                )
    );



  }
}
