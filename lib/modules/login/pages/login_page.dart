import 'package:flutter/material.dart';
import 'package:inventorycontrol/constants/border_radius.dart';
import 'package:inventorycontrol/constants/colors.dart';
import 'package:inventorycontrol/constants/font_size.dart';
import 'package:inventorycontrol/constants/height_sizes.dart';
import 'package:inventorycontrol/constants/spacing_sizes.dart';
import 'package:inventorycontrol/modules/login/components/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLogin = true;
  late String formTitle;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
        formTitle = 'Bem vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Crie sua conta agora';
      } else {
        formTitle = 'Crie sua conta';
        actionButton = 'Registre-se';
        toggleButton = 'Retornar para Login';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  register() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().register(email.text, password.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [CustomColors.customDarkBlue, CustomColors.customBlue],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: SpacingSizes.xxl,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(SpacingSizes.xl),
                    child: Text(
                      formTitle,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5,
                        color: CustomColors.customGreen,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SpacingSizes.g),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(HeightSizes.height_30),
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: CustomColors.customWhite,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o email corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(SpacingSizes.g),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(HeightSizes.height_30)),
                        ),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: CustomColors.customWhite,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe sua senha!';
                        } else if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: SpacingSizes.xl,
                        left: SpacingSizes.xl,
                        right: SpacingSizes.xl),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: CustomColors.customGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(BorderRadiusSizes.xg))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            register();
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (loading)
                            ? [
                                const Padding(
                                    padding: EdgeInsets.all(SpacingSizes.g),
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    ))
                              ]
                            : [
                                //const Icon(Icons.check),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(SpacingSizes.sm),
                                  child: Text(
                                    actionButton,
                                    style: const TextStyle(
                                      color: CustomColors.customDarkGray,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: CustomColors.customDarkGray,
                      textStyle: const TextStyle(
                        fontSize: FontSize.md,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
