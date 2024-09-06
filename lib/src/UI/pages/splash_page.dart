import 'package:catbreeds/src/UI/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _showGreeting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
                child: Text("Catbreeds",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center)),
            Center(
                child: Container(
              height: 150,
              child: Image.asset('assets/cat.png'),
            )),
          ],
        ),
      ),
    );
  }

  _showGreeting() {
    Future.delayed(const Duration(seconds: 1), () {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button to close the dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Bienvenido',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            content: const SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Está siendo redirigido al home',
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  //Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                  /* pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())); */
                },
              ),
            ],
          );
        },
      );
    });
  }
}
