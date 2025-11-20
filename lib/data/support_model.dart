
import 'package:devon_studio_web/data/product_model.dart';

class SupportModel {
   List<ProductModel>? products;
   String? summary;
   String? address;
   String? privacyPolicy;

   SupportModel({
      this.products,
      this.summary,
      this.address,
      this.privacyPolicy
   });

   factory SupportModel.fromJson(Map<String, dynamic> json) {
     // 'products'가 null이 아니고 리스트 형태인지 확인합니다.
     var productList = json['products'] as List?;
     List<ProductModel>? products;
     if (productList != null) {
       products = productList.map((i) => ProductModel.fromJson(i as Map<String, dynamic>)).toList();
     }

     return SupportModel(
       products: products,
       summary: json['summary'] as String?,
       address: json['address'] as String?,
       privacyPolicy: json['privacyPolicy'] as String?,
     );
   }
}