import 'package:fbn_academy_mobile/models/User.dart';
import 'package:fbn_academy_mobile/repository/abs/UserRepo.dart';
import 'package:fbn_academy_mobile/repository/firebase/UserFireRepo.dart';
import 'package:fbn_academy_mobile/services/abs/UserSv.dart';

class UserService implements UserSv {
  final UserRepo _userRepo;
  UserService([UserRepo? userRepo]) : _userRepo = userRepo ?? UserFireRepo();

  @override
  Future<void> createUser(AUser aUser) async{
    await _userRepo.createUser(aUser);
  }

  @override
  Future<void> deleteUser(int id) async{
    await _userRepo.deleteUser(id);
  }

  @override
  Future<AUser?> getUserById(int id) async{
    return await _userRepo.getUserById(id);
  }

  @override
  Future<void> updateUser(AUser aUser) async{
    await _userRepo.updateUser(aUser);
  }
}
