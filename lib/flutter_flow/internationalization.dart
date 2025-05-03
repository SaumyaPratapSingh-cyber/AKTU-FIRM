import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // MainWelcome
  {
    'gy6pjjja': {
      'en': 'Welcome to AKTU-FIRM',
      'hi': 'AKTU-FIRM में आपका स्वागत है',
    },
    '5spi63q2': {
      'en': 'Empowering Education Through Innovation',
      'hi': 'नवाचार के माध्यम से शिक्षा को सशक्त बनाना',
    },
  },
  // loginpage
  {
    '5a65t952': {
      'en': 'Sign In/Create Account',
      'hi': 'साइन इन करें/खाता बनाएं',
    },
    'b75061xm': {
      'en': 'Use the account below to sign in.',
      'hi': 'साइन इन करने के लिए नीचे दिए गए खाते का उपयोग करें।',
    },
    'nr5dn3od': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    'rz8ycjry': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    'lnn9mjjd': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
    },
    'afez330p': {
      'en': 'OR',
      'hi': 'या',
    },
    'e565qqlq': {
      'en': 'Create Acoount',
      'hi': 'खाता बनाएं',
    },
    'rvtdhzqr': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // selectyear
  {
    'tsogqke3': {
      'en': 'AKTU-FIRM',
      'hi': 'AKTU-फर्म',
    },
    'ogbehysw': {
      'en': 'Access All Your Study Material',
      'hi': 'अपनी सभी अध्ययन सामग्री तक पहुँचें',
    },
    'qf6dt16m': {
      'en': 'Choose Year',
      'hi': 'वर्ष चुनें',
    },
    'pou1rydl': {
      'en': '1st Year',
      'hi': '1 ला वर्ष',
    },
    'h6hgdkgv': {
      'en': 'CLICK HERE',
      'hi': 'यहाँ क्लिक करें',
    },
    'q8y6z34z': {
      'en': '2nd Year',
      'hi': 'दूसरा वर्ष',
    },
    'g6r95yfa': {
      'en': 'CLICK HERE',
      'hi': 'यहाँ क्लिक करें',
    },
    'ijburx5r': {
      'en': '3rd Year',
      'hi': 'तीसरा वर्ष',
    },
    'e2rppak1': {
      'en': 'CLICK HERE',
      'hi': 'यहाँ क्लिक करें',
    },
    'mpp879oz': {
      'en': 'LOGOUT',
      'hi': 'लॉग आउट',
    },
    'inn3dg1o': {
      'en': 'App Admin',
      'hi': 'ऐप एडमिन',
    },
    'kuhchzvg': {
      'en': 'My profile',
      'hi': 'मेरी प्रोफाइल',
    },
    'gfasx01f': {
      'en': 'Ask to AKTU FIRM  AI',
      'hi': 'AKTU FIRM AI से पूछें',
    },
    'uk1222sm': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // FirstYear
  {
    'te7lopxg': {
      'en': 'Select your subject',
      'hi': 'अपना विषय चुनें',
    },
    'yt12c366': {
      'en': '2nd semester',
      'hi': 'दूसरा सेमेस्टर',
    },
    '1l6w83wt': {
      'en': 'Categories',
      'hi': 'श्रेणियाँ',
    },
    'wza3mxsr': {
      'en': ' mathematics 2',
      'hi': 'गणित 2',
    },
    'r9p01skf': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'gy339v0g': {
      'en': 'Chemistry',
      'hi': 'रसायन विज्ञान',
    },
    'mdcvw5mr': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'g4xkik4d': {
      'en': 'PPS',
      'hi': 'पी पी एस',
    },
    'exnztpy9': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'zmifqi7s': {
      'en': 'EVS',
      'hi': 'ईवीएस',
    },
    '3dfvnpuz': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    '2g3lkrzj': {
      'en': 'Electrical',
      'hi': 'विद्युतीय',
    },
    '8eaqd9xu': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    '1p5t07f7': {
      'en': '1st semester',
      'hi': 'प्रथम सेमेस्टर',
    },
    '2qsag4wa': {
      'en': 'Categories',
      'hi': 'श्रेणियाँ',
    },
    'm4wblw46': {
      'en': 'Physics',
      'hi': 'भौतिक विज्ञान',
    },
    '92d6pas0': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'mv88cj5p': {
      'en': 'Electronics',
      'hi': 'इलेक्ट्रानिक्स',
    },
    'idx6o6kt': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    '41k72emb': {
      'en': 'Soft Skills',
      'hi': 'सॉफ्ट स्किल्स',
    },
    'tgnj7u84': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'qwgtlccv': {
      'en': 'mechnaical\n',
      'hi': 'यांत्रिक',
    },
    '7srgd23r': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'do3kirg1': {
      'en': 'Mathematics',
      'hi': 'अंक शास्त्र',
    },
    'pcjfn3d7': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    '4618db3j': {
      'en': 'AKTU-FIRM ( 1st Year)',
      'hi': 'AKTU-FIRM (प्रथम वर्ष)',
    },
    '00shut8k': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // SecondYear
  {
    'miqnq2z1': {
      'en': 'Select the subject',
      'hi': 'विषय का चयन करें',
    },
    'euzef6ag': {
      'en': '3rd semester',
      'hi': 'तीसरा सेमेस्टर',
    },
    'xrb6noty': {
      'en': 'Categories',
      'hi': 'श्रेणियाँ',
    },
    'i95vlxwf': {
      'en': 'COA',
      'hi': 'सीओए',
    },
    'xr8psu06': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'kl3dtcc7': {
      'en': 'DS',
      'hi': 'डी एस',
    },
    'q4944fob': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'rdrtoek7': {
      'en': 'TC',
      'hi': 'टीसी',
    },
    '8c141l7g': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'zw3y6z2y': {
      'en': 'DLD',
      'hi': 'डीएलडी',
    },
    'dvgvdzul': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'dc14knqu': {
      'en': 'Python',
      'hi': 'पायथन',
    },
    '2piz6kn2': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'q269vtp6': {
      'en': 'Discrete',
      'hi': 'अलग',
    },
    'vlo3u401': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'pcz2ldv8': {
      'en': '4th semester',
      'hi': 'चौथा सेमेस्टर',
    },
    'w3onjonp': {
      'en': 'Categories',
      'hi': 'श्रेणियाँ',
    },
    '8q955it9': {
      'en': 'maths 4',
      'hi': 'गणित 4',
    },
    '6gjfvryu': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'wz19i74v': {
      'en': 'UHV',
      'hi': 'यूएचवी',
    },
    'vw9c1ngg': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'ihqmp4oq': {
      'en': 'OS',
      'hi': 'ओएस',
    },
    'srlxdntk': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    '571o65w9': {
      'en': 'TAFL',
      'hi': 'टीएएफएल',
    },
    'a7ypaktj': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'fb5j9lah': {
      'en': 'java',
      'hi': 'जावा',
    },
    'ut315oh6': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    '3ybz4m8s': {
      'en': 'Cyber \nSecurity ',
      'hi': 'साइबर सुरक्षा',
    },
    'qkqu3il9': {
      'en': 'Click here',
      'hi': 'यहाँ क्लिक करें',
    },
    'gj6r8tly': {
      'en': 'AKTU-FIRM(2nd Year)',
      'hi': 'AKTU-FIRM(द्वितीय वर्ष)',
    },
    'ps3smcne': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // COA
  {
    '6o0336p2': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'qlbb3o06': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '8hm8zqjb': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '0zpagtyy': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'acnikpa5': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'lb0jigm5': {
      'en': 'AKTU-FIRM( COA )',
      'hi': 'AKTU-फ़र्म (सीओए)',
    },
    'r4gig0hm': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // thirdyear
  {
    '4cz5uwox': {
      'en': 'Page Title',
      'hi': 'पृष्ठ शीर्षक',
    },
    '2sbswub0': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // DLD
  {
    'qehxn1nc': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'm1u1btbv': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '2bpkd8kr': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'n2drgux4': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'g5k65owb': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'ztimix53': {
      'en': 'AKTU-FIRM( DLD )',
      'hi': 'AKTU-फ़र्म (डीएलडी)',
    },
    'p92x0fpx': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // Discrete
  {
    'm2djm8hz': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    '0le63nwy': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'o3to6fc7': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '6mrcax3p': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    '4nmwjhps': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'pcfy3i3c': {
      'en': 'AKTU-FIRM( DSTL)',
      'hi': 'AKTU-फर्म (DSTL)',
    },
    'epj0p70j': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // DS
  {
    '0sp1sab8': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'ja3n6xuw': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'pbtto5bw': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'c0k5kz21': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'b6rqv3bz': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '3szx7fqa': {
      'en': 'AKTU-FIRM( DS )',
      'hi': 'AKTU-फ़र्म( डीएस )',
    },
    'crkqjqww': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // TC
  {
    'ksyoqduz': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'w4vg7hjs': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '1v08hn3a': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'hlls0o1t': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    '2zrpehnx': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'vdotk59d': {
      'en': 'AKTU-FIRM( TC )',
      'hi': 'AKTU-फ़र्म( टीसी )',
    },
    'vum2af9i': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // Python
  {
    'ktuq37nk': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'jpzinvqz': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'ishz5m26': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'vnyivays': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'gjaxlfpv': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '8wm1uqx7': {
      'en': 'AKTU-FIRM( PYTHON )',
      'hi': 'AKTU-फ़र्म (पायथन)',
    },
    'rfx1w332': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // Maths-IIIMathIV
  {
    'aoptzizb': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    '3ownuek6': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'phpv73et': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'kb9fh971': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'si5me051': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'tpuqixlk': {
      'en': 'AKTU-FIRM( MATHS-IV )',
      'hi': 'AKTU-फर्म (गणित-IV)',
    },
    'arjm3w0s': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // tafl
  {
    '4051rg5x': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'lae8321g': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'a7qw4tuc': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '6wxxqgmx': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'cckolv5h': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'k2aicxpt': {
      'en': 'AKTU-FIRM( TAFL)',
      'hi': 'AKTU-फ़र्म (TAFL)',
    },
    'f95r5a96': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // JAVA
  {
    'zc28ifm3': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    '49pbytg6': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '89qqkzgf': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '7qrag3vz': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '4thcjo33': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    '5g8vbbxd': {
      'en': 'AKTU-FIRM( JAVA )',
      'hi': 'AKTU-फ़र्म (जावा)',
    },
    'tbj0etlw': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // Cyber
  {
    'wmswahmw': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'ci8hmygf': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'tly5reiz': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '31qsgv5e': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'yvug5xsx': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '85afetp0': {
      'en': 'AKTU-FIRM( CYBER SECURITY)',
      'hi': 'AKTU-फर्म (साइबर सुरक्षा)',
    },
    'bbn0zj2x': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // OS
  {
    'rvb1g24y': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    '8jw9lsob': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'hn6ciu98': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'uku9yuhb': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'bajk9uwl': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '1okvekfm': {
      'en': 'AKTU-FIRM( OS )',
      'hi': 'AKTU-फ़र्म( ओएस )',
    },
    'np9yblg0': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // UHV
  {
    'any6pk65': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'il1qjumz': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'js013h6t': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'rbwaa8qu': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'tnurwq6i': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '3jrskyjq': {
      'en': 'AKTU-FIRM( UHV )',
      'hi': 'AKTU-फ़र्म (UHV)',
    },
    'jcrrpmmd': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // physics
  {
    '89eiqcux': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'fjf7n2bs': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'l6vk1crl': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'v0mqktw7': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'lj0ezel2': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '2vip0zvu': {
      'en': 'BAS-101(PHYSICS)',
      'hi': 'BAS-101(भौतिकी)',
    },
    '1fcjp32z': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // softskills
  {
    'af0pf9v6': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'iy3nxzml': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '3kpncvfg': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'sf3w2hvp': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'ctdpp0by': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'bsxru8za': {
      'en': 'BAS-105(SOFT SKILLS)',
      'hi': 'BAS-105(सॉफ्ट स्किल्स)',
    },
    'ujqjsudn': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // mechanical
  {
    'u836t4gz': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'donisrry': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'pyypkby8': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '7ggnn1qe': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'p7tx3ig9': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'ij6qzzau': {
      'en': 'BME-101(MECHANICAL)',
      'hi': 'बीएमई-101(मैकेनिकल)',
    },
    '8bdnpun1': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // electronics
  {
    'b2kzz5ti': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'y17wspfh': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'bx1565vw': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'mrqlhjzv': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'pk0uscv8': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'e21bny4h': {
      'en': 'BEC-101\n(ELECTRONICS ENGINEERING)',
      'hi': 'बीईसी-101\n(इलेक्ट्रॉनिक्स इंजीनियरिंग)',
    },
    'fawadftf': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // maths1
  {
    '4ftq6xpz': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'wtd5phxg': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'f55oapto': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'xgo8sqd5': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'xpvplcyf': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '0ts1j4il': {
      'en': 'BAS-103(MATHS-1)',
      'hi': 'बीएएस-103(गणित-1)',
    },
    'pku97bbg': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // chemistry
  {
    'la0uogab': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'iu4fg13l': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'gnke5uxi': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'z225guby': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'pnri8wkj': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'jnp52ooz': {
      'en': 'BAS-103(CHEMSITRY)',
      'hi': 'BAS-103(रसायन विज्ञान)',
    },
    'qwypjfgp': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // maths2
  {
    '0t3eg42e': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'wgu2j7d2': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '22hj0nhi': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'gox7jyln': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'b7qdkq01': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '265vlhzr': {
      'en': 'BAS-203(MATHS-11)',
      'hi': 'बीएएस-203(गणित-11)',
    },
    'z9nh0wjf': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // electrical
  {
    '07d6ldj5': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'h9dqub8q': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    '1zbprfgn': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '0gqh14wj': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'vi2v2mzc': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '54q8s9fq': {
      'en': 'BEE-201(ELECTRICAL ENGINEERING)',
      'hi': 'बीईई-201(इलेक्ट्रिकल इंजीनियरिंग)',
    },
    '5hz3g59m': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // evs
  {
    '18irzyuu': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'l667djrk': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'op2fmehy': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    '4bixy1t1': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'oqgas7hm': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    '68jocsla': {
      'en': 'BAS-204( evs)',
      'hi': 'बीएएस-204( ईवीएस)',
    },
    'u2smrlqy': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // pps
  {
    'yvmei4de': {
      'en': 'Select Among These.',
      'hi': 'इनमें से चुनें.',
    },
    'hma31ulz': {
      'en': 'PYQ',
      'hi': 'पीवाईक्यू',
    },
    'h8ybu4qc': {
      'en': 'NOTES',
      'hi': 'नोट्स',
    },
    'oq8r6wyl': {
      'en': 'QUANTUM',
      'hi': 'मात्रा',
    },
    'o8x6w44v': {
      'en': 'Click Me',
      'hi': 'मुझे क्लिक करें',
    },
    'i3kh2ajq': {
      'en': 'BSC-251(PPS)',
      'hi': 'बीएससी-251(पीपीएस)',
    },
    '0to0mzdl': {
      'en': 'Shop',
      'hi': 'दुकान',
    },
  },
  // aboutme
  {
    'pxx0gbn4': {
      'en': 'Saumya Pratap Singh',
      'hi': 'सौम्या प्रताप सिंह',
    },
    'hii9mhqk': {
      'en':
          'Creative Developer, Graphic Designer and FlutterFlow interface(app) designer.',
      'hi':
          'क्रिएटिव डेवलपर, ग्राफिक डिजाइनर और फ़्लटरफ़्लो इंटरफ़ेस (ऐप) डिजाइनर।',
    },
    'gaq6iro1': {
      'en': 'About Me',
      'hi': 'मेरे बारे में',
    },
    'lmtiusrf': {
      'en':
          '\"Hi, I’m Saumya Pratap Singh, a passionate B.Tech undergraduate at the United College of Engineering and Research, specializing in Artificial Intelligence and Machine Learning (AIML). With a strong foundation in programming languages like C, Python, HTML, and CSS, I thrive at the intersection of technology and creativity.\n\nAs a graphic designer, basic FlutterFlow app developer, and creative developer, I bring ideas to life through visually appealing designs and functional applications. I’ve worked on numerous projects, and this app is one of my proudest creations, showcasing my ability to blend technical skills with innovative thinking.\n\nI’m always eager to explore new challenges and push the boundaries of what’s possible in tech and design. Let’s build something amazing together!\"',
      'hi':
          '\"नमस्ते, मैं सौम्या प्रताप सिंह हूँ, मैं यूनाइटेड कॉलेज ऑफ़ इंजीनियरिंग एंड रिसर्च में बी.टेक स्नातक हूँ, जो आर्टिफिशियल इंटेलिजेंस और मशीन लर्निंग (AIML) में विशेषज्ञता रखता है। C, Python, HTML और CSS जैसी प्रोग्रामिंग भाषाओं में मज़बूत आधार के साथ, मैं तकनीक और रचनात्मकता के मिलन-जुलन में कामयाब हूँ।\n\nएक ग्राफ़िक डिज़ाइनर, बेसिक फ़्लटरफ़्लो ऐप डेवलपर और क्रिएटिव डेवलपर के रूप में, मैं आकर्षक डिज़ाइन और फ़ंक्शनल एप्लिकेशन के ज़रिए विचारों को जीवंत करता हूँ। मैंने कई प्रोजेक्ट पर काम किया है, और यह ऐप मेरी सबसे शानदार कृतियों में से एक है, जो तकनीकी कौशल को अभिनव सोच के साथ मिलाने की मेरी क्षमता को दर्शाता है।\n\nमैं हमेशा नई चुनौतियों का पता लगाने और तकनीक और डिज़ाइन में जो संभव है उसकी सीमाओं को आगे बढ़ाने के लिए उत्सुक रहता हूँ। आइए साथ मिलकर कुछ अद्भुत बनाएँ!\"',
    },
    'rxc71wmo': {
      'en': 'Contact',
      'hi': 'संपर्क',
    },
    'w675jhqg': {
      'en': '© 2023 Alex Morgan. All Rights Reserved.',
      'hi': '© 2023 एलेक्स मॉर्गन। सर्वाधिकार सुरक्षित।',
    },
  },
  // NOWMAINLOGIN
  {
    'k8465soi': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
    },
    'sqzqa7j6': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    'yd69obuz': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    'q9oje6yd': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    'r0woua0b': {
      'en': 'Create Acoount',
      'hi': 'खाता बनाएं',
    },
    '0uzvpgos': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // CreateProfile
  {
    'luyhqnu1': {
      'en': 'Your Name',
      'hi': 'आपका नाम',
    },
    'upgj3pau': {
      'en': 'Enter Your Age',
      'hi': 'अपनी आयु दर्ज करें',
    },
    'difqpq7x': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
    },
    '5876b2tb': {
      'en': 'Skip For Now',
      'hi': 'अभी के लिए छोड़ दे',
    },
    '609ouolr': {
      'en': 'Create your Profile',
      'hi': 'अपना प्रोफ़ाइल बनाएं',
    },
  },
  // profile
  {
    '1w3vqtf6': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
    },
    'yf2p1dgj': {
      'en': 'Continue to access',
      'hi': 'पहुँच जारी रखें',
    },
    '044qfmaj': {
      'en': '__',
      'hi': '__',
    },
  },
  // aichatbot
  {
    'ifg9utov': {
      'en': 'AKTU Firm AI Chatbot',
      'hi': 'AKTU फ़र्म AI चैटबॉट',
    },
    '2jbw2qri': {
      'en': 'Type your message here...',
      'hi': 'यहाँ आपके संदेश लिखें...',
    },
  },
  // Miscellaneous
  {
    'h2ifffhz': {
      'en': '',
      'hi': '',
    },
    'jgs8swg5': {
      'en': '',
      'hi': '',
    },
    '6jzvixdj': {
      'en': '',
      'hi': '',
    },
    'bgc84508': {
      'en': '',
      'hi': '',
    },
    'laxud5cq': {
      'en': '',
      'hi': '',
    },
    '69z70nr3': {
      'en': '',
      'hi': '',
    },
    'ly6h3tfm': {
      'en': '',
      'hi': '',
    },
    '7r997ots': {
      'en': '',
      'hi': '',
    },
    'nv65xqhd': {
      'en': '',
      'hi': '',
    },
    'itii1nct': {
      'en': '',
      'hi': '',
    },
    'khxa5rwv': {
      'en': '',
      'hi': '',
    },
    'q3ayebm2': {
      'en': '',
      'hi': '',
    },
    '065qdbx1': {
      'en': '',
      'hi': '',
    },
    'yzuhdcyn': {
      'en': '',
      'hi': '',
    },
    'ellbbgdv': {
      'en': '',
      'hi': '',
    },
    '0w13coh0': {
      'en': '',
      'hi': '',
    },
    '7ebh2ewe': {
      'en': '',
      'hi': '',
    },
    '7nz40i6o': {
      'en': '',
      'hi': '',
    },
    'o0zpervs': {
      'en': '',
      'hi': '',
    },
    'frkje6xs': {
      'en': '',
      'hi': '',
    },
    'uj4otx65': {
      'en': '',
      'hi': '',
    },
    't18mtr9r': {
      'en': '',
      'hi': '',
    },
    'sj0hclid': {
      'en': '',
      'hi': '',
    },
    '38icrm27': {
      'en': '',
      'hi': '',
    },
    'yf6bwcdv': {
      'en': '',
      'hi': '',
    },
    'wmy7gq4o': {
      'en': '',
      'hi': '',
    },
    'burcl0hl': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
