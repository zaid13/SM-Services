class PopularFilterListData {

// bool  AirTickebbol = false;
// bool  perDiembbol = false;
// bool  AbsenceSalarybbol = false;
// bool  AdvanceRequestbbol = false;

  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected = false;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'Air Ticket',

      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Per Diem',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Absence Salary',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Advance Cash',
      isSelected: false,
    ),

  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'All',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Apartment',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Home',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Villa',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Hotel',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Resort',
      isSelected: false,
    ),
  ];
}
