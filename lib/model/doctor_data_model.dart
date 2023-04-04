class DoctorData {
  int? status;
  String? message;
  Data? data;

  DoctorData({this.status, this.message, this.data});

  DoctorData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  OrderInfo? orderInfo;
  int? totalRecord;

  Data({this.orderInfo, this.totalRecord});

  Data.fromJson(Map<String, dynamic> json) {
    orderInfo = json['orderInfo'] != null
        ? OrderInfo.fromJson(json['orderInfo'])
        : null;
    totalRecord = json['total_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderInfo != null) {
      data['orderInfo'] = orderInfo!.toJson();
    }
    data['total_record'] = totalRecord;
    return data;
  }
}

class OrderInfo {
  List<Orders>? orders;

  OrderInfo({this.orders});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? orderId;
  String? phone;
  String? phonePinCode;
  String? address;
  int? restaurantBrandId;
  String? latitude;
  String? longitude;
  int? sequenceNo;
  int? type;
  String? orderType;
  String? companySupportNo;
  int? orderTypeId;
  double? amount;
  //double? subTotal;
  double? total;
  int? tip;
  double? tax;
  int? deliveryFee;
  int? serviceFee;
  int? discount;
  int? bagFee;
  String? deliveryDate;
  String? submitedDate;
  String? expectedDate;
  int? deliveryType;
  int? isPickup;
  int? orderStatus;
  String? orderNotes;
  String? referenceNo;
  List<OrdersItems>? ordersItems;
  String? sortDate;
  int? isFuture;
  String? driverImage;
  String? driverThumbImage;
  String? driverId;
  CompanyDriver? companyDriver;
  int? isOnlyReceipt;
  int? isFoodreadyorderNew;
  int? isCancelorderNew;
  int? isRefundorderNew;
  int? isDelayorderNew;
  int? isAdjustorderpriceNew;
  int? isOutfordeliveryNew;
  bool? isFoodreadyorder;
  bool? isCancelorder;
  bool? isRefundorder;
  bool? isDelayorder;
  bool? isAdjustorderprice;
  bool? isOutfordelivery;
  int? printCount;
  int? adjustedCount;
  int? canceledCount;
  int? modifiedCount;

  Orders(
      {this.orderId,
        this.phone,
        this.phonePinCode,
        this.address,
        this.restaurantBrandId,
        this.latitude,
        this.longitude,
        this.sequenceNo,
        this.type,
        this.orderType,
        this.companySupportNo,
        this.orderTypeId,
        this.amount,
        //this.subTotal,
        this.total,
        this.tip,
        this.tax,
        this.deliveryFee,
        this.serviceFee,
        this.discount,
        this.bagFee,
        this.deliveryDate,
        this.submitedDate,
        this.expectedDate,
        this.deliveryType,
        this.isPickup,
        this.orderStatus,
        this.orderNotes,
        this.referenceNo,
        this.ordersItems,
        this.sortDate,
        this.isFuture,
        this.driverImage,
        this.driverThumbImage,
        this.driverId,
        this.companyDriver,
        this.isOnlyReceipt,
        this.isFoodreadyorderNew,
        this.isCancelorderNew,
        this.isRefundorderNew,
        this.isDelayorderNew,
        this.isAdjustorderpriceNew,
        this.isOutfordeliveryNew,
        this.isFoodreadyorder,
        this.isCancelorder,
        this.isRefundorder,
        this.isDelayorder,
        this.isAdjustorderprice,
        this.isOutfordelivery,
        this.printCount,
        this.adjustedCount,
        this.canceledCount,
        this.modifiedCount});

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    phone = json['phone'];
    phonePinCode = json['phone_pin_code'];
    address = json['address'];
    restaurantBrandId = json['restaurant_brand_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    sequenceNo = json['sequence_no'];
    type = json['type'];
    orderType = json['order_type'];
    companySupportNo = json['company_support_no'];
    orderTypeId = json['order_type_id'];
    amount = json['amount'];
    //subTotal = json['sub_total'];
    total = json['total'];
    tip = json['tip'];
    tax = json['tax'];
    deliveryFee = json['delivery_fee'];
    serviceFee = json['service_fee'];
    discount = json['discount'];
    bagFee = json['bag_fee'];
    deliveryDate = json['delivery_date'];
    submitedDate = json['submited_date'];
    expectedDate = json['expected_date'];
    deliveryType = json['delivery_type'];
    isPickup = json['is_pickup'];
    orderStatus = json['order_status'];
    orderNotes = json['order_notes'];
    referenceNo = json['reference_no'];
    if (json['ordersItems'] != null) {
      ordersItems = <OrdersItems>[];
      json['ordersItems'].forEach((v) {
        ordersItems!.add(OrdersItems.fromJson(v));
      });
    }
    sortDate = json['sort_date'];
    isFuture = json['is_future'];
    driverImage = json['driver_image'];
    driverThumbImage = json['driver_thumb_image'];
    driverId = json['driver_id'];
    companyDriver = json['company_driver'] != null
        ? CompanyDriver.fromJson(json['company_driver'])
        : null;
    isOnlyReceipt = json['is_only_receipt'];
    isFoodreadyorderNew = json['is_foodreadyorder_new'];
    isCancelorderNew = json['is_cancelorder_new'];
    isRefundorderNew = json['is_refundorder_new'];
    isDelayorderNew = json['is_delayorder_new'];
    isAdjustorderpriceNew = json['is_adjustorderprice_new'];
    isOutfordeliveryNew = json['is_outfordelivery_new'];
    isFoodreadyorder = json['is_foodreadyorder'];
    isCancelorder = json['is_cancelorder'];
    isRefundorder = json['is_refundorder'];
    isDelayorder = json['is_delayorder'];
    isAdjustorderprice = json['is_adjustorderprice'];
    isOutfordelivery = json['is_outfordelivery'];
    printCount = json['print_count'];
    adjustedCount = json['adjusted_count'];
    canceledCount = json['canceled_count'];
    modifiedCount = json['modified_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['phone'] = phone;
    data['phone_pin_code'] = phonePinCode;
    data['address'] = address;
    data['restaurant_brand_id'] = restaurantBrandId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['sequence_no'] = sequenceNo;
    data['type'] = type;
    data['order_type'] = orderType;
    data['company_support_no'] = companySupportNo;
    data['order_type_id'] = orderTypeId;
    data['amount'] = amount;
    //data['sub_total'] = subTotal;
    data['total'] = total;
    data['tip'] = tip;
    data['tax'] = tax;
    data['delivery_fee'] = deliveryFee;
    data['service_fee'] = serviceFee;
    data['discount'] = discount;
    data['bag_fee'] = bagFee;
    data['delivery_date'] = deliveryDate;
    data['submited_date'] = submitedDate;
    data['expected_date'] = expectedDate;
    data['delivery_type'] = deliveryType;
    data['is_pickup'] = isPickup;
    data['order_status'] = orderStatus;
    data['order_notes'] = orderNotes;
    data['reference_no'] = referenceNo;
    if (ordersItems != null) {
      data['ordersItems'] = ordersItems!.map((v) => v.toJson()).toList();
    }
    data['sort_date'] = sortDate;
    data['is_future'] = isFuture;
    data['driver_image'] = driverImage;
    data['driver_thumb_image'] = driverThumbImage;
    data['driver_id'] = driverId;
    if (companyDriver != null) {
      data['company_driver'] = companyDriver!.toJson();
    }
    data['is_only_receipt'] = isOnlyReceipt;
    data['is_foodreadyorder_new'] = isFoodreadyorderNew;
    data['is_cancelorder_new'] = isCancelorderNew;
    data['is_refundorder_new'] = isRefundorderNew;
    data['is_delayorder_new'] = isDelayorderNew;
    data['is_adjustorderprice_new'] = isAdjustorderpriceNew;
    data['is_outfordelivery_new'] = isOutfordeliveryNew;
    data['is_foodreadyorder'] = isFoodreadyorder;
    data['is_cancelorder'] = isCancelorder;
    data['is_refundorder'] = isRefundorder;
    data['is_delayorder'] = isDelayorder;
    data['is_adjustorderprice'] = isAdjustorderprice;
    data['is_outfordelivery'] = isOutfordelivery;
    data['print_count'] = printCount;
    data['adjusted_count'] = adjustedCount;
    data['canceled_count'] = canceledCount;
    data['modified_count'] = modifiedCount;
    return data;
  }
}

class OrdersItems {
  String? description;
  List<String>? printers;
  List<String>? defaultPrinters;
  int? sortNo;
  int? catSortNo;
  int? finalSortNo;
  String? notes;
  int? quantity;
  //double? price;
  List<PrintItemName>? printItemName;
  List<Modifiers>? modifiers;
  List<PrintModifiers>? printModifiers;

  OrdersItems(
      {this.description,
        this.printers,
        this.defaultPrinters,
        this.sortNo,
        this.catSortNo,
        this.finalSortNo,
        this.notes,
        this.quantity,
        //this.price,
        this.printItemName,
        this.modifiers,
        this.printModifiers});

  OrdersItems.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    printers = json['printers'].cast<String>();
    defaultPrinters = json['default_printers'].cast<String>();
    sortNo = json['sort_no'];
    catSortNo = json['cat_sort_no'];
    finalSortNo = json['final_sort_no'];
    notes = json['notes'];
    quantity = json['quantity'];
    //price = json['price'];
    if (json['print_item_name'] != null) {
      printItemName = <PrintItemName>[];
      json['print_item_name'].forEach((v) {
        printItemName!.add(PrintItemName.fromJson(v));
      });
    }
    if (json['modifiers'] != null) {
      modifiers = <Modifiers>[];
      json['modifiers'].forEach((v) {
        modifiers!.add(Modifiers.fromJson(v));
      });
    }
    if (json['print_modifiers'] != null) {
      printModifiers = <PrintModifiers>[];
      json['print_modifiers'].forEach((v) {
        printModifiers!.add(PrintModifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['printers'] = printers;
    data['default_printers'] = defaultPrinters;
    data['sort_no'] = sortNo;
    data['cat_sort_no'] = catSortNo;
    data['final_sort_no'] = finalSortNo;
    data['notes'] = notes;
    data['quantity'] = quantity;
    //data['price'] = price;
    if (printItemName != null) {
      data['print_item_name'] =
          printItemName!.map((v) => v.toJson()).toList();
    }
    if (modifiers != null) {
      data['modifiers'] = modifiers!.map((v) => v.toJson()).toList();
    }
    if (printModifiers != null) {
      data['print_modifiers'] =
          printModifiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrintItemName {
  String? printer;
  String? itemName;

  PrintItemName({this.printer, this.itemName});

  PrintItemName.fromJson(Map<String, dynamic> json) {
    printer = json['printer'];
    itemName = json['item_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['printer'] = printer;
    data['item_name'] = itemName;
    return data;
  }
}

class Modifiers {
  String? category;
  List<Modifiers>? modifiers;

  Modifiers({this.category, this.modifiers});

  Modifiers.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['modifiers'] != null) {
      modifiers = <Modifiers>[];
      json['modifiers'].forEach((v) {
        modifiers!.add(Modifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    if (this.modifiers != null) {
      data['modifiers'] = this.modifiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrintModifiers {
  String? printer;
  List<Modifiers>? modifiers;

  PrintModifiers({this.printer, this.modifiers});

  PrintModifiers.fromJson(Map<String, dynamic> json) {
    printer = json['printer'];
    if (json['modifiers'] != null) {
      modifiers = <Modifiers>[];
      json['modifiers'].forEach((v) {
        modifiers!.add(Modifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['printer'] = printer;
    if (modifiers != null) {
      data['modifiers'] = modifiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyDriver {
  String? driverImage;
  String? driverThumbImage;
  //int? driverId;
  String? driverName;
  String? driverNumber;
  String? driverEta;
  int? driverStatus;

  CompanyDriver(
      {this.driverImage,
        this.driverThumbImage,
        //this.driverId,
        this.driverName,
        this.driverNumber,
        this.driverEta,
        this.driverStatus});

  CompanyDriver.fromJson(Map<String, dynamic> json) {
    driverImage = json['driver_image'];
    driverThumbImage = json['driver_thumb_image'];
    //driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverNumber = json['driver_number'];
    driverEta = json['driver_eta'];
    driverStatus = json['driver_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driver_image'] = driverImage;
    data['driver_thumb_image'] = driverThumbImage;
    //data['driver_id'] = driverId;
    data['driver_name'] = driverName;
    data['driver_number'] = driverNumber;
    data['driver_eta'] = driverEta;
    data['driver_status'] = driverStatus;
    return data;
  }
}
