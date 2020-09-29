import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController animationController;
  static List<TabIconData> tabIconsListforpending = <TabIconData>[
    TabIconData(
      imagePath: 'assets/bottomicon/accept.png',
      selectedImagePath: 'assets/bottomicon/accept.png',
      index: 0,

      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/reject.png',
      selectedImagePath: 'assets/bottomicon/reject.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/revise.png',
      selectedImagePath: 'assets/bottomicon/revise.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/history.png',
      selectedImagePath: 'assets/bottomicon/history.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/bottomicon/save.png',
      selectedImagePath: 'assets/bottomicon/save.png',
      index: 0,

      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/submit.png',
      selectedImagePath: 'assets/bottomicon/submit.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/attachment.png',
      selectedImagePath: 'assets/bottomicon/attachment.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/history.png',
      selectedImagePath: 'assets/bottomicon/history.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];

  static List<TabIconData> tabIconsListsaved = <TabIconData>[
    TabIconData(
      imagePath: 'assets/bottomicon/save.png',
      selectedImagePath: 'assets/bottomicon/save.png',
      index: 0,

      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/submit.png',
      selectedImagePath: 'assets/bottomicon/submit.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/attachment.png',
      selectedImagePath: 'assets/bottomicon/attachment.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/delete.png',
      selectedImagePath: 'assets/bottomicon/delete.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];


  static List<TabIconData> tabIconsListSubmitted = <TabIconData>[
    TabIconData(
      imagePath: 'assets/bottomicon/Rcall.png',
      selectedImagePath: 'assets/bottomicon/Rcall.png',
      index: 0,

      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/submit.png',
      selectedImagePath: 'assets/bottomicon/submit.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/attachment.png',
      selectedImagePath: 'assets/bottomicon/attachment.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/delete.png',
      selectedImagePath: 'assets/bottomicon/delete.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];



  static List<TabIconData> tabIconsListSetting = <TabIconData>[
    TabIconData(
      imagePath: 'assets/bottomicon/Rcall.png',
      selectedImagePath: 'assets/bottomicon/Rcall.png',
      index: 0,

      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/submit.png',
      selectedImagePath: 'assets/bottomicon/submit.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/attachment.png',
      selectedImagePath: 'assets/bottomicon/attachment.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/bottomicon/delete.png',
      selectedImagePath: 'assets/bottomicon/delete.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];

}
