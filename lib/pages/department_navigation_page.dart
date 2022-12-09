import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/app_colors.dart';
import 'package:webscraping/core/view_model/widgets/widgets.dart';
import 'package:webscraping/pages/department_page.dart';

import '../core/theme/ui_parameters.dart';
import '../core/view_model/widgets/top_background.dart';

class DepartmentNavigationPage extends StatefulWidget {
  final String? facultyName;
  final String? departmentName;
  final String? departmentCode;
  final String? departmentContact;
  const DepartmentNavigationPage({
    Key? key,
    this.departmentName,
    this.facultyName,
    this.departmentContact,
    required this.departmentCode,
  }) : super(key: key);

  @override
  State<DepartmentNavigationPage> createState() =>
      _DepartmentNavigationPageState();
}

class _DepartmentNavigationPageState extends State<DepartmentNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              TopBackground(
                height: 110,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          // onPressed: () => Navigator.pushAndRemoveUntil(
                          //     context,
                          //     CustomSlideRoute(
                          //         page: const DrawerPage(), x: -1, y: 0),
                          //     (Route<dynamic> route) => false),
                          icon: const Icon(Icons.arrow_back_ios_new)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Column(
                          children: [
                            Text(
                              widget.departmentName.toString(),
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: TabBar(
                                  indicator: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                      width: 2,
                                      color: UIParameters.isDarkMode(context)
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                                  ),
                                  labelColor: UIParameters.isDarkMode(context)
                                      ? Colors.white
                                      : Colors.black,
                                  tabs: const [
                                    Tab(
                                      text: 'Duyurular',
                                    ),
                                    Tab(text: 'Haberler'),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () => launchURL(widget.departmentContact!),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: customTileColor(context)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Center(
                    child: Text(
                      'İletişim',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  DepartmentPage(
                    depNewsAnno: 'duyurular',
                    facultyName: widget.facultyName,
                    departmentName: widget.departmentName,
                    departmentCode: widget.departmentCode,
                  ),
                  DepartmentPage(
                    depNewsAnno: 'haberler',
                    facultyName: widget.facultyName,
                    departmentName: widget.departmentName,
                    departmentCode: widget.departmentCode,
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
