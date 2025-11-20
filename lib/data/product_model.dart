
class ProductModel {
  String? title;
  String? subTitle;
  String? description;
  String? contents;
  List<Map<String, String>>? features;

  ProductModel({
    this.title,
    this.subTitle,
    this.description,
    this.contents,
    this.features});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // 1. 'features' 필드를 List<dynamic>으로 안전하게 가져옵니다.
    final featuresList = json['features'] as List<dynamic>?;

    // 2. 새로운 List<Map<String, String>> 타입의 리스트를 선언합니다.
    List<Map<String, String>>? convertedFeatures;

    // 3. featuresList가 null이 아니면, 각 요소를 변환하여 새 리스트를 만듭니다.
    if (featuresList != null) {
      convertedFeatures = featuresList.map((item) {
        // 3-1. 리스트의 각 요소(item)를 Map<String, dynamic>으로 캐스팅합니다.
        final mapItem = item as Map<String, dynamic>;
        // 3-2. Map<String, dynamic>의 각 key-value를 String으로 변환하여 새로운 Map<String, String>을 생성합니다.
        return mapItem.map((key, value) => MapEntry(key, value.toString()));
      }).toList(); // 3-3. 변환된 요소들로 새로운 리스트를 생성합니다.
    }

    return ProductModel(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      description: json['description'] as String?,
      contents: json['contents'] as String?,
      // 4. 최종적으로 변환된 리스트를 할당합니다.
      features: convertedFeatures,
    );
  }
}