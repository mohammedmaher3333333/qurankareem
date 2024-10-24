// class QuranModel {
//   int code;
//   String status;
//   Data? data;
//
//   QuranModel({
//     this.code = 0,
//     this.status = '',
//     this.data,
//   });
//
//   factory QuranModel.fromJson(Map<String, dynamic> json) {
//     return QuranModel(
//       code: json['code'] ?? 0,
//       status: json['status'] ?? '',
//       data: json['data'] != null ? Data.fromJson(json['data']) : null,
//     );
//   }
// }


class Ayah {
  final int number;
  final String audio;
  final List<String> audioSecondary;
  final String text;

  Ayah({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['number'],
      audio: json['audio'],
      audioSecondary: List<String>.from(json['audioSecondary']),
      text: json['text'],
    );
  }
}

class Surah {
  final int number;
  final String name;
  final String englishName;
  final List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayahsFromJson = json['ayahs'] as List;
    List<Ayah> ayahsList = ayahsFromJson.map((i) => Ayah.fromJson(i)).toList();

    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      ayahs: ayahsList,
    );
  }
}

class QuranModel {
  final List<Surah> surahs;

  QuranModel({required this.surahs});

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    var surahsFromJson = json['data']['surahs'] as List;
    List<Surah> surahsList = surahsFromJson.map((i) => Surah.fromJson(i)).toList();

    return QuranModel(surahs: surahsList);
  }
}


class Data {
  List<Surah> surahs; // Non-nullable list
  Edition? edition;

  Data({
    List<Surah>? surahs,
    this.edition,
  }) : surahs = surahs ?? []; // Default to empty list if null

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
//
// class Surah {
//   int number;
//   String name;
//   String englishName;
//   String englishNameTranslation;
//   String revelationType;
//   List<Ayah> ayahs; // Making this non-nullable
//
//   Surah({
//     this.number = 0,
//     this.name = '',
//     this.englishName = '',
//     this.englishNameTranslation = '',
//     this.revelationType = '',
//     List<Ayah>? ayahs,
//   }) : ayahs = ayahs ?? []; // Default to empty list if null
//
//   factory Surah.fromJson(Map<String, dynamic> json) {
//     return Surah(
//       number: json['number'] ?? 0,
//       name: json['name'] ?? '',
//       englishName: json['englishName'] ?? '',
//       englishNameTranslation: json['englishNameTranslation'] ?? '',
//       revelationType: json['revelationType'] ?? '',
//       ayahs: json['ayahs'] != null
//           ? List<Ayah>.from(json['ayahs'].map((x) => Ayah.fromJson(x)))
//           : [],
//     );
//   }
// }
//
// class Ayah {
//   int number;
//   String audio;
//   List<String> audioSecondary; // Making this non-nullable
//   String text;
//   int numberInSurah;
//   int juz;
//   int manzil;
//   int page;
//   int ruku;
//   int hizbQuarter;
//   bool sajda;
//
//   Ayah({
//     this.number = 0,
//     this.audio = '',
//     List<String>? audioSecondary,
//     this.text = '',
//     this.numberInSurah = 0,
//     this.juz = 0,
//     this.manzil = 0,
//     this.page = 0,
//     this.ruku = 0,
//     this.hizbQuarter = 0,
//     this.sajda = false,
//   }) : audioSecondary = audioSecondary ?? []; // Default to empty list if null
//
//   factory Ayah.fromJson(Map<String, dynamic> json) {
//     return Ayah(
//       number: json['number'] ?? 0,
//       audio: json['audio'] ?? '',
//       audioSecondary: json['audioSecondary'] != null
//           ? List<String>.from(json['audioSecondary'])
//           : [],
//       text: json['text'] ?? '',
//       numberInSurah: json['numberInSurah'] ?? 0,
//       juz: json['juz'] ?? 0,
//       manzil: json['manzil'] ?? 0,
//       page: json['page'] ?? 0,
//       ruku: json['ruku'] ?? 0,
//       hizbQuarter: json['hizbQuarter'] ?? 0,
//       sajda: json['sajda'] ?? false,
//     );
//   }
// }
