class OrdersModel {
  String? ordersId;
  String? ordersUser;
  String? ordersAddres;
  String? ordersType;
  String? ordersPaymentmethod;
  String? ordersPrice;
  String? ordersDileveryprice;
  String? ordersTotalprice;
  String? ordersCopoun;
  String? ordersStatus;
  String? ordersDate;
  String? addressId;
  String? addressUser;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUser,
      this.ordersAddres,
      this.ordersType,
      this.ordersPaymentmethod,
      this.ordersPrice,
      this.ordersDileveryprice,
      this.ordersTotalprice,
      this.ordersCopoun,
      this.ordersStatus,
      this.ordersDate,
      this.addressId,
      this.addressUser,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUser = json['orders_user'];
    ordersAddres = json['orders_addres'];
    ordersType = json['orders_type'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersPrice = json['orders_price'];
    ordersDileveryprice = json['orders_dileveryprice'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCopoun = json['orders_copoun'];
    ordersStatus = json['orders_status'];
    ordersDate = json['orders_date'];
    addressId = json['address_id'];
    addressUser = json['address_user'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_user'] = this.ordersUser;
    data['orders_addres'] = this.ordersAddres;
    data['orders_type'] = this.ordersType;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_price'] = this.ordersPrice;
    data['orders_dileveryprice'] = this.ordersDileveryprice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_copoun'] = this.ordersCopoun;
    data['orders_status'] = this.ordersStatus;
    data['orders_date'] = this.ordersDate;
    data['address_id'] = this.addressId;
    data['address_user'] = this.addressUser;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
