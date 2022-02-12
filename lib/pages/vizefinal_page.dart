import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/theme_service.dart';

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
        SizedBox(width: 10),
        Container(
          width: 80,
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Puan",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide())),
            controller: numberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || value == ' ' || value == '') {
                return 'Geçersiz';
              } else {
                double? num = double.tryParse(value);
                if (num == null)
                  return 'Geçersiz';
                else if (num < 0 || num > 150)
                  return 'Geçersiz';
                else
                  null;
              }
            },
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 70,
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "% etki",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide())),
            controller: percantageController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty || value == ' ' || value == '') {
                return 'Geçersiz';
              } else {
                double? num = double.tryParse(value);
                if (num == null)
                  return 'Geçersiz';
                else if (num < 0 || num > 100)
                  return 'Geçersiz';
                else
                  null;
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
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: ThemeService.instance.isDarkMode()
                ? Colors.white
                : Colors.black),
        centerTitle: true,
        title: Text(
          'Vize Final Hesapla',
          style: TextStyle(
              color: ThemeService.instance.isDarkMode()
                  ? Colors.white
                  : Colors.black87),
        ),
        flexibleSpace: Image.asset(
          ThemeService.instance.isDarkMode()
              ? "assets/img/footer-bg.png"
              : "assets/img/bg-pattern.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ThemeService.instance.isDarkMode()
          ? Color(0xFF292D32)
          : Colors.grey[300],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: ThemeService.instance.isDarkMode()
                      ? Colors.black.withOpacity(0.1)
                      : Colors.grey[400],
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("VİZE:"),
                        SizedBox(width: 10),
                        Container(
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Puan",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide())),
                            controller: vizePuan,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value == ' ' ||
                                  value == '') {
                                return 'Geçersiz';
                              } else {
                                double? num = double.tryParse(value);
                                if (num == null)
                                  return 'Geçersiz';
                                else if (num < 0 || num > 150)
                                  return 'Geçersiz';
                                else
                                  null;
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 70,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "% etki",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide())),
                            controller: vizeYuzde,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value == ' ' ||
                                  value == '') {
                                return 'Geçersiz';
                              } else {
                                double? num = double.tryParse(value);
                                if (num == null)
                                  return 'Geçersiz';
                                else if (num < 0 || num > 100)
                                  return 'Geçersiz';
                                else
                                  null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: ThemeService.instance.isDarkMode()
                      ? Colors.black.withOpacity(0.1)
                      : Colors.grey[400],
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("FİNAL:"),
                        SizedBox(width: 10),
                        Container(
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Puan",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide())),
                            controller: finalPuan,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value == ' ' ||
                                  value == '') {
                                return 'Geçersiz';
                              } else {
                                double? num = double.tryParse(value);
                                if (num == null)
                                  return 'Geçersiz';
                                else if (num < 0 || num > 150)
                                  return 'Geçersiz';
                                else
                                  null;
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 70,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "% etki",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide())),
                            controller: finalYuzde,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value == ' ' ||
                                  value == '') {
                                return 'Geçersiz';
                              } else {
                                double? num = double.tryParse(value);
                                if (num == null)
                                  return 'Geçersiz';
                                else if (num < 0 || num > 100)
                                  return 'Geçersiz';
                                else
                                  null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: odevler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: ThemeService.instance.isDarkMode()
                            ? Colors.black.withOpacity(0.1)
                            : Colors.grey[400],
                        title: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: odevler[index],
                        ),
                        trailing: SizedBox(
                          width: 20,
                          child: IconButton(
                              onPressed: () {
                                odevler.removeAt(index);
                                numberTECS.removeAt(index);
                                percantageTECs.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() => odevler.add(createProjeRow()));
                      },
                      child: customButton(
                        'Proje Ekle',
                        Icons.add_box,
                        Colors.blueAccent,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _onDone();
                      },
                      child: customButton(
                        'Hesapla',
                        Icons.calculate,
                        Colors.green,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _clearAll();
                      },
                      child: customButton(
                        'Temizle',
                        Icons.delete,
                        Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customButton(String title, IconData iconName, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        children: [
          Icon(
            iconName,
            color: color,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: color),
          ),
        ],
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        "S O N U Ç",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          ortalama,
                          style: TextStyle(fontWeight: FontWeight.w400),
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
                        child: Text(
                          "Kapat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        "H A T A",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          error,
                          style: TextStyle(
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
                        child: Text(
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
