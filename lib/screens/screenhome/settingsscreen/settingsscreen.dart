import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:moneymanagement/funtions/catagories_fn_db/catogoriesfuntopn.dart';
import 'package:moneymanagement/funtions/catagories_fn_db/transation.dart';
import 'package:moneymanagement/screens/splash_scrren.dart';
import 'package:share_plus/share_plus.dart';

import '../../appbaraction/contactus/contactUs.dart';
import '../screen_home.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
                title: Text(
                  " App Reset",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              
                onTap: () => showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: const Text("Reset app"),
                          content: const Text(
                              'your app will be reset. all data will be lost.'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => homescreen()),
                                      (route) => false);
                                },
                                child: const Text('CANCEL',style: TextStyle(color: Colors.black))),
                            TextButton(
                                onPressed: () {
                                  TransationDb.instance.restartapptransaction();
                                  catagories_db.instance.restarcatocaryapp();
                                  //   <! second time-->
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) {
                                    return const SplashScreen();
                                  }), (route) => false);
                                 
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                           margin: EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
                                          content: Text(
                                    'app Reseted',
                                    style: TextStyle(color: Colors.white),
                                  )));
                                },
                                child: const Text('ACCEPT',style: TextStyle(color: Colors.black),))
                          ],
                        )))),
    
            ListTile(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (con) {
                return contactUs();
              })),
              title: const Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
           
            ),
           
           
           
            ListTile(
              onTap: () => Share.share('link not fount'),
              title: const Text(
                "Share App",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
             
            )
          ],
        ));
  }
}
