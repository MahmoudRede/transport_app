class OrderModel {
  final String orderId;
  final String orderDate;
  final String orderName;
  final String orderDetails;
  final String orderValue;
  final String clientName;
  final String clientPhone;
  final String clientAddress;
  final String endClientName;
  final String endClientCity;
  final String endClientQuarter;
  final String endClientPhone;
  final String driverName;
  final String driverPhone;
  final int step;

  OrderModel({
    required this.orderId,
    required this.orderDate,
    required this.orderName,
    required this.orderDetails,
    required this.orderValue,
    required this.clientName,
    required this.clientPhone,
    required this.clientAddress,
    required this.endClientName,
    required this.endClientCity,
    required this.endClientQuarter,
    required this.endClientPhone,
    required this.driverName,
    required this.driverPhone,
    required this.step
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      orderId: json["orderId"]??"",
      orderDate: json["orderDate"]??"",
      orderName: json["orderName"]??"",
      orderDetails: json["orderDetails"]??"",
      orderValue: json["orderValue"]??"",
      clientName: json["clientName"]??"",
      clientPhone: json["clientPhone"]??"",
      clientAddress: json["clientAddress"]??"",
      endClientName: json["endClientName"]??"",
      endClientCity: json["endClientCity"]??"",
      endClientQuarter: json["endClientQuarter"]??"",
      endClientPhone: json["endClientPhone"]??"",
      driverName: json["driverName"]??"",
      driverPhone: json["driverPhone"]??"",
      step: json["step"]??0
  );

  Map<String, dynamic> toMap() => {
    "orderId": orderId,
    "orderName": orderName,
    "orderDetails": orderDetails,
    "orderValue": orderValue,
    "clientName": clientName,
    "clientPhone": clientPhone,
    "clientAddress": clientAddress,
    "endClientName": endClientName,
    "endClientCity": endClientCity,
    "endClientQuarter": endClientQuarter,
    "endClientPhone": endClientPhone,
    "driverName": driverName,
    "driverPhone": driverPhone,
    "step": step
  };
}