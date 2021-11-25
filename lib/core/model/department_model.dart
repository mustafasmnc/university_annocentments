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
    'facultyName': 'TEKNOLOJİ FAKÜLTESİ',
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
    'facultyName': 'MÜHENDİSLİK FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Bilgisayar Mühendisliği',
        'departmentPath': 'http://bilgisayar.mf.firat.edu.tr/tr',
        'departmentCode': 'bilgisayar.mf',
      },
      {
        'departmentName': 'Biyomühendislik',
        'departmentPath': 'http://bm.mf.firat.edu.tr/tr',
        'departmentCode': 'bm.mf',
      },
      {
        'departmentName': 'Çevre Mühendisliği',
        'departmentPath': 'http://cevre.mf.firat.edu.tr/tr',
        'departmentCode': 'cevre.mf',
      },
      {
        'departmentName': 'Elektrik Elektronik Müh.',
        'departmentPath': 'http://eem.mf.firat.edu.tr/tr',
        'departmentCode': 'eem.mf',
      },
      {
        'departmentName': 'İnşaat Mühendisliği',
        'departmentPath': 'http://insaat.mf.firat.edu.tr/tr',
        'departmentCode': 'insaat.mf',
      },
      {
        'departmentName': 'Jeoloji Mühendisliği',
        'departmentPath': 'http://jeoloji.mf.firat.edu.tr/tr',
        'departmentCode': 'jeoloji.mf',
      },
      {
        'departmentName': 'Kimya Mühendisliği',
        'departmentPath': 'http://kimya.mf.firat.edu.tr/tr',
        'departmentCode': 'kimya.mf',
      },
      {
        'departmentName': 'Makina Mühendisliği',
        'departmentPath': 'http://makina.mf.firat.edu.tr/tr',
        'departmentCode': 'makina.mf',
      },
      {
        'departmentName': 'Mekatronik Mühendisliği',
        'departmentPath': 'http://mekatronik.mf.firat.edu.tr/tr',
        'departmentCode': 'mekatronik.mf',
      },
      {
        'departmentName': 'Metalurji ve Malzeme Müh.',
        'departmentPath': 'http://mm.mf.firat.edu.tr/tr',
        'departmentCode': 'mm.mf',
      },
      {
        'departmentName': 'Yazılım Mühendisliği',
        'departmentPath': 'http://yaz.mf.firat.edu.tr/tr',
        'departmentCode': 'yaz.mf',
      },
    ]
  },
  {
    'facultyName': 'EĞİTİM FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Bilgisayar ve Öğretim Teknolojileri',
        'departmentPath': 'http://bote.egitimf.firat.edu.tr/tr',
        'departmentCode': 'bote.egitimf',
      },
      {
        'departmentName': 'Eğitim Bilimleri',
        'departmentPath': 'http://ebb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'ebb.egitimf',
      },
      {
        'departmentName': 'Güzel Sanatlar Eğitimi - Resim-İş Öğr.',
        'departmentPath': 'http://gseb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'gseb.egitimf',
      },
      {
        'departmentName': 'Matematik ve Fen Bilimleri Eğitimi',
        'departmentPath': 'http://mfbeb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'mfbeb.egitimf',
      },
      {
        'departmentName': 'Temel Eğitim',
        'departmentPath': 'http://teb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'teb.egitimf',
      },
      {
        'departmentName': 'Türkçe ve Sosyal Bilimler Eğitimi',
        'departmentPath': 'http://tsbb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'tsbb.egitimf',
      },
      {
        'departmentName': 'Yabancı Diller Eğitimi',
        'departmentPath': 'http://ydeb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'ydeb.egitimf',
      },
    ]
  },
  {
    'facultyName': 'FEN FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Biyoloji Prog & Mol. Biy. ve Gen. Prog',
        'departmentPath': 'http://biyoloji.ff.firat.edu.tr/tr',
        'departmentCode': 'biyoloji.ff',
      },
      {
        'departmentName': 'Fizik',
        'departmentPath': 'http://fizik.ff.firat.edu.tr/tr',
        'departmentCode': 'fizik.ff',
      },
      {
        'departmentName': 'Kimya',
        'departmentPath': 'http://kimya.ff.firat.edu.tr/tr',
        'departmentCode': 'kimya.ff',
      },
      {
        'departmentName': 'Matematik',
        'departmentPath': 'http://matematik.ff.firat.edu.tr/tr',
        'departmentCode': 'matematik.ff',
      },
      {
        'departmentName': 'İstatistik',
        'departmentPath': 'http://istatistik.ff.firat.edu.tr/tr',
        'departmentCode': 'istatistik.ff',
      },
    ]
  },
  {
    'facultyName': 'İNSANİ VE SOSYAL BİLİMLER',
    'departments': [
      {
        'departmentName': 'Coğrafya',
        'departmentPath': 'http://cb.isbf.firat.edu.tr/tr',
        'departmentCode': 'cb.isbf',
      },
      {
        'departmentName': 'Çağdaş Türk Lehçeleri ve Edebiyatları',
        'departmentPath': 'http://ctleb.isbf.firat.edu.tr/tr',
        'departmentCode': 'ctleb.isbf',
      },
      {
        'departmentName': 'İngilizce Mütercim-Tercümanlık',
        'departmentPath': 'http://imt.isbf.firat.edu.tr/tr',
        'departmentCode': 'imt.isbf',
      },
      {
        'departmentName': 'Sosyoloji',
        'departmentPath': 'http://sosyoloji.isbf.firat.edu.tr/tr',
        'departmentCode': 'sosyoloji.isbf',
      },
      {
        'departmentName': 'Tarih',
        'departmentPath': 'http://tarih.isbf.firat.edu.tr/tr',
        'departmentCode': 'tarih.isbf',
      },
      {
        'departmentName': 'Sanat Tarihi',
        'departmentPath': 'http://sanattarihi.isbf.firat.edu.tr/tr',
        'departmentCode': 'sanattarihi.isbf',
      },
      {
        'departmentName': 'Türk Dili ve Edebiyatı',
        'departmentPath': 'http://turkdili.isbf.firat.edu.tr/tr',
        'departmentCode': 'turkdili.isbf',
      },
    ]
  },
  {
    'facultyName': 'İKTİSADİ VE İDARİ BİLİMLER',
    'departments': [
      {
        'departmentName': 'İktisat',
        'departmentPath': 'http://iktisat.iibf.firat.edu.tr/tr',
        'departmentCode': 'ktisat.iibf',
      },
      {
        'departmentName': 'İşletme',
        'departmentPath': 'http://isletme.iibf.firat.edu.tr/tr',
        'departmentCode': 'isletme.iibf',
      },
      {
        'departmentName': 'Siyaset Bilimi ve Kamu Yönetimi',
        'departmentPath': 'http://sbkyb.iibf.firat.edu.tr/tr',
        'departmentCode': 'sbkyb.iibf',
      },
      {
        'departmentName': 'Sosyal Hizmet',
        'departmentPath': 'http://shb.iibf.firat.edu.tr/tr',
        'departmentCode': 'shb.iibf',
      },
      {
        'departmentName': 'Çalışma Eko. ve Endüstri İl.',
        'departmentPath': 'http://ceeib.iibf.firat.edu.tr/tr',
        'departmentCode': 'ceeib.iibf',
      },
      {
        'departmentName': 'Maliye',
        'departmentPath': 'http://maliye.iibf.firat.edu.tr/tr',
        'departmentCode': 'maliye.iibf',
      },
      {
        'departmentName': 'Sağlık Yönetimi',
        'departmentPath': 'http://sy.iibf.firat.edu.tr/tr',
        'departmentCode': 'sy.iibf',
      },
      {
        'departmentName': 'Yönetim Bilişim Sistemleri',
        'departmentPath': 'http://ybs.iibf.firat.edu.tr/tr',
        'departmentCode': 'ybs.iibf',
      },
    ]
  },
  {
    'facultyName': 'İLETİŞİM FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Gazetecilik',
        'departmentPath': 'http://gazetecilik.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'gazetecilik.iletisimf',
      },
      {
        'departmentName': 'Görsel İletişim Tasarımı',
        'departmentPath': 'http://gorseliletisim.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'gorseliletisim.iletisimf',
      },
      {
        'departmentName': 'Halkla İlişkiler ve Tanıtım',
        'departmentPath': 'http://hitb.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'hitb.iletisimf',
      },
      {
        'departmentName': 'Radyo-Televizyon ve Sinema',
        'departmentPath': 'http://radyotv.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'radyotv.iletisimf',
      },
    ]
  },
  {
    'facultyName': 'MİMARLIK FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Mimarlık',
        'departmentPath': 'http://mimarlik.mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'mimarlik.mimarlikf',
      },
      {
        'departmentName': 'İç Mimarlık',
        'departmentPath': 'http://icmimarlik.mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'icmimarlik.mimarlikf',
      },
      {
        'departmentName': 'Şehir ve Bölge Planlama',
        'departmentPath': 'http://planlama.mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'planlama.mimarlikf',
      },
    ]
  },
  {
    'facultyName': 'SAĞLIK BİLİMLERİ',
    'departments': [
      {
        'departmentName': 'Hemşirelik',
        'departmentPath': 'http://hemsirelik.saglikf.firat.edu.tr/tr',
        'departmentCode': 'hemsirelik.saglikf',
      },
      {
        'departmentName': 'Ebelik',
        'departmentPath': 'http://ebe.saglikf.firat.edu.tr/tr',
        'departmentCode': 'ebe.saglikf',
      },
      {
        'departmentName': 'Beslenme ve Diyetetik',
        'departmentPath': 'http://bd.saglikf.firat.edu.tr/tr',
        'departmentCode': 'bd.saglikf',
      },
      {
        'departmentName': 'Fizyoterapi ve Rehabilitasyon',
        'departmentPath': 'http://ftr.saglikf.firat.edu.tr/tr',
        'departmentCode': 'ftr.saglikf',
      },
    ]
  },
  {
    'facultyName': 'SPOR BİLİMLERİ',
    'departments': [
      {
        'departmentName': 'Spor Yöneticiliği',
        'departmentPath': 'http://sy.sbf.firat.edu.tr/tr',
        'departmentCode': 'sy.sbf',
      },
      {
        'departmentName': 'Beden Eğitimi ve Spor Öğr.',
        'departmentPath': 'http://beso.sbf.firat.edu.tr/tr',
        'departmentCode': 'beso.sbf',
      },
    ]
  },
  {
    'facultyName': 'Diş Hekimliği',
    'departments': [
      {
        'departmentName': 'Diş Hekimliği',
        'departmentPath': 'http://disf.firat.edu.tr/tr',
        'departmentCode': 'disf',
      }
    ]
  },
  {
    'facultyName': 'İLAHİYAT FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'İlahiyat',
        'departmentPath': 'http://ilahiyatf.firat.edu.tr/tr',
        'departmentCode': 'ilahiyatf',
      }
    ]
  },
  {
    'facultyName': 'SU ÜRÜNLERİ',
    'departments': [
      {
        'departmentName': 'Su Ürünleri',
        'departmentPath': 'http://suuf.firat.edu.tr/tr',
        'departmentCode': 'suuf',
      }
    ]
  },
  {
    'facultyName': 'TIP FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Tıp Fakültesi',
        'departmentPath': 'http://tip.firat.edu.tr/tr',
        'departmentCode': 'tip',
      }
    ]
  },
  {
    'facultyName': 'VETERİNER FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'Veteriner Fakültesi',
        'departmentPath': 'http://veterinerf.firat.edu.tr/tr',
        'departmentCode': 'veterinerf',
      }
    ]
  },
];
