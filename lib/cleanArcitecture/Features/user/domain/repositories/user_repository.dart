import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/params/params.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/errors/failure.dart';

abstract class UserRepository {
  // الريبو هتفلتر الداتا بتعتي وترجعلي بانتيتي لو تمت بنجاح ولو حصلت مشكلة
  // فاستعملت dartz علشان ارجع بكذا ريتيرن تايب
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
