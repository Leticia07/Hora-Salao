import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hora_salao/controllers/person.dart';
import 'package:hora_salao/widgets/topBar.dart';

import '../globals.dart';

class EditPerfilPage extends StatefulWidget {
  @override
  _EditPerfilPageState createState() => _EditPerfilPageState();
}

class _EditPerfilPageState extends State<EditPerfilPage> {
  final _formKey = GlobalKey<FormState>();
  bool isClient;
  var info = {};
  Person personController = new Person();

  @override
  void initState() {
    setState(() {
      isClient = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopBar(
                forgetPassButton: false,
                text: "Editar Perfil",
              ),
              Container(
                color: mainBgColor,
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[200],
                                      child: Icon(
                                        FontAwesome5.user,
                                        color: mainTextColor,
                                        size: MediaQuery.of(context).size.width * 0.12,
                                      ),
                                      radius: MediaQuery.of(context).size.width * 0.2,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "E-mail",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "email@email.com",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.emailPessoa
                                      : tipoUsuario == "salao"
                                          ? salao.emailSalao
                                          : profissional.emailPessoa,
                                  enabled: false,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um email");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.emailPessoa = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.emailSalao = input;
                                      } else {
                                        profissional.emailPessoa = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Nome",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "Fulano da Silva",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.text,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.nomePessoa
                                      : tipoUsuario == "salao"
                                          ? salao.nomeSalao
                                          : profissional.nomePessoa,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um Nome");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.nomePessoa = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.nomeSalao = input;
                                      } else {
                                        profissional.nomePessoa = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: tipoUsuario != "salao" ? "CPF" : "CNPJ",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: tipoUsuario != "salao" ? "000.000.000-00" : "00.000.000.0000-00",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.cpfPessoa
                                      : tipoUsuario == "salao"
                                          ? salao.cnpjSalao
                                          : profissional.cpfPessoa,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um CPF");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.cpfPessoa = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.cnpjSalao = input;
                                      } else {
                                        profissional.cpfPessoa = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Telefone",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "(00) 90000-0000",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.phone,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.telefonePessoa
                                      : tipoUsuario == "salao"
                                          ? salao.telefoneSalao
                                          : profissional.telefonePessoa,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um Telefone");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.telefonePessoa = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.telefoneSalao = input;
                                      } else {
                                        profissional.telefonePessoa = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "CEP",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "00000-000",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.number,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.endereco.cep != null
                                          ? cliente.endereco.cep
                                          : ""
                                      : tipoUsuario == "salao"
                                          ? salao.endereco.cep
                                          : profissional.endereco.cep,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um CEP");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.endereco.cep = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.endereco.cep = input;
                                      } else {
                                        profissional.endereco.cep = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Rua",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "Rua dos bobos",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.endereco.rua
                                      : tipoUsuario == "salao"
                                          ? salao.endereco.rua
                                          : profissional.endereco.rua,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira uma rua");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.endereco.rua = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.endereco.rua = input;
                                      } else {
                                        profissional.endereco.rua = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Número",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "Número 0",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.endereco.numero.toString()
                                      : tipoUsuario == "salao"
                                          ? salao.endereco.numero.toString()
                                          : profissional.endereco.numero.toString(),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um Número");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.endereco.numero = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.endereco.numero = input;
                                      } else {
                                        profissional.endereco.numero = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Bairro",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "Taiçoca",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.text,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.endereco.bairro
                                      : tipoUsuario == "salao"
                                          ? salao.endereco.bairro
                                          : profissional.endereco.bairro,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um Bairro");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.endereco.bairro = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.endereco.bairro = input;
                                      } else {
                                        profissional.endereco.bairro = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Cidade",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "Tangamandápio",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.text,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.endereco.cidade
                                      : tipoUsuario == "salao"
                                          ? salao.endereco.cidade
                                          : profissional.endereco.cidade,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira uma cidade");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.endereco.cidade = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.endereco.cidade = input;
                                      } else {
                                        profissional.endereco.cidade = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Estado",
                                    labelStyle: TextStyle(
                                      color: mainTextColor,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: "Unido",
                                    hintStyle: TextStyle(
                                      color: mainTextColor,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainTextColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 14,
                                    letterSpacing: MediaQuery.of(context).size.width * 0.002,
                                    fontFamily: 'Roboto',
                                  ),
                                  keyboardType: TextInputType.text,
                                  initialValue: tipoUsuario == "cliente"
                                      ? cliente.endereco.estado
                                      : tipoUsuario == "salao"
                                          ? salao.endereco.estado
                                          : profissional.endereco.estado,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Fluttertoast.showToast(msg: "Insira um Estado");
                                      return "";
                                    }
                                  },
                                  onChanged: (value) => {
                                    _formKey.currentState.save(),
                                  },
                                  onSaved: (input) => {
                                    _formKey.currentState.setState(() {
                                      if (tipoUsuario == "cliente") {
                                        cliente.endereco.estado = input;
                                      } else if (tipoUsuario == "salao") {
                                        salao.endereco.estado = input;
                                      } else {
                                        profissional.endereco.estado = input;
                                      }
                                    })
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: FlatButton(
                                    padding: EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    onPressed: () async {
                                      _formKey.currentState.save();
                                      if (_formKey.currentState.validate()) {
                                        personController.update().then((value) {
                                          if (value) {
                                            Navigator.pushReplacementNamed(context, "/perfil");
                                            Fluttertoast.showToast(msg: "Usuário atualizado!");
                                          } else {
                                            Fluttertoast.showToast(msg: "Erro ao tentar atualizar usuário!");
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: mainTextColor,
                                        border: Border.all(
                                          color: mainTextColor,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 44,
                                      width: 142,
                                      child: Text(
                                        "Atualizar Perfil",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: mainBgColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
