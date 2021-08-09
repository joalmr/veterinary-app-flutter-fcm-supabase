abstract class AuthInterface {
  Future<int> login(String email, String password);
  Future<int> logOut();
  Future<void> sendTokenFire(String fireToken);
  Future<int> forgotPassword(String email);
}
