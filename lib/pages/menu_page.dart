import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../core/data/scrape_data.dart';
import '../core/model/department_model.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/theme_data.dart';
import '../core/theme/ui_parameters.dart';
import '../core/view_model/custom_slide_route.dart';
import 'department_navigation_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void changeTheme() {
    Provider.of<CustomThemeDataModal>(context, listen: false).setThemeData();
  }

  @override
  Widget build(BuildContext context) {
    int selected = 0;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: customMenuBackgroundColor(context),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              color: customMenuBackgroundColor(context),
              child: Image(
                //width: 250,
                height: 150,
                image: UIParameters.isDarkMode(context)
                    ? const AssetImage(
                        'assets/img/uni_logo_white.png',
                      )
                    : const AssetImage(
                        'assets/img/uni_logo_black.png',
                      ),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                key: Key('builder ${selected.toString()}'), //attention
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: facultyDepartmentList.length,
                itemBuilder: (BuildContext context, int i) {
                  List<DepartmentModel> departments = [];

                  facultyDepartmentList[i]['departments']
                      .map((department) => departments.add(DepartmentModel(
                          departmentName: department['departmentName'],
                          departmentCode: department['departmentCode'],
                          departmentPath: department['departmentPath'],
                          departmentContact: department['departmentContact'])))
                      .toList();
                  return ListTileTheme(
                    tileColor: customTileColor(context).withOpacity(.8),
                    child: ExpansionTile(
                      childrenPadding: const EdgeInsets.all(8),
                      title: Text(
                        facultyDepartmentList[i]['facultyName'],
                        style: TextStyle(
                            fontSize: 13, color: menuTextColor(context)),
                      ),
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: departments.length,
                            itemBuilder: (BuildContext context, int j) {
                              return listTileDepartments(
                                facultyName: facultyDepartmentList[i]
                                    ['facultyName'],
                                department: departments[j],
                              );
                            }),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 17, right: 10, top: 5, bottom: 5),
                height: MediaQuery.of(context).size.height * 0.13,
                color: customMenuBackgroundColor(context),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'THEME',
                          style: TextStyle(color: menuTextColor(context)),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {
                              changeTheme();
                            },
                            child: Icon(
                              UIParameters.isDarkMode(context)
                                  ? Icons.wb_sunny
                                  : Icons.dark_mode,
                              size: 24,
                              color: menuTextColor(context),
                            )),
                        const Spacer(),
                        Text(
                          'CLOSE',
                          style: TextStyle(color: menuTextColor(context)),
                        ),
                        IconButton(
                            onPressed: () => ZoomDrawer.of(context)!.close(),
                            icon: Icon(
                              Icons.close,
                              color: menuTextColor(context),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Image(
                          height: 12,
                          image: AssetImage(
                            'assets/img/software_logo.png',
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'S M N C S O F T',
                          style:
                              TextStyle(fontSize: 11, color: Color(0xFF4db6d3)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listTileDepartments(
      {String? facultyName, DepartmentModel? department}) {
    return GestureDetector(
      child: Card(
        color: customTileColor(context).withOpacity(.5),
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            department!.departmentName,
            style: TextStyle(fontSize: 14, color: menuTextColor(context)),
          ),
        ),
      ),
      onTap: () {
        announcements.clear();
        //Navigator.pop(context);
        Navigator.push(
            context,
            CustomSlideRoute(
                page: DepartmentNavigationPage(
                    facultyName: facultyName,
                    departmentName: department.departmentName,
                    departmentCode: department.departmentCode,
                    departmentContact: department.departmentContact)));
      },
    );
  }
}
