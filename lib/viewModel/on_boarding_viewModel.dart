import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/resources/assets_manager.dart';
import 'package:the_cooker/resources/string_manager.dart';

import '../model/dio.dart';

class OnBoardingController with ChangeNotifier {
  OnBoardingController(){
     DioModel.init();
    notifyListeners();
  }
   final List<OnBoardingModel> _dataList =   [
    OnBoardingModel(StringManager.onboardingTitle1, StringManager.onboardingSubtitle1,
        ImagesManager.onboardingIcon1),
    OnBoardingModel(StringManager.onboardingTitle2, StringManager.onboardingSubtitle2,
        ImagesManager.onboardingIcon2),
    OnBoardingModel(StringManager.onboardingTitle3, StringManager.onboardingSubtitle3,
        ImagesManager.onboardingIcon3),
  
  ];

  List<PageViewModel> get pageViewData {
    List<PageViewModel> pagesData = _dataList.map((pageData) {
      return PageViewModel(
          title: pageData.title.toUpperCase(),
          bodyWidget: Text(pageData.description),
          image: SvgPicture.asset(pageData.imagePath));
    }).toList();
    return pagesData;
  }
}