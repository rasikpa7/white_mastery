import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:white_mastery/model/photosModel.dart';
import 'package:white_mastery/model/searchModel.dart';
import 'package:white_mastery/services/homeServices.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class HomeController extends GetxController {
  List<Photos> photos = [];

  Search? searchResult;

  RxBool isPhotosloading = false.obs;

  RxBool isSearchloading = false.obs;

  RxBool isDownloading = false.obs;

  Future getPhotos() async {
    try {
      isPhotosloading.value = true;

      final respose = await HomeServices().getPhotos();

      if (respose!.statusCode == 200 || respose.statusCode == 201) {
        final datas = photosFromJson(respose.data);

        photos = datas;
      }

      log('done');

      isPhotosloading.value = false;
    } catch (e) {
      log('something went on get photos 2 $e');
    }
  }

  Future getSearch({required query}) async {
    try {
      isSearchloading.value = true;

      final respose = await HomeServices().search(query: query);

      if (respose!.statusCode == 200 || respose.statusCode == 201) {
        final datas = searchFromJson(respose.data);

        searchResult = datas;
      }

      log('done');

      isSearchloading.value = false;
    } catch (e) {
      log('something went on get photos 2 $e');
    }
  }

  Future downloadImage({required downloadUrl, required ImageName}) async {
    try {
      isDownloading.value = true;

      FileDownloader.downloadFile(
          url: '${downloadUrl}.png',
          name: ImageName,
          onDownloadCompleted: (path) {
            final File file = File(path);
            log('file download to $file');
            Get.back();

            Get.snackbar('Image Downloaded', 'image folder ${path}',
                snackPosition: SnackPosition.BOTTOM,
                icon: Icon(Icons.download_done));
            //This will be the path of the downloaded file
          });
          isDownloading.value = false;

    } catch (e) {
      log('something went wrong download controller $e');
    }
  }

  Future<List<AssetEntity>?> getLocalImages() async {
 try{

  final ImagePicker picker =  ImagePicker();

  final  image = await picker.pickImage(source: ImageSource.gallery);
  

 }catch(e){
  log('something went wrong while fetching images $e');
 }
}

  @override
  void onInit() {
    getPhotos();
     // TODO: implement onInit
    super.onInit();
  }
}
