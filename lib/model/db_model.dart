class OrderDbModel{
  int? orderId;
  int? sequenceNo;
  String? orderType;
  String? expectedDate;

  OrderDbModel({this.orderId,
    this.sequenceNo,
    this.orderType,
    this.expectedDate});

  factory OrderDbModel.fromDatabaseJson(Map<String, dynamic> data) => OrderDbModel(
    orderId: data['order_id'],
    sequenceNo: data['sequence_no'],
    orderType: data['ooder_type'],
    expectedDate: data['expected_date'],

  );
  Map<String, dynamic> toDatabaseJson() => {
    "order_id": orderId,
    "sequence_no": sequenceNo,
    "order_type": orderType,
    "expected_date": expectedDate,
  };

}