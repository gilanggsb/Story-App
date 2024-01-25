import '../../../../common/common.dart';
import '../data.dart';

class AuthRepository {
  final ApiService _apiService = ApiService.instance;
  final StorageService _storageService = StorageService.instance;

  Future<bool> register(ReqRegisterModel reqRegisterModel) async {
    try {
      await _apiService.post(URL.registerUrl, reqRegisterModel.toJson());
      return true;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<UserModel?> login(ReqLoginModel reqLoginModel) async {
    try {
      final BaseResponse res = await _apiService
          .post(URL.loginUrl, reqLoginModel.toJson(), dataKey: 'loginResult');
      final UserModel user = UserModel.fromJson(res.data);
      await _storageService.saveUser(user);
      return user;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
