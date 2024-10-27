class QuranModel {
  List<Surah> surahs;

  QuranModel({required this.surahs});

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      surahs: Data.fromJson(json['data']).surahs,
    );
  }
}

class Surah {
  int number;
  String name;
  String englishName;
  String revelationType;
  List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType, // تضمين في المعاملات
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayahList = json['ayahs'] as List;
    List<Ayah> ayahs = ayahList.map((i) => Ayah.fromJson(i)).toList();
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'], // إضافة حقل englishName
      revelationType: json['revelationType'], // إضافة حقل revelationType
      ayahs: ayahs,
    );
  }
}

class Ayah {
  int number;
  int? numberInSurah;
  int? juz;
  int? page;
  int? hizbQuarter;

  String text;
  String? englishTranslation;
  String? audio;
  List<String>? audioSecondary;

  Ayah({
    required this.number,
    required this.juz,
    required this.page,
    required this.hizbQuarter,
    this.numberInSurah,
    required this.text,
    this.audio,
    this.audioSecondary,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      page: json['page'],
      hizbQuarter: json['hizbQuarter'],
      text: json['text'] ?? '', // استخدام سلسلة فارغة إذا لم يكن موجودًا
      audio: json['audio'], // إضافة حقل audio
      audioSecondary: List<String>.from(json['audioSecondary'] ?? []), // إضافة حقل audioSecondary
    );
  }
}

class Data {
  List<Surah> surahs;
  Edition? edition;

  Data({
    List<Surah>? surahs,
    this.edition,
  }) : surahs = surahs ?? [];

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      surahs: json['surahs'] != null
          ? List<Surah>.from(json['surahs'].map((x) => Surah.fromJson(x)))
          : [],
      edition: json['edition'] != null ? Edition.fromJson(json['edition']) : null,
    );
  }
}

class Edition {
  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  Edition({
    this.identifier = '',
    this.language = '',
    this.name = '',
    this.englishName = '',
    this.format = '',
    this.type = '',
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      identifier: json['identifier'] ?? '',
      language: json['language'] ?? '',
      name: json['name'] ?? '',
      englishName: json['englishName'] ?? '',
      format: json['format'] ?? '',
      type: json['type'] ?? '',
    );
  }
}


// class QuranModel {
//   List<Surah> surahs;
//
//   QuranModel({required this.surahs});
//
//   factory QuranModel.fromJson(Map<String, dynamic> json) {
//     var surahList = json['data']['surahs'] as List; // تأكد من الوصول إلى الحقل الصحيح
//     List<Surah> surahs = surahList.map((i) => Surah.fromJson(i)).toList();
//     return QuranModel(surahs: surahs);
//   }
// }
//
// class Surah {
//   int number;
//   String name;
//   List<Ayah> ayahs;
//
//   Surah({required this.number, required this.name, required this.ayahs});
//
//   factory Surah.fromJson(Map<String, dynamic> json) {
//     var ayahList = json['ayahs'] as List;
//     List<Ayah> ayahs = ayahList.map((i) => Ayah.fromJson(i)).toList();
//     return Surah(
//       number: json['number'],
//       name: json['name'],
//       ayahs: ayahs,
//     );
//   }
// }
//
//
// class Ayah {
//   int number;
//   String text;
//   String? englishTranslation;
//
//   Ayah({required this.number, required this.text});
//
//   factory Ayah.fromJson(Map<String, dynamic> json) {
//     return Ayah(
//       number: json['number'],
//       text: json['text'],
//     );
//   }
// }
//
// class Data {
//   List<Surah> surahs;
//   Edition? edition;
//
//   Data({
//     List<Surah>? surahs,
//     this.edition,
//   }) : surahs = surahs ?? [];
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       surahs: json['surahs'] != null
//           ? List<Surah>.from(json['surahs'].map((x) => Surah.fromJson(x)))
//           : [],
//       edition: json['edition'] != null ? Edition.fromJson(json['edition']) : null,
//     );
//   }
// }
//
//
// class Edition {
//   String identifier;
//   String language;
//   String name;
//   String englishName;
//   String format;
//   String type;
//
//   Edition({
//     this.identifier = '',
//     this.language = '',
//     this.name = '',
//     this.englishName = '',
//     this.format = '',
//     this.type = '',
//   });
//
//   factory Edition.fromJson(Map<String, dynamic> json) {
//     return Edition(
//       identifier: json['identifier'] ?? '',
//       language: json['language'] ?? '',
//       name: json['name'] ?? '',
//       englishName: json['englishName'] ?? '',
//       format: json['format'] ?? '',
//       type: json['type'] ?? '',
//     );
//   }
// }
