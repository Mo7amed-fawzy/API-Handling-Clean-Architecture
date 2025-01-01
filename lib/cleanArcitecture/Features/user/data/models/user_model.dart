import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/models/sub_models/address_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/models/sub_models/company_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';

class UserModel extends UserEntitiy {
  // السوبر هي الحجات المحتاجها وهبعتها جوا الانتيتي بتعتي والباقي هتعامل معاها عادي بستعبلو فالمودل دا
  // يعني مثلا انا الادرسس محتاجو فسوبر واليوزر نام مش محتاجو فزيس
  // هستقبل username دا محتاجو انما الباقي انا مش محتاجو فهبعتو فال superModel بتاعي
  int id;
  final String username;
  final String website;
  final CompanyModel company;
  UserModel({
    required this.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.username,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // دي بخزن بيها الداتا الجاية من ال api (الفاكتوري بيرجعلي بالمودل بعد مخزن فيه الداتا الجاية من الجسون)
    // دي بتخلينا نخزن الداتا الجايه من ال api
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      // دول مميزين
      address: AddressModel.fromjson(json[ApiKey
          .address]), // بدل مباصي الجسون علطول لل address لا انا بباصي المودل متخزن فيه الداتا
      company: CompanyModel.fromjson(json[ApiKey.company]),
    );
  }

  // محتاج ارجع الداتا من شكل المودل بتاعي لشكل جسون علشان اعرف اخزنو عندي فالكاش ك سترج (بحولو من جسون لسترنج)
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.email: email,
      ApiKey.username: username,
      ApiKey.website: website,
      ApiKey.address: address,
      ApiKey.company: company,
    };
  }
}
