class AppListResponse {
  Response response;

  AppListResponse({this.response});

  AppListResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class Response {
  bool isSuccess;
  Data data;
  Null error;

  Response({this.isSuccess, this.data, this.error});

  Response.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int notificationCount;
  List<ListCategoryWiseAppDetailModel> listCategoryWiseAppDetailModel;

  Data({this.notificationCount, this.listCategoryWiseAppDetailModel});

  Data.fromJson(Map<String, dynamic> json) {
    notificationCount = json['NotificationCount'];
    if (json['listCategoryWiseAppDetailModel'] != null) {
      listCategoryWiseAppDetailModel =
      new List<ListCategoryWiseAppDetailModel>();
      json['listCategoryWiseAppDetailModel'].forEach((v) {
        listCategoryWiseAppDetailModel
            .add(new ListCategoryWiseAppDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NotificationCount'] = this.notificationCount;
    if (this.listCategoryWiseAppDetailModel != null) {
      data['listCategoryWiseAppDetailModel'] =
          this.listCategoryWiseAppDetailModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCategoryWiseAppDetailModel {
  int aPPCATEGORYID;
  String aPPCATEGORYNAME;
  String aPPCATEGORYIMAGE;
  List<ListAppsDetailModel> listAppsDetailModel;

  ListCategoryWiseAppDetailModel(
      {this.aPPCATEGORYID,
        this.aPPCATEGORYNAME,
        this.aPPCATEGORYIMAGE,
        this.listAppsDetailModel});

  ListCategoryWiseAppDetailModel.fromJson(Map<String, dynamic> json) {
    aPPCATEGORYID = json['APP_CATEGORY_ID'];
    aPPCATEGORYNAME = json['APP_CATEGORY_NAME'];
    aPPCATEGORYIMAGE = json['APP_CATEGORY_IMAGE'];
    if (json['listAppsDetailModel'] != null) {
      listAppsDetailModel = new List<ListAppsDetailModel>();
      json['listAppsDetailModel'].forEach((v) {
        listAppsDetailModel.add(new ListAppsDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['APP_CATEGORY_ID'] = this.aPPCATEGORYID;
    data['APP_CATEGORY_NAME'] = this.aPPCATEGORYNAME;
    data['APP_CATEGORY_IMAGE'] = this.aPPCATEGORYIMAGE;
    if (this.listAppsDetailModel != null) {
      data['listAppsDetailModel'] =
          this.listAppsDetailModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListAppsDetailModel {
  int aPPCATEGORYID;
  String aPPCATEGORYNAME;
  String aPPID;
  String aPPNAME;
  String aPPDESC;
  String aPPVERSION;
  String aPPURL;
  String oSTYPE;
  Null aPPLEBUNDLEID;
  String aNDROIDPACKAGENAME;
  bool iSFORVENDOR;
  String aPPIMAGE;
  int aPPRATING;
  Null uRISCHEME;
  String aPPVERSIONDESC;
  bool iSPWA;
  String pWAURL;

  ListAppsDetailModel(
      {this.aPPCATEGORYID,
        this.aPPCATEGORYNAME,
        this.aPPID,
        this.aPPNAME,
        this.aPPDESC,
        this.aPPVERSION,
        this.aPPURL,
        this.oSTYPE,
        this.aPPLEBUNDLEID,
        this.aNDROIDPACKAGENAME,
        this.iSFORVENDOR,
        this.aPPIMAGE,
        this.aPPRATING,
        this.uRISCHEME,
        this.aPPVERSIONDESC,
        this.iSPWA,
        this.pWAURL});

  ListAppsDetailModel.fromJson(Map<String, dynamic> json) {
    aPPCATEGORYID = json['APP_CATEGORY_ID'];
    aPPCATEGORYNAME = json['APP_CATEGORY_NAME'];
    aPPID = json['APP_ID'];
    aPPNAME = json['APP_NAME'];
    aPPDESC = json['APP_DESC'];
    aPPVERSION = json['APP_VERSION'];
    aPPURL = json['APP_URL'];
    oSTYPE = json['OS_TYPE'];
    aPPLEBUNDLEID = json['APPLE_BUNDLE_ID'];
    aNDROIDPACKAGENAME = json['ANDROID_PACKAGE_NAME'];
    iSFORVENDOR = json['ISFOR_VENDOR'];
    aPPIMAGE = json['APP_IMAGE'];
    aPPRATING = json['APP_RATING'];
    uRISCHEME = json['URISCHEME'];
    aPPVERSIONDESC = json['APP_VERSION_DESC'];
    iSPWA = json['IS_PWA'];
    pWAURL = json['PWA_URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['APP_CATEGORY_ID'] = this.aPPCATEGORYID;
    data['APP_CATEGORY_NAME'] = this.aPPCATEGORYNAME;
    data['APP_ID'] = this.aPPID;
    data['APP_NAME'] = this.aPPNAME;
    data['APP_DESC'] = this.aPPDESC;
    data['APP_VERSION'] = this.aPPVERSION;
    data['APP_URL'] = this.aPPURL;
    data['OS_TYPE'] = this.oSTYPE;
    data['APPLE_BUNDLE_ID'] = this.aPPLEBUNDLEID;
    data['ANDROID_PACKAGE_NAME'] = this.aNDROIDPACKAGENAME;
    data['ISFOR_VENDOR'] = this.iSFORVENDOR;
    data['APP_IMAGE'] = this.aPPIMAGE;
    data['APP_RATING'] = this.aPPRATING;
    data['URISCHEME'] = this.uRISCHEME;
    data['APP_VERSION_DESC'] = this.aPPVERSIONDESC;
    data['IS_PWA'] = this.iSPWA;
    data['PWA_URL'] = this.pWAURL;
    return data;
  }
}
