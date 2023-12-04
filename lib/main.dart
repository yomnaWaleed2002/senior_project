import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:senior_project/pages/bottombar.dart';
import 'package:senior_project/pages/heart/heart.dart';
import 'package:senior_project/pages/login_screen.dart';
import 'package:senior_project/pages/oxgen/oxgen.dart';
//import 'package:senior_project/pages/oxgen/wave.dart';
import 'package:senior_project/theme/theme_constants.dart';
import 'package:senior_project/theme/theme_manager.dart';
import 'package:senior_project/pages/chat.dart';
import 'package:senior_project/utils/translation.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
     
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: LoginScreen(),
      translations: Translation(),
      locale: Locale('english'),
      fallbackLocale: Locale('english'),
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<Setting> {
  
  String _selectedlang = 'english';
  List<Widget> Options = [Setting(),chat(),heart(),oxgen()];
  Widget build(BuildContext context) {
  //TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Color(0xff466AFF),
                size: 57,
              ),
              title: Text(
                "Settings".tr,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 270, top: 30),
            child: Text(
              "theme".tr,
              style: TextStyle(
                  color: Color(0xFF459ED1),
                  fontSize: 24,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.bedtime,
                      size: 30,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    backgroundColor: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180),
                  child: Text(
                    "Dark Mode".tr,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Switch(
                   
                    value: _themeManager.themeMode == ThemeMode.dark,
                    onChanged: (newValue) {
                      _themeManager.toggleTheme(newValue);
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 270, top: 30),
            child: Text(
              "language".tr,
              style: TextStyle(
                  color: Color(0xFF459ED1),
                  fontSize: 24,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.language,
                      size: 30,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    backgroundColor: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  "select language".tr,
                  style: TextStyle(fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text('english '.tr),
                        value: 'english',
                      ),
                      DropdownMenuItem(
                        child: Text('arabic '.tr),
                        value: 'arabic',
                      )
                    ],
                    value: _selectedlang,
                    onChanged: (val) {
                      setState(() {
                        _selectedlang = val as String;
                      });
                      Get.updateLocale(Locale(_selectedlang));
                    },
                  ),
                )
              ],
            ),
          ),
          /* Padding(
              padding: const EdgeInsets.only(right: 190,top:30),
              child: GestureDetector(child:
              Text("About Developers>".tr, style: TextStyle(color:Colors.blue, fontSize: 23,
                    fontWeight: FontWeight.w300)),
         onTap:(){Navigator.of(context).push(MaterialPageRoute(
              builder: (context){
                return setting();
              }
          ));},
              ),
            ),*/
        ],
      ),
         
           
     
    );
  }

  
}
