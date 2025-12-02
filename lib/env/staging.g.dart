// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staging.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: assets/env/staging.env
final class _Env {
  static const List<int> _enviedkeybaseUrl = <int>[
    1191220044,
    3274219621,
    155894210,
    328450139,
    2696355426,
    2268282351,
    4192311268,
    2654261551,
    568041913,
    188673744,
    3918158955,
    3821695240,
    3433954085,
    903840560,
    3255872506,
    2444879658,
    3263897189,
    2084467235,
    844748695,
    1907212840,
    836305776,
    1969773939,
    3665067674,
    1635369850,
    1741491060,
    2316507511,
    1866618129,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    1191220004,
    3274219537,
    155894198,
    328450091,
    2696355345,
    2268282325,
    4192311243,
    2654261504,
    568041944,
    188673696,
    3918158850,
    3821695270,
    3433954129,
    903840578,
    3255872411,
    2444879684,
    3263897117,
    2084467266,
    844748788,
    1907212892,
    836305689,
    1969773845,
    3665067747,
    1635369812,
    1741490967,
    2316507416,
    1866618236,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeyapiKey = <int>[
    3328140726,
    2764306161,
    352366733,
    223300747,
    758041572,
    1778987570,
    4047345343,
    68036032,
    131436850,
  ];

  static const List<int> _envieddataapiKey = <int>[
    3328140741,
    2764306076,
    352366819,
    223300847,
    758041481,
    1778987612,
    4047345362,
    68036019,
    131436886,
  ];

  static final String apiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]),
  );

  static const List<int> _enviedkeysecretKey = <int>[
    2502239175,
    2428400621,
    415284461,
    2461386246,
    3924012359,
    1191892774,
    2081789483,
    3420150096,
    827854784,
    2826956663,
    4050553833,
    977451713,
    2123670130,
  ];

  static const List<int> _envieddatasecretKey = <int>[
    2502239156,
    2428400521,
    415284355,
    2461386347,
    3924012340,
    1191892808,
    2081789519,
    3420150078,
    827854765,
    2826956548,
    4050553741,
    977451692,
    2123670044,
  ];

  static final String secretKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatasecretKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasecretKey[i] ^ _enviedkeysecretKey[i]),
  );

  static const List<int> _enviedkeyencryptionKey = <int>[
    3238493146,
    2660205213,
    1488373270,
    1139061111,
    1139934830,
    4236255519,
    2400878400,
    4083698839,
    3848949681,
    2301223296,
  ];

  static const List<int> _envieddataencryptionKey = <int>[
    3238493118,
    2660205294,
    1488373349,
    1139061011,
    1139934723,
    4236255601,
    2400878387,
    4083698931,
    3848949727,
    2301223405,
  ];

  static final String encryptionKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataencryptionKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataencryptionKey[i] ^ _enviedkeyencryptionKey[i]),
  );

  static const List<int> _enviedkeyencryptionVector = <int>[
    1429057412,
    3641508956,
    4162493639,
    1852153247,
    2314697553,
    1271611863,
    3237272567,
    3712408520,
    1330994660,
    2396353967,
    908457830,
    175715782,
    3258005314,
  ];

  static const List<int> _envieddataencryptionVector = <int>[
    1429057527,
    3641508920,
    4162493620,
    1852153329,
    2314697532,
    1271611833,
    3237272467,
    3712408485,
    1330994570,
    2396354012,
    908457730,
    175715752,
    3258005295,
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
    2360808924,
    3410209203,
    831724356,
    4007072799,
    3140372182,
    1928731551,
    2048726023,
    2018016154,
    2508770588,
    2176549895,
    2983929068,
    2891292447,
    3258095039,
  ];

  static const List<int> _envieddatasocketUrl = <int>[
    2360808888,
    3410209237,
    831724335,
    4007072885,
    3140372157,
    1928731643,
    2048726113,
    2018016240,
    2508770679,
    2176549997,
    2983928968,
    2891292537,
    3258095061,
  ];

  static final String socketUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatasocketUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatasocketUrl[i] ^ _enviedkeysocketUrl[i]),
  );
}
