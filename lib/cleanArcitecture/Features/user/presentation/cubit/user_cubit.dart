import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/connection/network_info.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/dio_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/api/end_point.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/databases/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/params/params.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/datasources/user_local_data_source.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/datasources/user_remote_data_source.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/data/repositorys/user_repository_impelementation.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/usecases/get_user.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/presentation/cubit/user_state.dart';
// استخدم alias عند الاستيراد:

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
// الكود الهيمنج الuse case
  eitherFailureOrUser(int id) async {
    emit(GetUserLoading());

    final failureOrUser = await GetUser(
      repository: UserRepositoryImpelementation(
          remoteDataSource: UserRemoteDataSource(api: DioConsumer(dio: Dio())),
          localDataSource: UserLocalDataSource(cache: CacheHelperCA()),
          networkInfo: NetworkInfoImpl(DataConnectionChecker())),
    ).call(
      params: UserParams(
        id: id.toString(),
      ),
    );
    printHere('API Response: $failureOrUser');

    failureOrUser.fold(
      (failure) => emit(GetUserFailure(errMessage: failure.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
