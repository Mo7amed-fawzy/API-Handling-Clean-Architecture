import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/params/params.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final APIConsumer api;

  UserRemoteDataSource({required this.api});
// مكتبتش الانتيتي علشان انا هنا بتجيلي الداتا كلها بتيجي فمودل وابدا افلترها
  Future<UserModel> getUser(UserParams params) async {
    final response = await api.get('${EndPoint.user}/${params.id}');
    // كدا انا ماسك الداتا محتاج اخزنها فمودل وابعتها فالريبوزتوري

    return UserModel.fromJson(response);
    // هباصيلو الريسبونس بتاعي (كدا بصيتلو الجسون الهيبدا يخزن فيه الداتا )
  }
}
