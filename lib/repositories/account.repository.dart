import 'package:masterclass_andre_balta/models/user.model.dart';
import 'package:masterclass_andre_balta/view_model/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    //Na vida real, aqui eu uso o package "Dio" para fazer requisições http.
    await Future.delayed(new Duration(milliseconds: 1500));
    return new UserModel(
      id: "1",
      name: "Thiago Telles",
      email: "asd@asd.com",
      picture: "https://picsum.photos/200/300",
      role: "student",
      token: "xpto",
    );
  }
}
