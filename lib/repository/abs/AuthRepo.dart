
import '../../models/User.dart';

abstract class AuthRepo {

  Future<void> emailPasswordSignIn(String email, String password);

  Future<void> otpAuth(String smsCode);

  Future<void> verifyPhone({required String phone});

  Future<void>  logOut();

}
