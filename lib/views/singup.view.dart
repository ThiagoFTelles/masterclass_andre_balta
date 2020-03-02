import 'package:flutter/material.dart';
import 'package:masterclass_andre_balta/controllers/singnup.controller.dart';
import 'package:masterclass_andre_balta/stores/app.store.dart';
import 'package:masterclass_andre_balta/view_model/signup.viewmodel.dart';
import 'package:masterclass_andre_balta/views/home.view.dart';
import 'package:provider/provider.dart';

class SingupView extends StatefulWidget {
  @override
  _SingupViewState createState() => _SingupViewState();
}

class _SingupViewState extends State<SingupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();

  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("Cadastre-se"),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha Inválida';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.password = val;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                model.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      )
                    : FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text("Cadastrar"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }

                          setState(() {});
                          _controller.create(model).then((data) {
                            setState(() {});
                            store.setUser(
                              data.name,
                              data.email,
                              data.picture,
                              data.token,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          });
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
