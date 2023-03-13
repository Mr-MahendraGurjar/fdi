class EntryData {
  final int id;
  final String auditId;
  final String categoryId;
  final String category;
  final String floor;
  final String floorId;
  final String area;
  final String areaId;
  final String areaNumber;
  final String telElement;
  final String element;
  final String elementId;
  final String foutSoort;
  final String foutSoortId;
  final String aantal;
  final String logboekImage;
  final String logboekText;
  final String technischeImage;
  final String technischeText;
  final String errorCount;

  EntryData(
      {this.id = 0,
      this.auditId = "",
      this.categoryId = "",
      this.category = "",
      this.floor = "",
      this.floorId = "",
      this.area = "",
      this.areaId = "",
      this.areaNumber = "",
      this.telElement = "",
      this.element = "",
      this.elementId = "",
      this.foutSoort = "",
      this.foutSoortId = "",
      this.aantal = "",
      this.logboekImage = "",
      this.logboekText = "",
      this.technischeImage = "",
      this.technischeText = "",
      this.errorCount = ""});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "auditId": auditId,
      "categoryId": categoryId,
      "category": category,
      "floor": floor,
      'floorId': floorId,
      'area': area,
      'areaId': areaId,
      'areaNumber': areaNumber,
      'telElement': telElement,
      'element': element,
      'elementId': elementId,
      'foutSoort': foutSoort,
      'foutSoortId': foutSoortId,
      'aantal': aantal,
      'logboekImage': logboekImage,
      'logboekText': logboekText,
      'technischeImage': technischeImage,
      'technischeText': technischeText,
      'errorCount': errorCount,
    };
  }

  factory EntryData.fromMap(Map<String, dynamic> map) {
    return EntryData(
      id: map['id'],
      auditId: map['auditId'],
      categoryId: map['categoryId'],
      category: map['category'],
      floor: map['floor'],
      floorId: map['floorId'],
      area: map['area'],
      areaId: map['areaId'],
      areaNumber: map['areaNumber'],
      telElement: map['telElement'],
      element: map['element'],
      elementId: map['elementId'],
      foutSoort: map['foutSoort'],
      foutSoortId: map['foutSoortId'],
      aantal: map['aantal'],
      logboekImage: map['logboekImage'],
      logboekText: map['logboekText'],
      technischeImage: map['technischeImage'],
      technischeText: map['technischeText'],
      errorCount: map['count'],
    );
  }
}
