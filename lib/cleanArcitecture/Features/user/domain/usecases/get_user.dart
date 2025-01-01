// اليوز كيسس بعملها trigger من البلوك
import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Core/params/params.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/entites/user_entitiy.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/Features/user/domain/repositories/user_repository.dart';
import 'package:happy_tech_mastering_api_with_flutter/cleanArcitecture/errors/failure.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, UserEntitiy>> call({required UserParams params}) {
    return repository.getUser(params: params);
  }
}
