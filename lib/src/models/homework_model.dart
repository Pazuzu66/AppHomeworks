class HomeworkModel {
  int? idHW;
  String? nameHW;
  String? descriptionHW;
  DateTime? deliverDate;
  int? delivered;

  //Constructor
  HomeworkModel({
      this.idHW,
      this.nameHW,
      this.descriptionHW,
      this.deliverDate,
      this.delivered
      });
  
  //Map -> Object
  //JSON -> Object
  factory HomeworkModel.fromMap( Map<String, dynamic> map ) {
    return HomeworkModel(
      idHW            : map['idHW'],
      nameHW          : map['nameHW'],
      descriptionHW   : map['descriptionHW'],
      deliverDate     : DateTime.parse(map['deliverDate']),
      delivered       : map['delivered'] 
    );
  }

  //Object to Map
  //Object to JSON
  Map<String, dynamic> toMap() {
    return {
      'idHW'            : idHW,
      'nameHW'          : nameHW,
      'descriptionHW'   : descriptionHW,
      'deliverDate'     : deliverDate?.toIso8601String(),
      'delivered'       : delivered
    };
  }
}
