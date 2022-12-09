class DepartmentModel {
  String departmentName;
  String departmentPath;
  String departmentCode;
  String? departmentContact;

  DepartmentModel({
    required this.departmentName,
    required this.departmentPath,
    required this.departmentCode,
    this.departmentContact,
  });

  // static List<DepartmentModel> departmentList = [
  //   DepartmentModel(
  //       departmentName: 'Adli Bilişim Mühendisliği',
  //       departmentPath: 'http://abm.tf.firat.edu.tr/tr',
  //       departmentCode: 'abm.tf'),
  //   DepartmentModel(
  //       departmentName: 'Elektrik-Elektronik Mühendisliği',
  //       departmentPath: 'http://eem.tf.firat.edu.tr/tr',
  //       departmentCode: 'eem.tf'),
  //   DepartmentModel(
  //       departmentName: 'Enerji Sistemleri Mühendisliği',
  //       departmentPath: 'http://en.tf.firat.edu.tr/tr',
  //       departmentCode: 'en.tf'),
  //   DepartmentModel(
  //       departmentName: 'İnşaat Mühendisliği',
  //       departmentPath: 'http://insaat.tf.firat.edu.tr/tr',
  //       departmentCode: 'insaat.tf'),
  //   DepartmentModel(
  //       departmentName: 'Makine Mühendisliği',
  //       departmentPath: 'http://makina.tf.firat.edu.tr/tr',
  //       departmentCode: 'makina.tf'),
  //   DepartmentModel(
  //       departmentName: 'Mekatronik Mühendisliği',
  //       departmentPath: 'http://mekatronik.tf.firat.edu.tr/tr',
  //       departmentCode: 'mekatronik.tf'),
  //   DepartmentModel(
  //       departmentName: 'Metalurji ve Malzeme Mühendisliği',
  //       departmentPath: 'http://mm.tf.firat.edu.tr/tr',
  //       departmentCode: 'mm.tf'),
  //   DepartmentModel(
  //       departmentName: 'Otomotiv Mühendisliği',
  //       departmentPath: 'http://otomotiv.tf.firat.edu.tr/tr',
  //       departmentCode: 'otomotiv.tf'),
  //   DepartmentModel(
  //       departmentName: 'Yazılım Mühendisliği',
  //       departmentPath: 'http://yaz.tf.firat.edu.tr/tr',
  //       departmentCode: 'yaz.tf'),
  // ];
}

List facultyDepartmentList = [
  {
    'facultyName': 'TEKNOLOJİ FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'TEKNOLOJİ FAKÜLTESİ',
        'departmentPath': 'http://tf.firat.edu.tr',
        'departmentCode': 'tf',
        'departmentContact': 'http://tf.firat.edu.tr/page/498'
      },
      {
        'departmentName': 'Adli Bilişim Mühendisliği',
        'departmentPath': 'http://abm.tf.firat.edu.tr/tr',
        'departmentCode': 'abm.tf',
        'departmentContact': 'http://abm.tf.firat.edu.tr/tr/page/3320'
      },
      {
        'departmentName': 'Elektrik-Elektronik Mühendisliği',
        'departmentPath': 'http://eem.tf.firat.edu.tr/tr',
        'departmentCode': 'eem.tf',
        'departmentContact': 'http://eem.tf.firat.edu.tr/page/2207'
      },
      {
        'departmentName': 'Enerji Sistemleri Mühendisliği',
        'departmentPath': 'http://en.tf.firat.edu.tr/tr',
        'departmentCode': 'en.tf',
        'departmentContact': 'http://en.tf.firat.edu.tr/page/4960'
      },
      {
        'departmentName': 'İnşaat Mühendisliği',
        'departmentPath': 'http://insaat.tf.firat.edu.tr/tr',
        'departmentCode': 'insaat.tf',
        'departmentContact': 'http://insaat.tf.firat.edu.tr/tr/page/3339'
      },
      {
        'departmentName': 'Makine Mühendisliği',
        'departmentPath': 'http://mekatronik.tf.firat.edu.tr/tr',
        'departmentCode': 'makina.tf',
        'departmentContact': 'http://makina.tf.firat.edu.tr/page/7231'
      },
      {
        'departmentName': 'Mekatronik Mühendisliği',
        'departmentPath': 'http://mekatronik.tf.firat.edu.tr/tr',
        'departmentCode': 'mekatronik.tf',
        'departmentContact': 'http://mekatronik.tf.firat.edu.tr/tr/page/3358'
      },
      {
        'departmentName': 'Metalurji ve Malzeme Mühendisliği',
        'departmentPath': 'http://mm.tf.firat.edu.tr/tr',
        'departmentCode': 'mm.tf',
        'departmentContact': 'http://mm.tf.firat.edu.tr/tr/page/3377'
      },
      {
        'departmentName': 'Otomotiv Mühendisliği',
        'departmentPath': 'http://otomotiv.tf.firat.edu.tr/tr',
        'departmentCode': 'otomotiv.tf',
        'departmentContact': 'http://otomotiv.tf.firat.edu.tr/tr/page/8559'
      },
      {
        'departmentName': 'Yazılım Mühendisliği',
        'departmentPath': 'http://yaz.tf.firat.edu.tr/tr',
        'departmentCode': 'yaz.tf',
        'departmentContact': 'http://yaz.tf.firat.edu.tr/tr/page/563'
      },
      {
        'departmentName': 'Yazılım Mühendisliği - UOLP',
        'departmentPath': 'http://yazilimuolp.tf.firat.edu.tr',
        'departmentCode': 'yazilimuolp.tf',
        'departmentContact': 'http://yazilimuolp.tf.firat.edu.tr/page/7342'
      },
    ]
  },
  {
    'facultyName': 'MÜHENDİSLİK FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'MÜHENDİSLİK FAKÜLTESİ',
        'departmentPath': 'mf.firat.edu.tr/tr',
        'departmentCode': 'mf',
        'departmentContact': 'http://mf.firat.edu.tr/page/409'
      },
      {
        'departmentName': 'Bilgisayar Mühendisliği',
        'departmentPath': 'http://bilgisayar.mf.firat.edu.tr/tr',
        'departmentCode': 'bilgisayar.mf',
        'departmentContact': 'http://bilgisayar.mf.firat.edu.tr/page/3244'
      },
      {
        'departmentName': 'Biyomühendislik',
        'departmentPath': 'http://bm.mf.firat.edu.tr/tr',
        'departmentCode': 'bm.mf',
        'departmentContact': 'http://bm.mf.firat.edu.tr/page/3263'
      },
      {
        'departmentName': 'Çevre Mühendisliği',
        'departmentPath': 'http://cevre.mf.firat.edu.tr/tr',
        'departmentCode': 'cevre.mf',
        'departmentContact': 'http://cevre.mf.firat.edu.tr/page/4865'
      },
      {
        'departmentName': 'Elektrik Elektronik Müh.',
        'departmentPath': 'http://eem.mf.firat.edu.tr/tr',
        'departmentCode': 'eem.mf',
        'departmentContact': 'http://eem.mf.firat.edu.tr/page/4884'
      },
      {
        'departmentName': 'İnşaat Mühendisliği',
        'departmentPath': 'http://insaat.mf.firat.edu.tr/tr',
        'departmentCode': 'insaat.mf',
        'departmentContact': 'http://insaat.mf.firat.edu.tr/page/3282'
      },
      {
        'departmentName': 'Jeoloji Mühendisliği',
        'departmentPath': 'http://jeoloji.mf.firat.edu.tr/tr',
        'departmentCode': 'jeoloji.mf',
        'departmentContact': 'http://jeoloji.mf.firat.edu.tr/page/4922'
      },
      {
        'departmentName': 'Kimya Mühendisliği',
        'departmentPath': 'http://kimya.mf.firat.edu.tr/tr',
        'departmentCode': 'kimya.mf',
        'departmentContact': 'http://kimya.mf.firat.edu.tr/page/3301'
      },
      {
        'departmentName': 'Makina Mühendisliği',
        'departmentPath': 'http://makina.mf.firat.edu.tr/tr',
        'departmentCode': 'makina.mf',
        'departmentContact': 'http://makina.mf.firat.edu.tr/page/3396'
      },
      {
        'departmentName': 'Mekatronik Mühendisliği',
        'departmentPath': 'http://mekatronik.mf.firat.edu.tr/tr',
        'departmentCode': 'mekatronik.mf',
        'departmentContact': 'http://mekatronik.mf.firat.edu.tr/page/4349'
      },
      {
        'departmentName': 'Metalurji ve Malzeme Müh.',
        'departmentPath': 'http://mm.mf.firat.edu.tr/tr',
        'departmentCode': 'mm.mf',
        'departmentContact': 'http://mm.mf.firat.edu.tr/page/4941'
      },
      {
        'departmentName': 'Yazılım Mühendisliği',
        'departmentPath': 'http://yaz.mf.firat.edu.tr/tr',
        'departmentCode': 'yaz.mf',
        'departmentContact': 'http://yaz.mf.firat.edu.tr/page/215'
      },
    ]
  },
  {
    'facultyName': 'EĞİTİM FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'EĞİTİM FAKÜLTESİ',
        'departmentPath': 'http://egitimf.firat.edu.tr/tr',
        'departmentCode': 'egitimf',
        'departmentContact': 'http://egitimf.firat.edu.tr/tr/page/661'
      },
      {
        'departmentName': 'Bilgisayar ve Öğretim Teknolojileri',
        'departmentPath': 'http://bote.egitimf.firat.edu.tr/tr',
        'departmentCode': 'bote.egitimf',
        'departmentContact': 'http://bote.egitimf.firat.edu.tr/tr/page/5762'
      },
      {
        'departmentName': 'Eğitim Bilimleri',
        'departmentPath': 'http://ebb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'ebb.egitimf',
        'departmentContact': 'http://ebb.egitimf.firat.edu.tr/tr/page/5781'
      },
      {
        'departmentName': 'Güzel Sanatlar Eğitimi - Resim-İş Öğr.',
        'departmentPath': 'http://gseb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'gseb.egitimf',
        'departmentContact': 'http://gseb.egitimf.firat.edu.tr/tr/page/5800'
      },
      {
        'departmentName': 'Matematik ve Fen Bilimleri Eğitimi',
        'departmentPath': 'http://mfbeb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'mfbeb.egitimf',
        'departmentContact': 'http://mfbeb.egitimf.firat.edu.tr/tr/page/5857'
      },
      {
        'departmentName': 'Temel Eğitim',
        'departmentPath': 'http://teb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'teb.egitimf',
        'departmentContact': 'http://teb.egitimf.firat.edu.tr/tr/page/6571'
      },
      {
        'departmentName': 'Türkçe ve Sosyal Bilimler Eğitimi',
        'departmentPath': 'http://tsbb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'tsbb.egitimf',
        'departmentContact': 'http://tsbb.egitimf.firat.edu.tr/tr/page/6609'
      },
      {
        'departmentName': 'Yabancı Diller Eğitimi',
        'departmentPath': 'http://ydeb.egitimf.firat.edu.tr/tr',
        'departmentCode': 'ydeb.egitimf',
        'departmentContact': 'http://ydeb.egitimf.firat.edu.tr/tr/page/6533'
      },
    ]
  },
  {
    'facultyName': 'FEN FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'FEN FAKÜLTESİ',
        'departmentPath': 'http://ff.firat.edu.tr/tr',
        'departmentCode': 'ff',
        'departmentContact': 'http://ff.firat.edu.tr/page/734'
      },
      {
        'departmentName': 'Biyoloji Prog & Mol. Biy. ve Gen. Prog',
        'departmentPath': 'http://biyoloji.ff.firat.edu.tr/tr',
        'departmentCode': 'biyoloji.ff',
        'departmentContact': 'http://biyoloji.ff.firat.edu.tr/tr/page/3187'
      },
      {
        'departmentName': 'Fizik',
        'departmentPath': 'http://fizik.ff.firat.edu.tr/tr',
        'departmentCode': 'fizik.ff',
        'departmentContact': 'http://fizik.ff.firat.edu.tr/page/3225'
      },
      {
        'departmentName': 'Kimya',
        'departmentPath': 'http://kimya.ff.firat.edu.tr/tr',
        'departmentCode': 'kimya.ff',
        'departmentContact': 'http://kimya.ff.firat.edu.tr/page/4522'
      },
      {
        'departmentName': 'Matematik',
        'departmentPath': 'http://matematik.ff.firat.edu.tr/tr',
        'departmentCode': 'matematik.ff',
        'departmentContact': 'http://matematik.ff.firat.edu.tr/page/4541'
      },
      {
        'departmentName': 'İstatistik',
        'departmentPath': 'http://istatistik.ff.firat.edu.tr/tr',
        'departmentCode': 'istatistik.ff',
        'departmentContact': 'http://istatistik.ff.firat.edu.tr/page/3206'
      },
    ]
  },
  {
    'facultyName': 'İNSANİ VE SOSYAL BİLİMLER',
    'departments': [
      {
        'departmentName': 'İNSANİ VE SOSYAL BİLİMLER',
        'departmentPath': 'http://isbf.firat.edu.tr/tr',
        'departmentCode': 'isbf',
        'departmentContact': 'http://isbf.firat.edu.tr/page/1085'
      },
      {
        'departmentName': 'Batı Dilleri ve Edebiyatları',
        'departmentPath': 'http://bdeb.isbf.firat.edu.tr/tr',
        'departmentCode': 'bdeb.isbf',
        'departmentContact': 'http://bdeb.isbf.firat.edu.tr/page/9016'
      },
      {
        'departmentName': 'Coğrafya',
        'departmentPath': 'http://cb.isbf.firat.edu.tr/tr',
        'departmentCode': 'cb.isbf',
        'departmentContact': 'http://cb.isbf.firat.edu.tr/page/3901'
      },
      {
        'departmentName': 'Çağdaş Türk Lehçeleri ve Edebiyatları',
        'departmentPath': 'http://ctleb.isbf.firat.edu.tr/tr',
        'departmentCode': 'ctleb.isbf',
        'departmentContact': 'http://ctleb.isbf.firat.edu.tr/page/7509'
      },
      {
        'departmentName': 'İngilizce Mütercim-Tercümanlık',
        'departmentPath': 'http://imt.isbf.firat.edu.tr/tr',
        'departmentCode': 'imt.isbf',
        'departmentContact': 'http://imt.isbf.firat.edu.tr/page/6325'
      },
      {
        'departmentName': 'Sosyoloji',
        'departmentPath': 'http://sosyoloji.isbf.firat.edu.tr/tr',
        'departmentCode': 'sosyoloji.isbf',
        'departmentContact': 'http://sosyoloji.isbf.firat.edu.tr/page/3920'
      },
      {
        'departmentName': 'Tarih',
        'departmentPath': 'http://tarih.isbf.firat.edu.tr/tr',
        'departmentCode': 'tarih.isbf',
        'departmentContact': 'http://tarih.isbf.firat.edu.tr/page/3939'
      },
      {
        'departmentName': 'Sanat Tarihi',
        'departmentPath': 'http://sanattarihi.isbf.firat.edu.tr/tr',
        'departmentCode': 'sanattarihi.isbf',
        'departmentContact': 'http://sanattarihi.isbf.firat.edu.tr/tr/page/9100'
      },
      {
        'departmentName': 'Türk Dili ve Edebiyatı',
        'departmentPath': 'http://turkdili.isbf.firat.edu.tr/tr',
        'departmentCode': 'turkdili.isbf',
        'departmentContact': 'http://turkdili.isbf.firat.edu.tr/page/3958'
      },
    ]
  },
  {
    'facultyName': 'İKTİSADİ VE İDARİ BİLİMLER',
    'departments': [
      {
        'departmentName': 'İKTİSADİ VE İDARİ BİLİMLER',
        'departmentPath': 'http://iibf.firat.edu.tr/tr',
        'departmentCode': 'iibf',
        'departmentContact': 'http://iibf.firat.edu.tr/page/837'
      },
      {
        'departmentName': 'İktisat',
        'departmentPath': 'http://iktisat.iibf.firat.edu.tr/tr',
        'departmentCode': 'ktisat.iibf',
        'departmentContact': 'http://iktisat.iibf.firat.edu.tr/page/4579'
      },
      {
        'departmentName': 'İşletme',
        'departmentPath': 'http://isletme.iibf.firat.edu.tr/tr',
        'departmentCode': 'isletme.iibf',
        'departmentContact': 'http://isletme.iibf.firat.edu.tr/page/4617'
      },
      {
        'departmentName': 'Siyaset Bilimi ve Kamu Yönetimi',
        'departmentPath': 'http://sbkyb.iibf.firat.edu.tr/tr',
        'departmentCode': 'sbkyb.iibf',
        'departmentContact': 'http://sbkyb.iibf.firat.edu.tr/page/4674'
      },
      {
        'departmentName': 'Sosyal Hizmet',
        'departmentPath': 'http://shb.iibf.firat.edu.tr/tr',
        'departmentCode': 'shb.iibf',
        'departmentContact': 'http://shb.iibf.firat.edu.tr/tr/page/4693'
      },
      {
        'departmentName': 'Çalışma Eko. ve Endüstri İl.',
        'departmentPath': 'http://ceeib.iibf.firat.edu.tr/tr',
        'departmentCode': 'ceeib.iibf',
        'departmentContact': 'http://ceeib.iibf.firat.edu.tr/page/4560'
      },
      {
        'departmentName': 'Maliye',
        'departmentPath': 'http://maliye.iibf.firat.edu.tr/tr',
        'departmentCode': 'maliye.iibf',
        'departmentContact': 'http://maliye.iibf.firat.edu.tr/page/4636'
      },
      {
        'departmentName': 'Sağlık Yönetimi',
        'departmentPath': 'http://sy.iibf.firat.edu.tr/tr',
        'departmentCode': 'sy.iibf',
        'departmentContact': 'http://sy.sosyal.firat.edu.tr/page/4655'
      },
      {
        'departmentName': 'Yönetim Bilişim Sistemleri',
        'departmentPath': 'http://ybs.iibf.firat.edu.tr/tr',
        'departmentCode': 'ybs.iibf',
        'departmentContact': 'http://ybs.iibf.firat.edu.tr/page/7106'
      },
    ]
  },
  {
    'facultyName': 'İLETİŞİM FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'İLETİŞİM FAKÜLTESİ',
        'departmentPath': 'http://iletisimf.firat.edu.tr/tr',
        'departmentCode': 'iletisimf',
        'departmentContact': 'http://iletisimf.firat.edu.tr/page/1070'
      },
      {
        'departmentName': 'Gazetecilik',
        'departmentPath': 'http://gazetecilik.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'gazetecilik.iletisimf',
        'departmentContact':
            'http://gazetecilik.iletisimf.firat.edu.tr/page/4712'
      },
      {
        'departmentName': 'Görsel İletişim Tasarımı',
        'departmentPath': 'http://gorseliletisim.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'gorseliletisim.iletisimf',
        'departmentContact':
            'http://gorseliletisim.iletisimf.firat.edu.tr/page/4731'
      },
      {
        'departmentName': 'Halkla İlişkiler ve Tanıtım',
        'departmentPath': 'http://hitb.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'hitb.iletisimf',
        'departmentContact': 'http://hitb.iletisimf.firat.edu.tr/page/4750'
      },
      {
        'departmentName': 'Radyo-Televizyon ve Sinema',
        'departmentPath': 'http://radyotv.iletisimf.firat.edu.tr/tr',
        'departmentCode': 'radyotv.iletisimf',
        'departmentContact': 'http://radyotv.iletisimf.firat.edu.tr/page/6552'
      },
    ]
  },
  {
    'facultyName': 'MİMARLIK FAKÜLTESİ',
    'departments': [
      {
        'departmentName': 'MİMARLIK FAKÜLTESİ',
        'departmentPath': 'http://mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'mimarlikf',
        'departmentContact': 'http://mimarlikf.firat.edu.tr/tr/page/1208'
      },
      {
        'departmentName': 'Mimarlık',
        'departmentPath': 'http://mimarlik.mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'mimarlik.mimarlikf',
        'departmentContact':
            'http://mimarlik.mimarlikf.firat.edu.tr/tr/page/3977'
      },
      {
        'departmentName': 'İç Mimarlık',
        'departmentPath': 'http://icmimarlik.mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'icmimarlik.mimarlikf',
        'departmentContact':
            'http://icmimarlik.mimarlikf.firat.edu.tr/page/4807'
      },
      {
        'departmentName': 'Şehir ve Bölge Planlama',
        'departmentPath': 'http://planlama.mimarlikf.firat.edu.tr/tr',
        'departmentCode': 'planlama.mimarlikf',
        'departmentContact': 'http://planlama.mimarlikf.firat.edu.tr/page/4845'
      },
    ]
  },
  {
    'facultyName': 'SAĞLIK BİLİMLERİ',
    'departments': [
      {
        'departmentName': 'SAĞLIK BİLİMLERİ',
        'departmentPath': 'http://saglikf.firat.edu.tr/tr',
        'departmentCode': 'saglikf',
        'departmentContact': 'http://saglikf.firat.edu.tr/page/1264'
      },
      {
        'departmentName': 'Hemşirelik',
        'departmentPath': 'http://hemsirelik.saglikf.firat.edu.tr/tr',
        'departmentCode': 'hemsirelik.saglikf',
        'departmentContact':
            'http://hemsirelik.saglikf.firat.edu.tr/tr/page/5743'
      },
      {
        'departmentName': 'Ebelik',
        'departmentPath': 'http://ebe.saglikf.firat.edu.tr/tr',
        'departmentCode': 'ebe.saglikf',
        'departmentContact': 'http://ebe.saglikf.firat.edu.tr/tr/page/4015'
      },
      {
        'departmentName': 'Beslenme ve Diyetetik',
        'departmentPath': 'http://bd.saglikf.firat.edu.tr/tr',
        'departmentCode': 'bd.saglikf',
        'departmentContact': 'http://bd.saglikf.firat.edu.tr/tr/page/3996'
      },
      {
        'departmentName': 'Fizyoterapi ve Rehabilitasyon',
        'departmentPath': 'http://ftr.saglikf.firat.edu.tr/tr',
        'departmentCode': 'ftr.saglikf',
        'departmentContact': 'http://ftr.saglikf.firat.edu.tr/tr/page/5724'
      },
    ]
  },
  {
    'facultyName': 'SPOR BİLİMLERİ',
    'departments': [
      {
        'departmentName': 'SPOR BİLİMLERİ',
        'departmentPath': 'http://sbf.firat.edu.tr/tr',
        'departmentCode': 'sbf',
        'departmentContact': 'http://sbf.firat.edu.tr/page/285'
      },
      {
        'departmentName': 'Spor Yöneticiliği',
        'departmentPath': 'http://sy.sbf.firat.edu.tr/tr',
        'departmentCode': 'sy.sbf',
        'departmentContact': 'http://sy.sbf.firat.edu.tr/tr/page/7087'
      },
      {
        'departmentName': 'Beden Eğitimi ve Spor Öğr.',
        'departmentPath': 'http://beso.sbf.firat.edu.tr/tr',
        'departmentCode': 'beso.sbf',
        'departmentContact': 'http://beso.sbf.firat.edu.tr/tr/page/7049'
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
        'departmentContact': 'http://disf.firat.edu.tr/page/2327'
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
        'departmentContact': 'http://ilahiyatf.firat.edu.tr/page/897'
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
        'departmentContact': 'http://suuf.firat.edu.tr/page/1329'
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
        'departmentContact': 'http://tip.firat.edu.tr/page/1344'
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
        'departmentContact': 'http://veterinerf.firat.edu.tr/page/1381'
      }
    ]
  },
  {
    'facultyName': 'YABANCI DİLLER YÜKSEKOKULU',
    'departments': [
      {
        'departmentName': 'Yabancı Diller Yüksekokulu',
        'departmentPath': 'http://yabancidiller.firat.edu.tr/tr',
        'departmentCode': 'yabancidiller',
        'departmentContact': 'http://yabancidiller.firat.edu.tr/tr/page/1632'
      }
    ]
  },
  {
    'facultyName': 'DEVLET KONSERVATUVARI',
    'departments': [
      {
        'departmentName': 'Devlet Konservatuvarı',
        'departmentPath': 'http://kyo.firat.edu.tr/tr',
        'departmentCode': 'kyo',
        'departmentContact': 'http://kyo.firat.edu.tr/tr/page/1396'
      }
    ]
  },
  {
    'facultyName': 'SİVİL HAVACILIK YÜKSEKOKULU',
    'departments': [
      {
        'departmentName': 'Sivil Havacılık Yüksekokulu',
        'departmentPath': 'http://sivilhavacilik.firat.edu.tr/tr',
        'departmentCode': 'sivilhavacilik',
        'departmentContact': 'http://sivilhavacilik.firat.edu.tr/tr/page/1617'
      },
      {
        'departmentName': 'Havacılık Elektrik ve Elektroniği',
        'departmentPath': 'http://heeb.sivilhavacilik.firat.edu.tr/tr',
        'departmentCode': 'heeb.sivilhavacilik',
        'departmentContact':
            'http://heeb.sivilhavacilik.firat.edu.tr/tr/page/4034'
      },
      {
        'departmentName': 'Uçak Bakım ve Onarım',
        'departmentPath': 'http://ubob.sivilhavacilik.firat.edu.tr/tr',
        'departmentCode': 'ubob.sivilhavacilik',
        'departmentContact':
            'http://ubob.sivilhavacilik.firat.edu.tr/tr/page/4072'
      },
      {
        'departmentName': 'Hava Trafik Kontrolü',
        'departmentPath': 'http://htkb.sivilhavacilik.firat.edu.tr/tr',
        'departmentCode': 'htkb.sivilhavacilik',
        'departmentContact':
            'http://htkb.sivilhavacilik.firat.edu.tr/tr/page/4053'
      }
    ]
  },
];
