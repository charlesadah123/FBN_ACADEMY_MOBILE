abstract class AuthSv{

  Future<void> otpAuth(String smsCode);

  Future<void>  verifyPhone(String phone);

  Future<void> emailPasswordSignIn(String email, String password);

  Future logOut();

}