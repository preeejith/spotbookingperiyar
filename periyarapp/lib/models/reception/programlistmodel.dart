class ProgramListModel {
  bool? status;
  List<Data>? data;
  List<Package>? package;
  String? dateType;

  ProgramListModel({this.status, this.data, this.package, this.dateType});

  ProgramListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['package'] != null) {
      package = <Package>[];
      json['package'].forEach((v) {
        package!.add(Package.fromJson(v));
      });
    }
    dateType = json['dateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (package != null) {
      data['package'] = package!.map((v) => v.toJson()).toList();
    }
    data['dateType'] = dateType;
    return data;
  }
}

class Data {
  BookingAvailability? bookingAvailability;
  Cottage? cottage;
  Boating? boating;
  bool? needEntranceTicket;
  bool? needShuttleBus;
  bool? started;
  bool? isCottage;
  bool? isBoating;
  bool? freeAcess;
  int? numberOfDays;
  List<void>? addons;
  List<String>? photos;
  List<String>? video;
  String? status;
  num? rating;
  int? ratingCount;
  List<void>? startLocation;
  List<void>? endLocation;
  String? sId;
  List<void>? inactiveStatus;
  String? category;
  String? caption;
  String? progName;
  String? description;
  String? startPoint;
  String? endPoint;
  num? duration;
  int? onlinePercent;
  int? minGuest;
  int? maxGuest;
  int? maxAge;
  int? minAge;
  String? reportingTime;
  String? rules;
  String? notes;
  int? iV;
  String? coverImage;
  String? frontImage;
  String? notice;

  Data(
      {this.bookingAvailability,
      this.cottage,
      this.boating,
      this.needEntranceTicket,
      this.needShuttleBus,
      this.started,
      this.isCottage,
      this.isBoating,
      this.freeAcess,
      this.numberOfDays,
      this.addons,
      this.photos,
      this.video,
      this.status,
      this.rating,
      this.ratingCount,
      this.startLocation,
      this.endLocation,
      this.sId,
      this.inactiveStatus,
      this.category,
      this.caption,
      this.progName,
      this.description,
      this.startPoint,
      this.endPoint,
      this.duration,
      this.onlinePercent,
      this.minGuest,
      this.maxGuest,
      this.maxAge,
      this.minAge,
      this.reportingTime,
      this.rules,
      this.notes,
      this.iV,
      this.coverImage,
      this.frontImage,
      this.notice});

  Data.fromJson(Map<String, dynamic> json) {
    bookingAvailability = json['bookingAvailability'] != null
        ? BookingAvailability.fromJson(json['bookingAvailability'])
        : null;
    cottage =
        json['cottage'] != null ? Cottage.fromJson(json['cottage']) : null;
    boating =
        json['boating'] != null ? Boating.fromJson(json['boating']) : null;
    needEntranceTicket = json['needEntranceTicket'];
    needShuttleBus = json['needShuttleBus'];
    started = json['started'];
    isCottage = json['isCottage'];
    isBoating = json['isBoating'];
    freeAcess = json['freeAcess'];
    numberOfDays = json['numberOfDays'];
    if (json['addons'] != null) {
      addons = <Null>[];
      json['addons'].forEach((v) {
        // addons!.add(Null.fromJson(v));
      });
    }
    photos = json['photos'].cast<String>();
    video = json['video'].cast<String>();
    status = json['status'];
    rating = json['rating'] ?? 0;
    ratingCount = json['ratingCount'];
    if (json['startLocation'] != null) {
      startLocation = <Null>[];
      json['startLocation'].forEach((v) {
        // startLocation!.add(Null.fromJson(v));
      });
    }
    if (json['endLocation'] != null) {
      endLocation = <Null>[];
      json['endLocation'].forEach((v) {
        // endLocation!.add(Null.fromJson(v));
      });
    }
    sId = json['_id'];
    if (json['inactiveStatus'] != null) {
      inactiveStatus = <Null>[];
      json['inactiveStatus'].forEach((v) {
        // inactiveStatus!.add(Null.fromJson(v));
      });
    }
    category = json['category'];
    caption = json['caption'];
    progName = json['progName'];
    description = json['description'];
    startPoint = json['startPoint'];
    endPoint = json['endPoint'];
    duration = json['duration'];
    onlinePercent = json['onlinePercent'];
    minGuest = json['minGuest'];
    maxGuest = json['maxGuest'];
    maxAge = json['maxAge'];
    minAge = json['minAge'];
    reportingTime = json['reportingTime'];
    rules = json['rules'];
    notes = json['notes'];
    iV = json['__v'];
    coverImage = json['coverImage'];
    frontImage = json['frontImage'];
    notice = json['notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bookingAvailability != null) {
      data['bookingAvailability'] = bookingAvailability!.toJson();
    }
    if (cottage != null) {
      data['cottage'] = cottage!.toJson();
    }
    if (boating != null) {
      data['boating'] = boating!.toJson();
    }
    data['needEntranceTicket'] = needEntranceTicket;
    data['needShuttleBus'] = needShuttleBus;
    data['started'] = started;
    data['isCottage'] = isCottage;
    data['isBoating'] = isBoating;
    data['freeAcess'] = freeAcess;
    data['numberOfDays'] = numberOfDays;
    if (addons != null) {
      // data['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    data['photos'] = photos;
    data['video'] = video;
    data['status'] = status;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    if (startLocation != null) {
      // data['startLocation'] =
      //     startLocation!.map((v) => v.toJson()).toList();
    }
    if (endLocation != null) {
      // data['endLocation'] = endLocation!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    if (inactiveStatus != null) {
      // data['inactiveStatus'] =
      //     inactiveStatus!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
    data['caption'] = caption;
    data['progName'] = progName;
    data['description'] = description;
    data['startPoint'] = startPoint;
    data['endPoint'] = endPoint;
    data['duration'] = duration;
    data['onlinePercent'] = onlinePercent;
    data['minGuest'] = minGuest;
    data['maxGuest'] = maxGuest;
    data['maxAge'] = maxAge;
    data['minAge'] = minAge;
    data['reportingTime'] = reportingTime;
    data['rules'] = rules;
    data['notes'] = notes;
    data['__v'] = iV;
    data['coverImage'] = coverImage;
    data['frontImage'] = frontImage;
    data['notice'] = notice;
    return data;
  }
}

class BookingAvailability {
  bool? indian;
  bool? foreigner;
  bool? children;

  BookingAvailability({this.indian, this.foreigner, this.children});

  BookingAvailability.fromJson(Map<String, dynamic> json) {
    indian = json['indian'];
    foreigner = json['foreigner'];
    children = json['children'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['indian'] = indian;
    data['foreigner'] = foreigner;
    data['children'] = children;
    return data;
  }
}

class Cottage {
  int? maxExtraGuestCount;
  int? maxExtraIndianCount;
  int? maxExtraForeignerCount;
  int? maxExtraChildrenCount;
  List<String>? activities;
  String? schedule;
  int? guestPerRoom;

  Cottage(
      {this.maxExtraGuestCount,
      this.maxExtraIndianCount,
      this.maxExtraForeignerCount,
      this.maxExtraChildrenCount,
      this.activities,
      this.schedule,
      this.guestPerRoom});

  Cottage.fromJson(Map<String, dynamic> json) {
    maxExtraGuestCount = json['maxExtraGuestCount'];
    maxExtraIndianCount = json['maxExtraIndianCount'];
    maxExtraForeignerCount = json['maxExtraForeignerCount'];
    maxExtraChildrenCount = json['maxExtraChildrenCount'];
    activities = json['activities'].cast<String>();
    schedule = json['schedule'];
    guestPerRoom = json['guestPerRoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxExtraGuestCount'] = maxExtraGuestCount;
    data['maxExtraIndianCount'] = maxExtraIndianCount;
    data['maxExtraForeignerCount'] = maxExtraForeignerCount;
    data['maxExtraChildrenCount'] = maxExtraChildrenCount;
    data['activities'] = activities;
    data['schedule'] = schedule;
    data['guestPerRoom'] = guestPerRoom;
    return data;
  }
}

class Boating {
  int? maxticketperGuest;
  int? ticketTaken;
  int? ticketRemaining;

  Boating({this.maxticketperGuest, this.ticketTaken, this.ticketRemaining});

  Boating.fromJson(Map<String, dynamic> json) {
    maxticketperGuest = json['maxticketperGuest'];
    ticketTaken = json['ticketTaken'];
    ticketRemaining = json['ticketRemaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxticketperGuest'] = maxticketperGuest;
    data['ticketTaken'] = ticketTaken;
    data['ticketRemaining'] = ticketRemaining;
    return data;
  }
}

class Package {
  Holidays? holidays;
  Holidays? extraperhead;
  List<String>? packageFacility;
  bool? isExtraPerHeadAvailable;
  String? sId;
  String? fromDate;
  String? toDate;
  int? indian;
  int? indianChildren;
  int? foreignerChildren;
  int? foreigner;
  String? programme;
  int? iV;

  Package(
      {this.holidays,
      this.extraperhead,
      this.packageFacility,
      this.isExtraPerHeadAvailable,
      this.sId,
      this.fromDate,
      this.toDate,
      this.indian,
      this.indianChildren,
      this.foreignerChildren,
      this.foreigner,
      this.programme,
      this.iV});

  Package.fromJson(Map<String, dynamic> json) {
    holidays =
        json['holidays'] != null ? Holidays.fromJson(json['holidays']) : null;
    extraperhead = json['extraperhead'] != null
        ? Holidays.fromJson(json['extraperhead'])
        : null;
    packageFacility = json['packageFacility'].cast<String>();
    isExtraPerHeadAvailable = json['isExtraPerHeadAvailable'];
    sId = json['_id'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    indian = json['indian'];
    indianChildren = json['indianChildren'];
    foreignerChildren = json['foreignerChildren'];
    foreigner = json['foreigner'];
    programme = json['programme'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (holidays != null) {
      data['holidays'] = holidays!.toJson();
    }
    if (extraperhead != null) {
      data['extraperhead'] = extraperhead!.toJson();
    }
    data['packageFacility'] = packageFacility;
    data['isExtraPerHeadAvailable'] = isExtraPerHeadAvailable;
    data['_id'] = sId;
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['indian'] = indian;
    data['indianChildren'] = indianChildren;
    data['foreignerChildren'] = foreignerChildren;
    data['foreigner'] = foreigner;
    data['programme'] = programme;
    data['__v'] = iV;
    return data;
  }
}

class Holidays {
  int? indian;
  int? indianChildren;
  int? foreignerChildren;
  int? foreigner;

  Holidays(
      {this.indian,
      this.indianChildren,
      this.foreignerChildren,
      this.foreigner});

  Holidays.fromJson(Map<String, dynamic> json) {
    indian = json['indian'];
    indianChildren = json['indianChildren'];
    foreignerChildren = json['foreignerChildren'];
    foreigner = json['foreigner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['indian'] = indian;
    data['indianChildren'] = indianChildren;
    data['foreignerChildren'] = foreignerChildren;
    data['foreigner'] = foreigner;
    return data;
  }
}
