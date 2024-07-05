import 'package:contro/models/bank_account_model/bank_account_model.dart';
import 'package:contro/models/chat_model/messages_model.dart';
import 'package:contro/models/qr_codes_model/qr_code_model.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../../models/activity_model/activity_model.dart';
import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import '../../models/category_selection_model/category_selection_model.dart';
import '../../models/charts/column_chart_model.dart';
import '../../models/chat_model/chat_model.dart';
import '../../models/item_model/item_model.dart';
import '../../models/pick_up_location_model/pick_up_location_model.dart';
import '../../models/seller_finance_model/seller_finance_model.dart';
import '../../models/summary_model/summary_model.dart';
import '../../models/wallet_filters_model/wallet_filters_model.dart';
import '../../screen/home/activities/activity_landing/view/activity_landing_screen.dart';
import '../../screen/home/chat/chat_landing/view/chat_landing_screen.dart';
import '../../screen/home/dashboard/view/dashboard_screen.dart';
import '../../screen/home/item/item_landing/view/item_landing_screen.dart';
import '../../screen/home/settings/settings_landing/view/settings_landing_screen.dart';

class ConstantLists {
  ConstantLists._();

  // Bottom Navigation
  static List<BottomNavigationBarModel> bottomBarList = [
    BottomNavigationBarModel(
      itemIndex: 0,
      unSelectedIconString: Assets.bottomNavigationIconsDashBoardUnselected,
      selectedIconsString: Assets.bottomNavigationIconsDashBoardSelected,
      title: "Dashboard",
      onTapFunction: () {
        Get.offAll(
          () => const DashboardScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 1,
      unSelectedIconString: Assets.bottomNavigationIconsChatIconUnselected,
      selectedIconsString: Assets.bottomNavigationIconsChatIconSelected,
      title: "Chat",
      onTapFunction: () {
        Get.offAll(
          () => const ChatLandingScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 2,
      unSelectedIconString:
          Assets.bottomNavigationIconsSquarePlusIconUnselected,
      selectedIconsString: Assets.bottomNavigationIconsSquarePlusIconUnselected,
      title: "Plus",
      onTapFunction: () {
        Get.to(
          () => const ItemLandingScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 3,
      unSelectedIconString:
          Assets.bottomNavigationIconsActivitiesIconUnselected,
      selectedIconsString: Assets.bottomNavigationIconsActivitiesIconSelected,
      title: "Activities",
      onTapFunction: () {
        Get.offAll(
          () => const ActivityLandingScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
    BottomNavigationBarModel(
      itemIndex: 4,
      unSelectedIconString: Assets.bottomNavigationIconsSettingsUnselected,
      selectedIconsString: Assets.bottomNavigationIconsSettingsSelected,
      title: "Settings",
      onTapFunction: () {
        Get.offAll(
          () => const SettingsLandingScreen(),
          transition: Transition.fadeIn,
        );
      },
    ),
  ];
  static List<CategorySelectionModel> categorySelectionList = [
    CategorySelectionModel(
      iconString: Assets.iconsProductIcon,
      title: "I make or sell PRODUCTS.",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsServiceIcon,
      title: "I provide SERVICES.",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsArtist,
      title: "Artist,Photographers & Creative Types",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsProfessional,
      title: "Consultants & Professionals",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsFinancial,
      title: "Financial Services",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsHair,
      title: "Hair, Spa & Aesthetics",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsRealEstate,
      title: "Real Estates",
    ),
    CategorySelectionModel(
      iconString: Assets.iconsTechnology,
      title: "Web, Technology & Media",
    ),
  ];
  static List<SummaryModel> summaryModelList = [
    SummaryModel(title: "activities", value: "600"),
    SummaryModel(title: "transactions", value: "\$ 120,345.00"),
    SummaryModel(title: "in progress", value: "80"),
  ];
  static List<ColumnChartData> revenueData = [
    ColumnChartData('Mon', 10),
    ColumnChartData('Tue', 15),
    ColumnChartData('Wed', 14),
    ColumnChartData('Thu', 13),
    ColumnChartData('Fri', 20),
    ColumnChartData('Sat', 14),
    ColumnChartData('Sun', 15),
  ];
  static List<ActivityModel> activityModelList = [
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Open",
      activityStatus: "Preparing order.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "In Transit",
      activityStatus: "Order is ready for delivery.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Complete",
      activityStatus: "Order is out for delivery.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Dispute",
      activityStatus: "Preparing order.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "In Transit",
      activityStatus: "Order is ready for delivery.",
    ),
  ];
  static List<ActivityModel> activityModelListTwo = [
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Open",
      activityStatus: "Preparing order.",
    ),
    ActivityModel(
        orderId: "3499889",
        created: "24/03/2024",
        price: "\$ 668.80",
        status: "In Transit",
        activityStatus: ""),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Complete",
      activityStatus: "Order is complete.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Dispute",
      activityStatus: "Preparing order.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "In Transit",
      activityStatus: "Order is ready for delivery.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Cancelled",
      activityStatus: "Order is out for delivery.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Open",
      activityStatus: "Order is delivered.",
    ),
    ActivityModel(
        orderId: "3499889",
        created: "24/03/2024",
        price: "\$ 668.80",
        status: "In Transit",
        activityStatus: "Order is out for delivery."),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Complete",
      activityStatus: "Order is complete.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Dispute",
      activityStatus: "Order is out for delivery.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "In Transit",
      activityStatus: "Order is complete.",
    ),
    ActivityModel(
      orderId: "3499889",
      created: "24/03/2024",
      price: "\$ 668.80",
      status: "Cancelled",
      activityStatus: "Preparing order.",
    ),
  ];
  static List<SellerFinanceModel> sellerFinanceList = [
    SellerFinanceModel(
      financeId: "102938",
      amount: "339.90",
      date: "25/03/2024",
      service: "Mailer Box . Stripe",
      isRevenue: true,
    ),
    SellerFinanceModel(
      financeId: "102938",
      amount: "1814.30",
      date: "25/03/2024",
      service: "Top & Bottom Carton . FPX",
      isRevenue: true,
    ),
    SellerFinanceModel(
      financeId: "102938",
      amount: "14,000.00",
      date: "25/03/2024",
      service: "Maybank Berhad",
      isRevenue: false,
    ),
    SellerFinanceModel(
      financeId: "102938",
      amount: "1201.45",
      date: "25/03/2024",
      service: "Seller Fees . Contro Wallet",
      isRevenue: false,
    ),
    SellerFinanceModel(
      financeId: "102938",
      amount: "20,614.30",
      date: "25/03/2024",
      service: "Digital Print Box . Stripe",
      isRevenue: true,
    ),
    SellerFinanceModel(
      financeId: "102938",
      amount: "514.30",
      date: "25/03/2024",
      service: "Digital Print Box . FPX",
      isRevenue: true,
    ),
  ];
  static List<WalletFiltersModel> walletFilterModelList = [
    WalletFiltersModel(
      filterName: "All Transactions",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Revenue",
      index: 1,
    ),
    WalletFiltersModel(
      filterName: "Expenditure",
      index: 2,
    ),
    WalletFiltersModel(
      filterName: "Other",
      index: 3,
    ),
  ];
  static List<WalletFiltersModel> activitiesFilterList = [
    WalletFiltersModel(
      filterName: "All (8)",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Open Orders (0)",
      index: 1,
    ),
    WalletFiltersModel(
      filterName: "In Transit (0)",
      index: 2,
    ),
    WalletFiltersModel(
      filterName: "Completed (0)",
      index: 3,
    ),
  ];
  static List<WalletFiltersModel> qrCodesFilterList = [
    WalletFiltersModel(
      filterName: "Active (0)",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Inactive (0)",
      index: 1,
    ),
    WalletFiltersModel(
      filterName: "Under Review (0)",
      index: 2,
    ),
  ];
  static List<WalletFiltersModel> activitiesFilterListTwo = [
    WalletFiltersModel(
      filterName: "All",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Open Orders",
      index: 1,
    ),
    WalletFiltersModel(
      filterName: "In Transit",
      index: 2,
    ),
    WalletFiltersModel(
      filterName: "Completed",
      index: 3,
    ),
    WalletFiltersModel(
      filterName: "Dispute",
      index: 4,
    ),
    WalletFiltersModel(
      filterName: "Cancelled",
      index: 5,
    ),
  ];
  static List<WalletFiltersModel> activitiesFilterListThree = [
    WalletFiltersModel(
      filterName: "Active",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Inactive",
      index: 1,
    ),
    WalletFiltersModel(
      filterName: "Under Review",
      index: 2,
    ),
  ];
  static List<WalletFiltersModel> activitiesFilterListFour = [
    WalletFiltersModel(
      filterName: "Create Date",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Views",
      index: 1,
    ),
  ];
  static List<WalletFiltersModel> itemFilterList = [
    WalletFiltersModel(
      filterName: "All",
      index: 0,
    ),
    WalletFiltersModel(
      filterName: "Products",
      index: 1,
    ),
    WalletFiltersModel(
      filterName: "Services",
      index: 2,
    ),
  ];
  static List<BankAccountModel> bankAccountModelList = [
    BankAccountModel(
      assetImage: Assets.imagesHsbcBank,
      bankName: "HSBC Bank",
      accountNumber: "(Account No: ****** **2098)",
    ),
    BankAccountModel(
      assetImage: Assets.imagesCityBank,
      bankName: "Citibank",
      accountNumber: "(Account No: ****** **2098)",
    ),
    BankAccountModel(
      assetImage: Assets.imagesMaybank,
      bankName: "Maybank",
      accountNumber: "(Account No: ****** **2098)",
    ),
  ];
  static List<ChatModel> chatList = [
    ChatModel(
      image: Assets.iconsControMessageIcon,
      name: "Contro",
      time: "12:00 AM",
      message:
          "Would you like to upgrade to upgrade the total products and marketing. Please b...",
    ),
    ChatModel(
      image: Assets.imagesChatOne,
      name: "+6012 777 8888",
      time: "12:00 AM",
      message: "Do you have XL and able to customise my size?",
    ),
    ChatModel(
      image: Assets.imagesChatTwo,
      name: "+6011 600 3333",
      time: "Yesterday",
      message: "[Product]",
    ),
    ChatModel(
      image: Assets.iconsServiceAnnouncement,
      name: "Service Announcement",
      time: "Yesterday",
      message: "New Coupons Available for Grab! ",
    ),
  ];
  static List<MessagesModel> messagesList = [
    MessagesModel(
      image: Assets.imagesChatOne,
      isUserMessage: true,
      messages: '22"',
      messageType: "isVoice",
      number: "+6012 777 8888",
    ),
    MessagesModel(
      image: Assets.imagesChatOne,
      isUserMessage: true,
      messages: '22"',
      messageType: "isVoice",
      number: "+6012 777 8888",
    ),
    MessagesModel(
      image: Assets.imagesChatOne,
      isUserMessage: true,
      messages: Assets.imagesMessageContainer,
      messageType: "isImage",
      number: "+6012 777 8888",
    ),
    MessagesModel(
      image: Assets.iconsControMessageIcon,
      isUserMessage: false,
      messages: "The item is available.",
      messageType: "isText",
      number: "",
    ),
    MessagesModel(
      image: Assets.iconsControMessageIcon,
      isUserMessage: false,
      messages: "Click here to purchase immediate.",
      messageType: "isText",
      number: "",
    ),
    MessagesModel(
      image: Assets.imagesChatOne,
      isUserMessage: true,
      messages:
          "Do you have size XL and be able to customise as my size? what is the minimum quantity?",
      messageType: "isText",
      number: "+6012 777 8888",
    ),
  ];
  static List<QrCodesModel> qrCodeModelList = [
    QrCodesModel(
      qrCodeImage: Assets.imagesQrCodeImage,
      title: "Extrabread Instant App",
      createOn: "20/02/2024",
      views: "103",
    ),
    QrCodesModel(
      qrCodeImage: Assets.imagesQrCodeImage,
      title: "Mailer Box Details",
      createOn: "20/02/2024",
      views: "103",
    ),
    QrCodesModel(
      qrCodeImage: Assets.imagesQrCodeImage,
      title: "Paper Sheet Details",
      createOn: "20/02/2024",
      views: "103",
    ),
    QrCodesModel(
      qrCodeImage: Assets.imagesQrCodeImage,
      title: "New Year Bundle",
      createOn: "20/02/2024",
      views: "103",
    ),
    QrCodesModel(
      qrCodeImage: Assets.imagesQrCodeImage,
      title: "Extrabread Customer Service",
      createOn: "20/02/2024",
      views: "103",
    ),
    QrCodesModel(
      qrCodeImage: Assets.imagesQrCodeImage,
      title: "Extrabread Shop",
      createOn: "20/02/2024",
      views: "103",
    ),
  ];
  static List<ItemModel> itemModelList = [
    ItemModel(
      imageAsset: Assets.imagesItemOne,
      name: "RSC Cartons",
      reference: "MB-203998A",
      amount: "5.80",
    ),
    ItemModel(
      imageAsset: Assets.imagesItemTwo,
      name: "RSC Cartons",
      reference: "RSC-6009-4C",
      amount: "5.80",
    ),
    ItemModel(
      imageAsset: Assets.imagesItemThree,
      name: "Top-Bottom Carton Box",
      reference: "TBC-8900-2C",
      amount: "5.80",
    ),
    ItemModel(
      imageAsset: Assets.imagesItemFour,
      name: "Paper Sheets",
      reference: "TBC-8900-2C",
      amount: "5.80",
    ),
    ItemModel(
      imageAsset: Assets.imagesItemFive,
      name: "Paper Sheets",
      reference: "TBC-8900-2C",
      amount: "5.80",
    ),
    ItemModel(
      imageAsset: Assets.imagesItemSix,
      name: "Digital Printed Top Bottom Box",
      reference: "TBC-8900-2C",
      amount: "5.80",
    ),
    ItemModel(
      imageAsset: Assets.imagesItemSeven,
      name: "Digital Printed Offset Box",
      reference: "TBC-8900-2C",
      amount: "5.80",
    ),
  ];

  static List<PickUpLocationModel> pickUpLocationModelList = [
    PickUpLocationModel(
      title: "Pavilion Bukit Bintang",
      description: "Kuala Lumpur, 5000, Malaysia.",
    ),
    PickUpLocationModel(
      title: "Mid Valley Megamall",
      description: "Kuala Lumpur, 5000, Malaysia.",
    ),
    PickUpLocationModel(
      title: "One Utama Shopping Centre",
      description: "Petaling Jaya, 47800, Malaysia.",
    ),
    PickUpLocationModel(
      title: "TRX Shopping Gallery",
      description: "TRX, Kuala Lumpur, 50000, Malaysia.",
    ),
    PickUpLocationModel(
      title: "Kuala Lumpur City Centre",
      description: "Kuala Lumpur, 5000, Malaysia.",
    ),
  ];
  static List<PickUpLocationModel> locationList = [
    PickUpLocationModel(
      title: "Kuala Lumpur City Centre",
      description: "Kuala Lumpur, 5000, Malaysia.",
    ),
    PickUpLocationModel(
      title: "Pavilion Kuala Lumpur",
      description: "Kuala Lumpur, 5000, Malaysia",
    ),
    PickUpLocationModel(
      title: "Mid Valley Megamall",
      description: "Kuala Lumpur, 5000, Malaysia",
    ),
    PickUpLocationModel(
      title: "One Utama Shopping Centre",
      description: "Petaling Jaya, 47800, Malaysia",
    ),
    PickUpLocationModel(
      title: "Publika",
      description: "Solaris Dutamas, Kuala Lumpur, 51000, Malaysia",
    ),
    PickUpLocationModel(
      title: "TRX Shopping Gallery",
      description: "TRX, Kuala Lumpur, 50000, Malaysia.",
    ),
    PickUpLocationModel(
      title: "TRX Shopping Gallery",
      description: "Petaling Jaya, 47000, Malaysia",
    ),
    PickUpLocationModel(
      title: "Jalan Alor",
      description: "Kuala Lumpur, 50000, Malaysia",
    ),
    PickUpLocationModel(
      title: "Petaling Street (Chinatown)",
      description: "Kuala Lumpur, 50000, Malaysia",
    ),
    PickUpLocationModel(
      title: "Central Market (Pasar Seni)",
      description: "Kuala Lumpur, 50000, Malaysia",
    ),
  ];
}
