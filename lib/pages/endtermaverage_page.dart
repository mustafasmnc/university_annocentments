import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/theme_service.dart';

class EndTermAverage extends StatefulWidget {
  const EndTermAverage({Key? key}) : super(key: key);

  @override
  _EndTermAverageState createState() => _EndTermAverageState();
}

class _EndTermAverageState extends State<EndTermAverage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  var lectureNameText = TextEditingController();
  var lectureCreditText = TextEditingController();
  String gradeValueDropdown = 'AA';
  var allGrades = <String>[];
  var allCredits = <int>[];
  var allLectureName = <String>[];
  var lectureGradeCreditRow = <Row>[];

  addUpdateLecture(bool isAdding,
      {String name = "", int credit = 0, String grade = "", int index = 0}) {
    if (isAdding) {
      lectureNameText.clear();
      lectureCreditText.clear();
    } else {
      gradeValueDropdown = grade;
      lectureNameText.text = name;
      lectureCreditText.text = credit.toString();
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  height: 250,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Ders Adı",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide())),
                        controller: lectureNameText,
                        validator: (value) {
                          if (value!.isEmpty || value == ' ' || value == '') {
                            return 'Geçersiz Değer';
                          } else {
                            null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Kredi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide())),
                        controller: lectureCreditText,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty || value == ' ' || value == '') {
                            return 'Geçersiz Değer';
                          } else {
                            double? num = double.tryParse(value);
                            if (num == null)
                              return 'Geçersiz Değer';
                            else if (num < 1 || num > 20)
                              return 'Geçersiz Değer';
                            else
                              null;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Harf Notu:",
                            style: TextStyle(color: Colors.black54),
                          ),
                          StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return DropdownButton(
                              hint: gradeValueDropdown == null
                                  ? Text('Harf Notu')
                                  : Text(gradeValueDropdown.toString()),
                              items: [
                                'AA',
                                'BA',
                                'BB',
                                'CB',
                                'CC',
                                'DC',
                                'DD',
                                'FF'
                              ].map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              value: isAdding ? gradeValueDropdown : grade,
                              onChanged: (val) {
                                setState(() {
                                  if (isAdding == false) {
                                    grade = val.toString();
                                  }
                                  gradeValueDropdown = val.toString();
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        child: Text(
                          "İPTAL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          if (isAdding) {
                            lectureGradeCreditRow.add(createHarfNotu());
                          } else {
                            allLectureName.removeAt(index);
                            allGrades.removeAt(index);
                            allCredits.removeAt(index);
                            lectureGradeCreditRow
                                .remove(lectureGradeCreditRow[index]);
                            lectureGradeCreditRow.add(createHarfNotu());
                          }
                          setState(() {});
                          Navigator.of(context).pop();
                          lectureNameText.clear();
                        }
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
                          "KAYDET",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  Row createHarfNotu() {
    allGrades.add(gradeValueDropdown);
    allLectureName.add(lectureNameText.text);
    allCredits.add(int.parse(lectureCreditText.text));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            lectureNameText.text,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(width: 20),
        Row(
          children: [
            Text(
              lectureCreditText.text,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 10),
            Text(
              gradeValueDropdown,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
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
          'Dönem Sonu Ortalaması',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: lectureGradeCreditRow.length,
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
                      title: Wrap(children: [lectureGradeCreditRow[index]]),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                lectureGradeCreditRow.removeAt(index);
                                allLectureName.removeAt(index);
                                allGrades.removeAt(index);
                                allCredits.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {
                                addUpdateLecture(false,
                                    name: allLectureName[index],
                                    grade: allGrades[index],
                                    credit: allCredits[index],
                                    index: index);
                              },
                              icon: Icon(
                                Icons.update,
                                color: Colors.blueAccent,
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      addUpdateLecture(true);
                    },
                    child: customButton(
                      'Ders Ekle',
                      Icons.add,
                      Colors.blueAccent,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      hesapla();
                    },
                    child: customButton(
                      'Hesapla',
                      Icons.calculate,
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ],
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

  hesapla() {
    int creditsSum = 0;
    double allTotal = 0;
    double gradeCoefficent = 0;
    for (int i = 0; i < allGrades.length; i++) {
      print("ders: ${allLectureName[i]} notu: ${allGrades[i]}");
      creditsSum = creditsSum + allCredits[i];
      switch (allGrades[i]) {
        case 'AA':
          gradeCoefficent = 4.0;
          break;
        case 'BA':
          gradeCoefficent = 3.5;
          break;
        case 'BB':
          gradeCoefficent = 3.0;
          break;
        case 'CB':
          gradeCoefficent = 2.5;
          break;
        case 'CC':
          gradeCoefficent = 2.0;
          break;
        case 'DC':
          gradeCoefficent = 1.5;
          break;
        case 'DD':
          gradeCoefficent = 1.0;
          break;
        case 'FF':
          gradeCoefficent = 0.0;
          break;
      }
      allTotal = allTotal + (gradeCoefficent * allCredits[i]);
    }
    double result = allTotal / creditsSum;
    print("Toplam Kredi: $creditsSum");
    print("Donem Ortalama Notu: $result");
    results(context, result, creditsSum);
  }
}

void results(BuildContext context, double allAverage, int sumCredit) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Text(
                  "S O N U Ç",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5.0),
                Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Toplam Kredi:"),
                            SizedBox(width: 10.0),
                            Text(
                              "$sumCredit",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text("Genel Ortalama:"),
                            SizedBox(width: 10.0),
                            Text(
                              "$allAverage",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
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
