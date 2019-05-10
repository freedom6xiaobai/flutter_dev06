import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'VoiceSetPage.dart';

//国际化
import 'locale_util.dart';
import 'translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('images/data.json');
}

Future<AssetImage> loadImage() async {
  return AssetImage("images/a_dot_burr.jpeg");
}

class Strings {
  static String welcomeMessage = "Welcome To Flutter";
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
//      supportedLocales: localeUtil.supportedLocales(),

      supportedLocales: [                                   //此处
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],

      home: Builder(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('资源配置 ${Strings.welcomeMessage}'),
                ),
                body: Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/kaliLinux02.jpg"),
                      Text(Translations.of(context).text("about_page_slogan")),
                      Text(Translations.of(context).text("voice_test_page"))
                    ],
                  )
                ),
                floatingActionButton: FloatingActionButton(
                    child: Text('点击'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VoiceSetPage(title: "Setting")));
                    }),
              )),
    );
  }
}
