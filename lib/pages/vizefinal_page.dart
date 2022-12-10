import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/ui_parameters.dart';
import '../core/view_model/widgets/top_background.dart';

class VizeFinalPage extends StatefulWidget {
  const VizeFinalPage({Key? key}) : super(key: key);

  @override
  _VizeFinalPageState createState() => _VizeFinalPageState();
}

class _VizeFinalPageState extends State<VizeFinalPage> {
  var numberTECS = <TextEditingController>[];
  var percantageTECs = <TextEditingController>[];
  var odevler = <Row>[];
  TextEditingController vizePuan = TextEditingController();
  TextEditingController vizeYuzde = TextEditingController();
  TextEditingController finalPuan = TextEditingController();
  TextEditingController finalYuzde = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Row createProjeRow() {
    var numberController = TextEditingController();
    var percantageController = TextEditingController();
    numberTECS.add(numberController);
    percantageTECs.add(percantageController);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Proje ${odevler.length + 1}'),
        const SizedBox(width: 10),
        SizedBox(
          width: 80,
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Puan",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide())),
            controller: numberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || value == ' ' || value == '') {
                return 'Geçersiz';
              } else {
                double? num = double.tryParse(value);
                if (num == null) {
                  return 'Geçersiz';
                } else if (num < 0 || num > 150) {
                  return 'Geçersiz';
                } else {
                  null;
                }
              }
            },
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 70,
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "% etki",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide())),
            controller: percantageController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || value == ' ' || value == '') {
                return 'Geçersiz';
              } else {
                double? num = double.tryParse(value);
                if (num == null) {
                  return 'Geçersiz';
                } else if (num < 0 || num > 100) {
                  return 'Geçersiz';
                } else {
                  null;
                }
              }
            },
          ),
        ),
      ],
    );
  }

  _onDone() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      double vizeDeger = double.parse(vizePuan.text);
      double finalDeger = double.parse(finalPuan.text);
      double vizeYuzdeDeger = double.parse(vizeYuzde.text);
      double finalYuzdeDeger = double.parse(finalYuzde.text);

      double odevYuzdeToplam = 0;
      double odevOrtalama = 0;
      double ortalama = 0;
      double yuzdetoplam = 0;

      if (odevler.length > 0) {
        for (int i = 0; i < odevler.length; i++) {
          var odevDeger = double.parse(numberTECS[i].text);
          var odevYuzde = double.parse(percantageTECs[i].text);
          odevYuzdeToplam = odevYuzdeToplam + odevYuzde;

          odevOrtalama = odevOrtalama + ((odevDeger * odevYuzde) / 100);
        }
        yuzdetoplam = vizeYuzdeDeger + finalYuzdeDeger + odevYuzdeToplam;
        if (yuzdetoplam != 100) {
          print("Yüzdeler 100e eşit değil");
          results(context, "", error: "Yüzdeler Toplamı 100'e Eşit Değil");
        } else {
          ortalama = ((vizeDeger * vizeYuzdeDeger) / 100) +
              ((finalDeger * finalYuzdeDeger) / 100) +
              odevOrtalama;
          print("Ortalama: $ortalama");
          results(
            context,
            "Ortalama: $ortalama",
          );
        }
        //Navigator.pop(context, entries);
      } else {
        yuzdetoplam = vizeYuzdeDeger + finalYuzdeDeger;
        if (yuzdetoplam != 100) {
          print("Yüzdeler 100e eşit değil");
          results(context, "", error: "Yüzdeler Toplamı 100'e Eşit Değil");
        } else {
          ortalama = ((vizeDeger * vizeYuzdeDeger) / 100) +
              ((finalDeger * finalYuzdeDeger) / 100);
          print("Ortalama: $ortalama");
          results(
            context,
            "Ortalama: $ortalama",
          );
        }
      }
    }
  }

  _clearAll() {
    setState(() {
      vizePuan.clear();
      vizeYuzde.clear();
      finalPuan.clear();
      finalYuzde.clear();
      odevler.clear();
      for (var i = 0; i < odevler.length; i++) {
        numberTECS[i].clear();
        percantageTECs[i].clear();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TopBackground(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: 20),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Vize Final Hesapla',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: customTileColor(context),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("VİZE:"),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 80,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Puan",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide())),
                                controller: vizePuan,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value == ' ' ||
                                      value == '') {
                                    return 'Geçersiz';
                                  } else {
                                    double? num = double.tryParse(value);
                                    if (num == null) {
                                      return 'Geçersiz';
                                    } else if (num < 0 || num > 150) {
                                      return 'Geçersiz';
                                    } else {
                                      null;
                                    }
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 70,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "% etki",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide())),
                                controller: vizeYuzde,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value == ' ' ||
                                      value == '') {
                                    return 'Geçersiz';
                                  } else {
                                    double? num = double.tryParse(value);
                                    if (num == null) {
                                      return 'Geçersiz';
                                    } else if (num < 0 || num > 100) {
                                      return 'Geçersiz';
                                    } else {
                                      null;
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: customTileColor(context),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("FİNAL:"),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 80,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Puan",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide())),
                                controller: finalPuan,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value == ' ' ||
                                      value == '') {
                                    return 'Geçersiz';
                                  } else {
                                    double? num = double.tryParse(value);
                                    if (num == null) {
                                      return 'Geçersiz';
                                    } else if (num < 0 || num > 150) {
                                      return 'Geçersiz';
                                    } else {
                                      null;
                                    }
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 70,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "% etki",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide())),
                                controller: finalYuzde,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value == ' ' ||
                                      value == '') {
                                    return 'Geçersiz';
                                  } else {
                                    double? num = double.tryParse(value);
                                    if (num == null) {
                                      return 'Geçersiz';
                                    } else if (num < 0 || num > 100) {
                                      return 'Geçersiz';
                                    } else {
                                      null;
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: odevler.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tileColor: customTileColor(context),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: odevler[index],
                            ),
                            trailing: InkWell(
                              onTap: (() {
                                odevler.removeAt(index);
                                numberTECS.removeAt(index);
                                percantageTECs.removeAt(index);
                                setState(() {});
                              }),
                              child: Container(
                                width: 40,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: customTileColor(context))),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButton(
                          'Proje Ekle',
                          Icons.add_box,
                          Colors.blueAccent,
                          () {
                            setState(() => odevler.add(createProjeRow()));
                          },
                        ),
                        const SizedBox(width: 10),
                        customButton(
                          'Hesapla',
                          Icons.calculate,
                          Colors.green,
                          () {
                            _onDone();
                          },
                        ),
                        const SizedBox(width: 10),
                        customButton('Temizle', Icons.delete, Colors.red, () {
                          _clearAll();
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(
      String title, IconData iconName, Color color, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          children: [
            Icon(
              iconName,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

void results(BuildContext context, String ortalama, {String error = ""}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return error == ""
            ? AlertDialog(
                backgroundColor: customTileColor(context),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: const EdgeInsets.only(top: 10.0),
                content: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      const Text(
                        "S O N U Ç",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: UIParameters.isDarkMode(context)
                            ? lightScaffolBackgroundColor
                            : darkScaffolBackgroundColor,
                        height: 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          ortalama,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                actions: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent,
                        ),
                        child: const Text(
                          "Kapat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: const EdgeInsets.only(top: 10.0),
                content: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      const Text(
                        "H A T A",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          error,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                actions: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent,
                        ),
                        child: const Text(
                          "Kapat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              );
      });
}
