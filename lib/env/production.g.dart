// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: assets/env/production.env
final class _Env {
  static const List<int> _enviedkeybaseUrl = <int>[
    1180851914,
    1347732133,
    1864184959,
    3888889135,
    1893991040,
    1378400162,
    1635601868,
    518845318,
    2471981380,
    2351363353,
    3616229706,
    2380546023,
    2698919332,
    3898435914,
    3200527390,
    1794819275,
    3655278737,
    1429774514,
    893543744,
    62244452,
    559882980,
    868790556,
    1110930552,
    247982894,
    1883136763,
    3804577191,
    2213209638,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    1180851874,
    1347732177,
    1864184843,
    3888889183,
    1893991155,
    1378400152,
    1635601891,
    518845353,
    2471981349,
    2351363433,
    3616229667,
    2380545993,
    2698919376,
    3898435896,
    3200527487,
    1794819237,
    3655278825,
    1429774547,
    893543715,
    62244368,
    559882893,
    868790650,
    1110930433,
    247982848,
    1883136664,
    3804577224,
    2213209675,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeyapiKey = <int>[
    3303958416,
    3780915681,
    2877042885,
    683404589,
    1945926381,
    2038955561,
    831139855,
    1100941732,
    2874226275,
  ];

  static const List<int> _envieddataapiKey = <int>[
    3303958499,
    3780915596,
    2877042859,
    683404617,
    1945926272,
    2038955591,
    831139938,
    1100941783,
    2874226183,
  ];

  static final String apiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    1984108755,
    850693070,
    787775425,
    4176236692,
    2155101170,
    1949326330,
    971508271,
    283693628,
    362752826,
    1816035023,
    274010738,
    335467078,
    2745013757,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    1984108704,
    850693034,
    787775407,
    4176236793,
    2155101057,
    1949326228,
    971508299,
    283693650,
    362752855,
    1816035004,
    274010646,
    335467051,
    2745013651,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );

  static const List<int> _enviedkeyencryptionKey = <int>[
    2880414956,
    2099512807,
    992344635,
    1914111347,
    157468390,
    3499357046,
    933605172,
    2763719247,
    1120979952,
    808834694,
  ];

  static const List<int> _envieddataencryptionKey = <int>[
    2880414856,
    2099512724,
    992344648,
    1914111255,
    157468299,
    3499356952,
    933605191,
    2763719211,
    1120979870,
    808834795,
  ];

  static final String encryptionKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataencryptionKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataencryptionKey[i] ^ _enviedkeyencryptionKey[i]),
  );

  static const List<int> _enviedkeyencryptionVector = <int>[
    2960318823,
    4114221614,
    2818797700,
    318880978,
    3818668463,
    3093522327,
    3945249688,
    3554139694,
    3889193918,
    491476551,
    2577221584,
    4107147890,
    1553260735,
  ];

  static const List<int> _envieddataencryptionVector = <int>[
    2960318740,
    4114221642,
    2818797815,
    318880956,
    3818668482,
    3093522425,
    3945249788,
    3554139715,
    3889193936,
    491476532,
    2577221556,
    4107147804,
    1553260754,
  ];

  static final String encryptionVector = String.fromCharCodes(
    List<int>.generate(
      _envieddataencryptionVector.length,
      (int i) => i,
      growable: false,
    ).map(
      (int i) => _envieddataencryptionVector[i] ^ _enviedkeyencryptionVector[i],
    ),
  );

  static const List<int> _enviedkeysocketUrl = <int>[
    3880864262,
    2167191578,
    946191814,
    2454385895,
    3659019564,
    1484185390,
    861803470,
    4212695035,
    3419896904,
    1724276052,
    2210471580,
    4137290656,
    2932228762,
  ];

  static const List<int> _envieddatasocketUrl = <int>[
    3880864354,
    2167191676,
    946191789,
    2454385805,
    3659019591,
    1484185418,
    861803432,
    4212694929,
    3419896867,
    1724276030,
    2210471672,
    4137290694,
    2932228848,
  ];

  static final String socketUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatasocketUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasocketUrl[i] ^ _enviedkeysocketUrl[i]),
  );
}
