import 'package:flutter/material.dart';
import 'home_screen.dart';

Map<String, String>? users = {
  'test': 'test',
};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  TextEditingController? _registerUsernameController;
  TextEditingController? _registerPasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _registerUsernameController = TextEditingController();
    _registerPasswordController = TextEditingController();
  }

  void _registerUser() {
    if (_registerUsernameController!.text.length < 4 ||
        _registerPasswordController!.text.length < 8) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hata'),
          content: const Text(
              'Kullanıcı adı en az 4 karakter, şifre en az 8 karakter içermelidir.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tamam'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        users![_registerUsernameController!.text] =
            _registerPasswordController!.text;
      });
      Navigator.pop(context);
    }
  }

  void _showRegistrationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kayıt Ol'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _registerUsernameController,
              cursorColor: const Color(0XFFCF112B),
              decoration: const InputDecoration(
                labelText: 'Kullanıcı adı',
                labelStyle: TextStyle(color: Color(0xFF666666)),
                hintText: 'Kullanıcı adınızı giriniz',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFFCF112B)),
                ),
              ),
            ),
            TextFormField(
              controller: _registerPasswordController,
              cursorColor: const Color(0XFFCF112B),
              decoration: const InputDecoration(
                labelText: 'Şifre',
                labelStyle: TextStyle(color: Color(0xFF666666)),
                hintText: 'Şifrenizi giriniz',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFFCF112B)),
                ),
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('İptal', style: TextStyle(color: Color(0XFFCF112B))),
          ),
          TextButton(
            onPressed: _registerUser,
            child: const Text(
              'Kayıt Ol',
              style: TextStyle(color: Color(0XFFCF112B)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Los Pollos Hermanos",
              style: TextStyle(
                fontFamily: 'Burrito',
                fontSize: 44.0,
              )),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/login.png',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController!,
                cursorColor: const Color(0XFFCF112B),
                decoration: const InputDecoration(
                  labelText: 'Kullanıcı adı',
                  labelStyle: TextStyle(color: Color(0xFF666666)),
                  hintText: 'Kullanıcı adınızı giriniz',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(120))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(120))),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController!,
                cursorColor: const Color(0XFFCF112B),
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Color(0xFF666666)),
                  hintText: 'Şifrenizi giriniz',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(120))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(120))),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (users![_usernameController!.text] ==
                      _passwordController!.text) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Hata'),
                        content: const Text(
                            'Lütfen geçerli kullanıcı adı veya şifre giriniz'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'TAMAM',
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Giriş Yap'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showRegistrationDialog,
                style: ElevatedButton.styleFrom(),
                child: const Text('Kayıt Ol'),
              ),
              const SizedBox(height: 35),
              Image.asset(
                'assets/images/logo2.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
