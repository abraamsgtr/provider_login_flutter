import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_login_app/models/cartModel.dart';
import 'package:provider_login_app/pages/login-route.dart';

import 'models/SignInDetailsModel.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInDetailsModel()),
        ChangeNotifierProvider(
          create: (_) => CartModel(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static const String _title = 'Provider Sign-In Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title, home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final logoutButon = Material(
      elevation: 5.0,
      color: Colors.blueAccent[400],
      child: FlatButton(
        onPressed: () {
          Provider.of<CartModel>(context, listen: false).removeCard();

          // Navigate back to first route when tapped.
          //Navigator.pop(context);
        },
        child: Text("Sign-Out",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1),
      ),
    );

    return Scaffold(
        appBar: AppBar(
            title: const Text('Provider Login Example'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginRoute()),
                  );
                },
              ),
            ]),
        body: Center(child: Consumer<CartModel>(
          builder: (context, cardModel, child) {
            String message = (cardModel.card == ""
                ? "Please sign-in"
                : "Your card is ${cardModel.card}");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4),
                logoutButon,
              ],
            );
          },
        )));
  }
}
