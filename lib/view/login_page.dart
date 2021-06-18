import 'package:flutter/material.dart';

import '../constants.dart';
import 'chat_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 80, 80, 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Kullanıcı Adı'),
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Şifre'),
                    onChanged: (value) {
                      _password = value;
                    },
                    obscureText: true,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                        child: Text('GİRİŞ'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent)),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            TextButton(
              child: Text(
                '@2021',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              onPressed: () {
                if (_password == Constants.passwordOne ||
                    _password == Constants.passwordTwo) {
                  //Clear Password before navigation
                  var passArgument = _password;
                  _password = '';
                  //Navigate to ChatPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        userId: passArgument,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
