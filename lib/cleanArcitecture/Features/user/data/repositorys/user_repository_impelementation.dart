// بتشك علي الانترنت علي حسب حالة الانترنت بحدد الداتا سورس انهي
// بستقبل مودل من الداتا سورس وبرجعو ك انتيتي جوا الدومين فالريبو انترفيس
import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/connection/network_info.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/params/params.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/datasources/user_local_data_source.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/datasources/user_remote_data_source.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/repositories/user_repository.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/errors/failure.dart';

class UserRepositoryImpelementation extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  UserRepositoryImpelementation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.getUser(params);
        localDataSource.cachUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheException catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
// هياخد منو الانتيتي المحتاجو
    }
  }
}
