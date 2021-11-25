class DepartmentModel {
  String departmentName;
  String departmentPath;
  String departmentCode;

  DepartmentModel(
      {required this.departmentName,
      required this.departmentPath,
      required this.departmentCode});

  static List<DepartmentModel> departmentList = [
    DepartmentModel(
        departmentName: 'Adli Bilişim Mühendisliği',
        departmentPath: 'http://abm.tf.firat.edu.tr/tr',
        departmentCode: 'abm.tf'),
    DepartmentModel(
        departmentName: 'Elektrik-Elektronik Mühendisliği',
        departmentPath: 'http://eem.tf.firat.edu.tr/tr',
        departmentCode: 'eem.tf'),
    DepartmentModel(
        departmentName: 'Enerji Sistemleri Mühendisliği',
        departmentPath: 'http://en.tf.firat.edu.tr/tr',
        departmentCode: 'en.tf'),
    DepartmentModel(
        departmentName: 'İnşaat Mühendisliği',
        departmentPath: 'http://insaat.tf.firat.edu.tr/tr',
        departmentCode: 'insaat.tf'),
    DepartmentModel(
        departmentName: 'Makine Mühendisliği',
        departmentPath: 'http://makina.tf.firat.edu.tr/tr',
        departmentCode: 'makina.tf'),
    DepartmentModel(
        departmentName: 'Mekatronik Mühendisliği',
        departmentPath: 'http://mekatronik.tf.firat.edu.tr/tr',
        departmentCode: 'mekatronik.tf'),
    DepartmentModel(
        departmentName: 'Metalurji ve Malzeme Mühendisliği',
        departmentPath: 'http://mm.tf.firat.edu.tr/tr',
        departmentCode: 'mm.tf'),
    DepartmentModel(
        departmentName: 'Otomotiv Mühendisliği',
        departmentPath: 'http://otomotiv.tf.firat.edu.tr/tr',
        departmentCode: 'otomotiv.tf'),
    DepartmentModel(
        departmentName: 'Yazılım Mühendisliği',
        departmentPath: 'http://yaz.tf.firat.edu.tr/tr',
        departmentCode: 'yaz.tf'),
  ];
}

List facultyDepartmentList = [
  {
    'facultyName': 'Teknoloji Fakültesi',
    'departments': [
      {
        'departmentName': 'Adli Bilişim Mühendisliği',
        'departmentPath': 'http://abm.tf.firat.edu.tr/tr',
        'departmentCode': 'abm.tf',
      },
      {
        'departmentName': 'Elektrik-Elektronik Mühendisliği',
        'departmentPath': 'http://eem.tf.firat.edu.tr/tr',
        'departmentCode': 'eem.tf',
      },
      {
        'departmentName': 'Enerji Sistemleri Mühendisliği',
        'departmentPath': 'http://en.tf.firat.edu.tr/tr',
        'departmentCode': 'en.tf',
      },
      {
        'departmentName': 'İnşaat Mühendisliği',
        'departmentPath': 'http://insaat.tf.firat.edu.tr/tr',
        'departmentCode': 'insaat.tf',
      },
      {
        'departmentName': 'Makine Mühendisliği',
        'departmentPath': 'http://mekatronik.tf.firat.edu.tr/tr',
        'departmentCode': 'makina.tf',
      },
      {
        'departmentName': 'Mekatronik Mühendisliği',
        'departmentPath': 'http://mekatronik.tf.firat.edu.tr/tr',
        'departmentCode': 'mekatronik.tf',
      },
      {
        'departmentName': 'Metalurji ve Malzeme Mühendisliği',
        'departmentPath': 'http://mm.tf.firat.edu.tr/tr',
        'departmentCode': 'mm.tf',
      },
      {
        'departmentName': 'Otomotiv Mühendisliği',
        'departmentPath': 'http://otomotiv.tf.firat.edu.tr/tr',
        'departmentCode': 'otomotiv.tf',
      },
      {
        'departmentName': 'Yazılım Mühendisliği',
        'departmentPath': 'http://yaz.tf.firat.edu.tr/tr',
        'departmentCode': 'yaz.tf',
      },
    ]
  },
  {
    'facultyName': 'Mühendislik Fakültesi',
    'departments': [
      {
        'departmentName': 'asd',
        'departmentPath': 'asd',
        'departmentCode': 'asd',
      },
    ]
  },
];
