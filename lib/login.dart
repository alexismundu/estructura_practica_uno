import 'package:flutter/material.dart';
import 'home/home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool conditions = false;

  Function _checkConditions() {
    return (value) {
      if (_usernameController.text.length > 0 &&
          _passwordController.text.length > 0) {
        setState(() {
          conditions = true;
        });
      } else {
        setState(() {
          conditions = false;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 50.0, bottom: 50.0),
                child: Image.asset('assets/images/cupping.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Nombre completo:',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 12)),
              ),
              TextField(
                controller: _usernameController,
                onChanged: _checkConditions(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Password:',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 12)),
              ),
              TextField(
                controller: _passwordController,
                onChanged: _checkConditions(),
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'AkzidenzGrotesk BQ Medium'),
                decoration: InputDecoration(
                  filled: false,
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [Colors.grey, Colors.blueGrey],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: GestureDetector(
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (conditions) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(
                            title: 'Inicio',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "¿Aún no tienes una cuenta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                child: Text(
                  "REGISTRATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
