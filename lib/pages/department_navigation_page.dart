import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/department_page.dart';

class DepartmentNavigationPage extends StatefulWidget {
  String? facultyName;
  String? departmentName;
  String? departmentCode;
  DepartmentNavigationPage({
    Key? key,
    this.departmentName,
    this.facultyName,
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
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                labelColor: ThemeService.instance.isDarkMode()
                    ? Colors.white
                    : Colors.black,
                tabs: [
                  Tab(
                    text: 'Duyurular',
                  ),
                  Tab(text: 'Haberler'),
                ],
              ),
              title: Text(
                widget.departmentName.toString(),
                style: TextStyle(
                    color: ThemeService.instance.isDarkMode()
                        ? Colors.white
                        : Colors.black),
              ),
              centerTitle: true,
              iconTheme: IconThemeData(
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.white
                      : Colors.black),
              flexibleSpace: Image.asset(
                ThemeService.instance.isDarkMode()
                    ? "assets/img/footer-bg.png"
                    : "assets/img/bg-pattern.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              backgroundColor: Colors.transparent,
            ),
            body: TabBarView(children: [
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
        ));
  }
}
