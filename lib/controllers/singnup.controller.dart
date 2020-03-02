import 'package:masterclass_andre_balta/models/user.model.dart';
import 'package:masterclass_andre_balta/repositories/account.repository.dart';
import 'package:masterclass_andre_balta/view_model/signup.viewmodel.dart';

class SignupController {
  AccountRepository repository; //TODO: Isto precisa ser abstraído;

  SignupController() {
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }
}
