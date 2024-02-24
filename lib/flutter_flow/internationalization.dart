import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashPage
  {
    's6ps9rzk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MapPage
  {
    'jula7u30': {
      'en': 'Track Trips',
      'ar': 'تتبع الرحلات',
    },
    'ft9cxafm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NotificationPage
  {
    'nv23fc12': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SideMenuePage
  {
    'zm7ebcss': {
      'en': 'Pesonal File',
      'ar': 'الملف الشخصي',
    },
    '27d2iqa9': {
      'en': 'Notifications',
      'ar': 'إشعارات',
    },
    '9x6glv9v': {
      'en': 'Languge',
      'ar': 'لغة',
    },
    'prheb90k': {
      'en': 'Saved Lines',
      'ar': 'الخطوط المحفوظة',
    },
    '52t4vd9i': {
      'en': 'Help & Support',
      'ar': 'المساعدة والدعم',
    },
    '2mfgex4r': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    '8ckbbtde': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LangugePage
  {
    'ubh1q9ex': {
      'en': 'العربية',
      'ar': 'العربية',
    },
    'qxyhrd01': {
      'en': 'English',
      'ar': 'English',
    },
    '18vdczrr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // PersonalPage
  {
    'bm1lwdff': {
      'en': 'Student Name',
      'ar': 'أسم الطالب',
    },
    'xq8kmna6': {
      'en': 'University Number',
      'ar': 'رقم الجامعة',
    },
    'p7uex74q': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '9vt5fluj': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'pbi6do05': {
      'en': 'Home',
      'ar': '',
    },
  },
  // HelpPage
  {
    'lafxsbih': {
      'en': 'For Contact : ',
      'ar': 'للتواصل :',
    },
    'suggj4ko': {
      'en': '0779350932',
      'ar': '0779350932',
    },
    'pw5snzu6': {
      'en': 'Whats App : ',
      'ar': 'تطبيق واتس :',
    },
    '55jib7ut': {
      'en': '0779350932',
      'ar': '0779350932',
    },
    'c5ttqqq5': {
      'en': 'Email : ',
      'ar': 'بريد إلكتروني :',
    },
    '78963bbx': {
      'en': 'info@info.com',
      'ar': 'info@info.com',
    },
    'm7duz5ho': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LoginPage
  {
    'lc0ocz4a': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'igrr73ni': {
      'en': 'Phone Number Is Invalid',
      'ar': 'رقم الهاتف غير صالح',
    },
    'ac2zq5ys': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'kr2gng6e': {
      'en': 'Password Is Invalid',
      'ar': 'كلمة المرور غير صالحة',
    },
    '81d8l2oc': {
      'en': 'Login',
      'ar': 'تتبع الرحلات',
    },
    '13adi88g': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'sdgc49p5': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TrackTripsPage
  {
    'biniyc1q': {
      'en': 'Search',
      'ar': 'كلمة السر الحالية',
    },
    'p0zzvg9x': {
      'en': '022/25',
      'ar': '',
    },
    'seld': {
      'en': 'Selected Lines By',
      'ar': 'الخطوط المختارة من قبل',
    },
    'nereYou': {
      'en': 'Line Closed to you',
      'ar': 'الخطوط القريبة منك',
    },
    'aqchkde4': {
      'en': 'More',
      'ar': 'أكثر',
    },

    'less': {
      'en': 'Less',
      'ar': 'اقل',
    },
    '4eklp4ju': {
      'en': 'Select Line',
      'ar': 'اختر الخط',
    },
    'flow': {
      'en': 'Follow Line',
      'ar': 'تتبع الخط',
    },
    '2fw53lnx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DetailsTrackingPage
  {
    'f2yd6pz8': {
      'en': 'Bus tracking distance from the selected stopping point',
      'ar': 'مسافة تتبع الحافلة عن نقطة التوقف المحددة',
    },
    'yvozjdfo': {
      'en': '00',
      'ar': '',
    },
    'rit21eza': {
      'en': 'KM',
      'ar': 'كيلو متر',
    },
    'vxl7mb76': {
      'en': 'Start Trip',
      'ar': ' ابدأ التتبع',
    },
    'k9q4znl3': {
      'en': 'Breakpoint',
      'ar': 'نقطة التوقف',
    },
    '9wuwep12': {
      'en': 'Hello World',
      'ar': '',
    },
    'jufmqx2g': {
      'en': 'Bus tracking distance from the selected stopping point',
      'ar': 'مسافة تتبع الحافلة من نقطة التوقف المحددة',
    },
    'jjrem21y': {
      'en': 'KM',
      'ar': 'كيلو متر',
    },
    'sy46gnu4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NotificationDetailsPage
  {
    '9xjqbejq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Action2SheetSimple
  {
    'x1izf1vf': {
      'en': 'Old Password',
      'ar': 'كلمة المرور القديمة',
    },
    'xv08bf1e': {
      'en': 'Old Password Is WRONG',
      'ar': 'كلمة المرور القديمة خاطئة',
    },
    '14jtjame': {
      'en': 'Current Password',
      'ar': 'كلمة السر الحالية',
    },
    '7s3bhrik': {
      'en': 'Not Confirmed',
      'ar': 'غير مؤكد',
    },
    'khvvdmta': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '3isjn59w': {
      'en': 'Not Confirmed',
      'ar': 'غير مؤكد',
    },
    'miv75kup': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '9h8886vl': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // UpdatePhoneNumberComponent
  {
    'hyzji0om': {
      'en': 'new Phone Number',
      'ar': 'رقم الهاتف الجديد',
    },
    'v82sdnvn': {
      'en': 'Phone Not Correct',
      'ar': 'الهاتف غير صحيح',
    },
    'wducx0ke': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'i1qz50h9': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'rfskuapi': {
      'en': '',
      'ar': '',
    },
    'ejsca1s8': {
      'en': '',
      'ar': '',
    },
    '0zqeyjbd': {
      'en': '',
      'ar': '',
    },
    'nk7a0y8i': {
      'en': '',
      'ar': '',
    },
    'b66bs29s': {
      'en': '',
      'ar': '',
    },
    'ms1wgeeo': {
      'en': '',
      'ar': '',
    },
    '5drpslfr': {
      'en': '',
      'ar': '',
    },
    'bq57p24d': {
      'en': '',
      'ar': '',
    },
    'fj5814w8': {
      'en': '',
      'ar': '',
    },
    'gyyi56n4': {
      'en': '',
      'ar': '',
    },
    '79luyid1': {
      'en': '',
      'ar': '',
    },
    'ecgf2kfq': {
      'en': '',
      'ar': '',
    },
    'ani1hr1p': {
      'en': '',
      'ar': '',
    },
    'r3pjsjqp': {
      'en': '',
      'ar': '',
    },
    'yg9fdgwf': {
      'en': '',
      'ar': '',
    },
    'kgcpra72': {
      'en': '',
      'ar': '',
    },
    'dhlxvrzm': {
      'en': '',
      'ar': '',
    },
    '4dhb1wvj': {
      'en': '',
      'ar': '',
    },
    'a6fgqjdz': {
      'en': '',
      'ar': '',
    },
    'lwg0ygcm': {
      'en': '',
      'ar': '',
    },
    'us9go136': {
      'en': '',
      'ar': '',
    },
    'by0d8rp4': {
      'en': '',
      'ar': '',
    },
    'ri9u5vbg': {
      'en': '',
      'ar': '',
    },
    '7nribtan': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
