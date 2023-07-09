import 'package:app_enrkipsi/cryptography.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:app_enrkipsi/main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  TextEditingController plain = TextEditingController();
  TextEditingController keyEncrypt = TextEditingController();
  TextEditingController resulChiper = TextEditingController();
  TextEditingController chipert = TextEditingController();
  TextEditingController keyDecrypt = TextEditingController();
  TextEditingController resultPlain = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 2,
              bottom: const TabBar(
                tabs: [
                  Tab(
                      text: 'Encrypt',
                      icon: Icon(
                        Icons.enhanced_encryption_outlined,
                      )),
                  Tab(
                      text: 'Decrypt',
                      icon: Icon(
                        Icons.no_encryption_gmailerrorred_outlined,
                      ))
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView(
                  children: [
                    Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                      child: Stack(
                        children: [
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: plain,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Input plaintext here...'),
                          ),Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: (){
                                  plain.clear();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Stack(
                        children: [TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: keyEncrypt,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input key here...'),
                        ),Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: (){
                                  keyEncrypt.clear();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          )],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              CryptographyClass cryptographyClass =
                                  CryptographyClass(
                                      plainteks: plain.text,
                                      key: keyEncrypt.text);
                              resulChiper = TextEditingController(
                                  text: cryptographyClass.getEncryptExecute());
                            });
                          },
                          child: const Text('Encrypt')),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Stack(children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: 13,
                                bottom: 10,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60),
                            child: Text(resulChiper.text)),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () async {
                                await FlutterClipboard.copy(resulChiper.text);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("berhasil disalin"),
                                ));
                              },
                              icon: Icon(
                                Icons.content_copy,
                                color: Colors.grey,
                              )),
                        )
                      ]),
                    )
                  ],
                ),
                ListView(
                  children: [
                    Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                      child: Stack(
                        children: [TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: chipert,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input chipertext here...'),
                        ),Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: (){
                                  chipert.clear();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          )],
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Stack(
                        children: [TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: keyDecrypt,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Input key here...'),
                        ),Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: (){
                                  keyDecrypt.clear();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          )],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              CryptographyClass cryptographyClass =
                                  CryptographyClass(
                                      chiperteks: chipert.text,
                                      key: keyDecrypt.text);
                              resultPlain = TextEditingController(
                                  text: cryptographyClass.getDecrytExecute());
                            });
                          },
                          child: const Text('Decrypt')),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Stack(children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: 13,
                                bottom: 10,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60),
                            child: Text(resultPlain.text)),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () async {
                                await FlutterClipboard.copy(resultPlain.text);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("berhasil disalin"),
                                ));
                              },
                              icon: Icon(
                                Icons.content_copy,
                                color: Colors.grey,
                              )),
                        )
                      ]),
                    )
                  ],
                ),
              ],
            )));
  }
}
