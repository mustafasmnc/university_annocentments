import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/ui_parameters.dart';
import '../core/view_model/widgets/custom_button.dart';
import '../core/view_model/widgets/top_background.dart';

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
            backgroundColor: customTileColor(context),
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Ders Adı",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide())),
                        controller: lectureNameText,
                        validator: (value) {
                          if (value!.isEmpty || value == ' ' || value == '') {
                            return 'Geçersiz Değer';
                          } else {
                            null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Kredi",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide())),
                        controller: lectureCreditText,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty || value == ' ' || value == '') {
                            return 'Geçersiz Değer';
                          } else {
                            double? num = double.tryParse(value);
                            if (num == null) {
                              return 'Geçersiz Değer';
                            } else if (num < 1 || num > 20) {
                              return 'Geçersiz Değer';
                            } else {
                              null;
                            }
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Harf Notu:"),
                          StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return DropdownButton(
                              hint: gradeValueDropdown == null
                                  ? const Text('Harf Notu')
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
                        child: const Text(
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
                        child: const Text(
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
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            Text(
              lectureCreditText.text,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            Text(
              gradeValueDropdown,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          'Dönem Sonu Ortalaması',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lectureGradeCreditRow.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: customTileColor(context),
                          title: lectureGradeCreditRow[index],
                          trailing: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomButton(
                                  title: 'Düzenle',
                                  padding: 5,
                                  onTap: () {
                                    addUpdateLecture(false,
                                        name: allLectureName[index],
                                        grade: allGrades[index],
                                        credit: allCredits[index],
                                        index: index);
                                  },
                                ),
                                const SizedBox(width: 10),
                                CustomButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  padding: 5,
                                  onTap: () {
                                    lectureGradeCreditRow.removeAt(index);
                                    allLectureName.removeAt(index);
                                    allGrades.removeAt(index);
                                    allCredits.removeAt(index);
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customButton(
                        'Ders Ekle',
                        Icons.add,
                        Colors.blueAccent,
                        () {
                          addUpdateLecture(true);
                        },
                      ),
                      SizedBox(
                          width: lectureGradeCreditRow.length > 0 ? 20 : 0),
                      lectureGradeCreditRow.length > 0
                          ? customButton(
                              'Hesapla',
                              Icons.calculate,
                              Colors.green,
                              () {
                                hesapla();
                              },
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(
      String title, IconData iconName, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
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
          backgroundColor: customTileColor(context),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                const Text(
                  "S O N U Ç",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5.0),
                Divider(
                  color: UIParameters.isDarkMode(context)
                      ? lightScaffolBackgroundColor
                      : darkScaffolBackgroundColor,
                  height: 4.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Toplam Kredi:"),
                            const SizedBox(width: 10.0),
                            Text(
                              "$sumCredit",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            const Text("Genel Ortalama:"),
                            const SizedBox(width: 10.0),
                            Text(
                              allAverage.toStringAsFixed(4),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
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
