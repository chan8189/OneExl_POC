class listAppsDetailModel {
  Response _response;

  listAppsDetailModel({Response response}) {
    this._response = response;
  }

  Response get response => _response;

  set response(Response response) => _response = response;

  listAppsDetailModel.fromJson(Map<String, dynamic> json) {
    _response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._response != null) {
      data['response'] = this._response.toJson();
    }
    return data;
  }
}

class Response {
  bool _isSuccess;
  Data _data;
  Null _error;

  Response({bool isSuccess, Data data, Null error}) {
    this._isSuccess = isSuccess;
    this._data = data;
    this._error = error;
  }

  bool get isSuccess => _isSuccess;

  set isSuccess(bool isSuccess) => _isSuccess = isSuccess;

  Data get data => _data;

  set data(Data data) => _data = data;

  Null get error => _error;

  set error(Null error) => _error = error;

  Response.fromJson(Map<String, dynamic> json) {
    _isSuccess = json['isSuccess'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this._isSuccess;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    data['error'] = this._error;
    return data;
  }
}

class Data {
  int _notificationCount;
  List<ListCategoryWiseAppDetailModel> _listCategoryWiseAppDetailModel;

  Data(
      {int notificationCount,
      List<ListCategoryWiseAppDetailModel> listCategoryWiseAppDetailModel}) {
    this._notificationCount = notificationCount;
    this._listCategoryWiseAppDetailModel = listCategoryWiseAppDetailModel;
  }

  int get notificationCount => _notificationCount;

  set notificationCount(int notificationCount) =>
      _notificationCount = notificationCount;

  List<ListCategoryWiseAppDetailModel> get listCategoryWiseAppDetailModel =>
      _listCategoryWiseAppDetailModel;

  set listCategoryWiseAppDetailModel(
          List<ListCategoryWiseAppDetailModel>
              listCategoryWiseAppDetailModel) =>
      _listCategoryWiseAppDetailModel = listCategoryWiseAppDetailModel;

  Data.fromJson(Map<String, dynamic> json) {
    _notificationCount = json['NotificationCount'];
    if (json['listCategoryWiseAppDetailModel'] != null) {
      _listCategoryWiseAppDetailModel =
          new List<ListCategoryWiseAppDetailModel>();
      json['listCategoryWiseAppDetailModel'].forEach((v) {
        _listCategoryWiseAppDetailModel
            .add(new ListCategoryWiseAppDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NotificationCount'] = this._notificationCount;
    if (this._listCategoryWiseAppDetailModel != null) {
      data['listCategoryWiseAppDetailModel'] =
          this._listCategoryWiseAppDetailModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCategoryWiseAppDetailModel {
  int _aPPCATEGORYID;
  String _aPPCATEGORYNAME;
  String _aPPCATEGORYIMAGE;
  List<ListAppsDetailModel> _listAppsDetailModel;

  ListCategoryWiseAppDetailModel(
      {int aPPCATEGORYID,
      String aPPCATEGORYNAME,
      String aPPCATEGORYIMAGE,
      List<ListAppsDetailModel> listAppsDetailModel}) {
    this._aPPCATEGORYID = aPPCATEGORYID;
    this._aPPCATEGORYNAME = aPPCATEGORYNAME;
    this._aPPCATEGORYIMAGE = aPPCATEGORYIMAGE;
    this._listAppsDetailModel = listAppsDetailModel;
  }

  int get aPPCATEGORYID => _aPPCATEGORYID;

  set aPPCATEGORYID(int aPPCATEGORYID) => _aPPCATEGORYID = aPPCATEGORYID;

  String get aPPCATEGORYNAME => _aPPCATEGORYNAME;

  set aPPCATEGORYNAME(String aPPCATEGORYNAME) =>
      _aPPCATEGORYNAME = aPPCATEGORYNAME;

  String get aPPCATEGORYIMAGE => _aPPCATEGORYIMAGE;

  set aPPCATEGORYIMAGE(String aPPCATEGORYIMAGE) =>
      _aPPCATEGORYIMAGE = aPPCATEGORYIMAGE;

  List<ListAppsDetailModel> get listAppsDetailModel => _listAppsDetailModel;

  set listAppsDetailModel(List<ListAppsDetailModel> listAppsDetailModel) =>
      _listAppsDetailModel = listAppsDetailModel;

  ListCategoryWiseAppDetailModel.fromJson(Map<String, dynamic> json) {
    _aPPCATEGORYID = json['APP_CATEGORY_ID'];
    _aPPCATEGORYNAME = json['APP_CATEGORY_NAME'];
    _aPPCATEGORYIMAGE = json['APP_CATEGORY_IMAGE'];
    if (json['listAppsDetailModel'] != null) {
      _listAppsDetailModel = new List<ListAppsDetailModel>();
      json['listAppsDetailModel'].forEach((v) {
        _listAppsDetailModel.add(new ListAppsDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['APP_CATEGORY_ID'] = this._aPPCATEGORYID;
    data['APP_CATEGORY_NAME'] = this._aPPCATEGORYNAME;
    data['APP_CATEGORY_IMAGE'] = this._aPPCATEGORYIMAGE;
    if (this._listAppsDetailModel != null) {
      data['listAppsDetailModel'] =
          this._listAppsDetailModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListAppsDetailModel {
  int _aPPCATEGORYID;
  String _aPPCATEGORYNAME;
  String _aPPID;
  String _aPPNAME;
  String _aPPDESC;
  String _aPPVERSION;
  String _aPPURL;
  String _oSTYPE;
  Null _aPPLEBUNDLEID;
  String _aNDROIDPACKAGENAME;
  bool _iSFORVENDOR;
  String _aPPIMAGE;
  int _aPPRATING;
  Null _uRISCHEME;
  String _aPPVERSIONDESC;
  bool _iSPWA;
  String _pWAURL;

  ListAppsDetailModel(
      {int aPPCATEGORYID,
      String aPPCATEGORYNAME,
      String aPPID,
      String aPPNAME,
      String aPPDESC,
      String aPPVERSION,
      String aPPURL,
      String oSTYPE,
      Null aPPLEBUNDLEID,
      String aNDROIDPACKAGENAME,
      bool iSFORVENDOR,
      String aPPIMAGE,
      int aPPRATING,
      Null uRISCHEME,
      String aPPVERSIONDESC,
      bool iSPWA,
      String pWAURL}) {
    this._aPPCATEGORYID = aPPCATEGORYID;
    this._aPPCATEGORYNAME = aPPCATEGORYNAME;
    this._aPPID = aPPID;
    this._aPPNAME = aPPNAME;
    this._aPPDESC = aPPDESC;
    this._aPPVERSION = aPPVERSION;
    this._aPPURL = aPPURL;
    this._oSTYPE = oSTYPE;
    this._aPPLEBUNDLEID = aPPLEBUNDLEID;
    this._aNDROIDPACKAGENAME = aNDROIDPACKAGENAME;
    this._iSFORVENDOR = iSFORVENDOR;
    this._aPPIMAGE = aPPIMAGE;
    this._aPPRATING = aPPRATING;
    this._uRISCHEME = uRISCHEME;
    this._aPPVERSIONDESC = aPPVERSIONDESC;
    this._iSPWA = iSPWA;
    this._pWAURL = pWAURL;
  }

  int get aPPCATEGORYID => _aPPCATEGORYID;

  set aPPCATEGORYID(int aPPCATEGORYID) => _aPPCATEGORYID = aPPCATEGORYID;

  String get aPPCATEGORYNAME => _aPPCATEGORYNAME;

  set aPPCATEGORYNAME(String aPPCATEGORYNAME) =>
      _aPPCATEGORYNAME = aPPCATEGORYNAME;

  String get aPPID => _aPPID;

  set aPPID(String aPPID) => _aPPID = aPPID;

  String get aPPNAME => _aPPNAME;

  set aPPNAME(String aPPNAME) => _aPPNAME = aPPNAME;

  String get aPPDESC => _aPPDESC;

  set aPPDESC(String aPPDESC) => _aPPDESC = aPPDESC;

  String get aPPVERSION => _aPPVERSION;

  set aPPVERSION(String aPPVERSION) => _aPPVERSION = aPPVERSION;

  String get aPPURL => _aPPURL;

  set aPPURL(String aPPURL) => _aPPURL = aPPURL;

  String get oSTYPE => _oSTYPE;

  set oSTYPE(String oSTYPE) => _oSTYPE = oSTYPE;

  Null get aPPLEBUNDLEID => _aPPLEBUNDLEID;

  set aPPLEBUNDLEID(Null aPPLEBUNDLEID) => _aPPLEBUNDLEID = aPPLEBUNDLEID;

  String get aNDROIDPACKAGENAME => _aNDROIDPACKAGENAME;

  set aNDROIDPACKAGENAME(String aNDROIDPACKAGENAME) =>
      _aNDROIDPACKAGENAME = aNDROIDPACKAGENAME;

  bool get iSFORVENDOR => _iSFORVENDOR;

  set iSFORVENDOR(bool iSFORVENDOR) => _iSFORVENDOR = iSFORVENDOR;

  String get aPPIMAGE => _aPPIMAGE;

  set aPPIMAGE(String aPPIMAGE) => _aPPIMAGE = aPPIMAGE;

  int get aPPRATING => _aPPRATING;

  set aPPRATING(int aPPRATING) => _aPPRATING = aPPRATING;

  Null get uRISCHEME => _uRISCHEME;

  set uRISCHEME(Null uRISCHEME) => _uRISCHEME = uRISCHEME;

  String get aPPVERSIONDESC => _aPPVERSIONDESC;

  set aPPVERSIONDESC(String aPPVERSIONDESC) => _aPPVERSIONDESC = aPPVERSIONDESC;

  bool get iSPWA => _iSPWA;

  set iSPWA(bool iSPWA) => _iSPWA = iSPWA;

  String get pWAURL => _pWAURL;

  set pWAURL(String pWAURL) => _pWAURL = pWAURL;

  ListAppsDetailModel.fromJson(Map<String, dynamic> json) {
    _aPPCATEGORYID = json['APP_CATEGORY_ID'];
    _aPPCATEGORYNAME = json['APP_CATEGORY_NAME'];
    _aPPID = json['APP_ID'];
    _aPPNAME = json['APP_NAME'];
    _aPPDESC = json['APP_DESC'];
    _aPPVERSION = json['APP_VERSION'];
    _aPPURL = json['APP_URL'];
    _oSTYPE = json['OS_TYPE'];
    _aPPLEBUNDLEID = json['APPLE_BUNDLE_ID'];
    _aNDROIDPACKAGENAME = json['ANDROID_PACKAGE_NAME'];
    _iSFORVENDOR = json['ISFOR_VENDOR'];
    _aPPIMAGE = json['APP_IMAGE'];
    _aPPRATING = json['APP_RATING'];
    _uRISCHEME = json['URISCHEME'];
    _aPPVERSIONDESC = json['APP_VERSION_DESC'];
    _iSPWA = json['IS_PWA'];
    _pWAURL = json['PWA_URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['APP_CATEGORY_ID'] = this._aPPCATEGORYID;
    data['APP_CATEGORY_NAME'] = this._aPPCATEGORYNAME;
    data['APP_ID'] = this._aPPID;
    data['APP_NAME'] = this._aPPNAME;
    data['APP_DESC'] = this._aPPDESC;
    data['APP_VERSION'] = this._aPPVERSION;
    data['APP_URL'] = this._aPPURL;
    data['OS_TYPE'] = this._oSTYPE;
    data['APPLE_BUNDLE_ID'] = this._aPPLEBUNDLEID;
    data['ANDROID_PACKAGE_NAME'] = this._aNDROIDPACKAGENAME;
    data['ISFOR_VENDOR'] = this._iSFORVENDOR;
    data['APP_IMAGE'] = this._aPPIMAGE;
    data['APP_RATING'] = this._aPPRATING;
    data['URISCHEME'] = this._uRISCHEME;
    data['APP_VERSION_DESC'] = this._aPPVERSIONDESC;
    data['IS_PWA'] = this._iSPWA;
    data['PWA_URL'] = this._pWAURL;
    return data;
  }
}
