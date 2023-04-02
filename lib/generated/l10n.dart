// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `MNet Corporate`
  String get title {
    return Intl.message(
      'MNet Corporate',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Version: 1.0.0`
  String get version {
    return Intl.message(
      'Version: 1.0.0',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `@Copyright, Mutual Trust Bank Limited`
  String get copy_right {
    return Intl.message(
      '@Copyright, Mutual Trust Bank Limited',
      name: 'copy_right',
      desc: '',
      args: [],
    );
  }

  /// `Error while loading data. Please try again.`
  String get error {
    return Intl.message(
      'Error while loading data. Please try again.',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to MNet`
  String get welcome {
    return Intl.message(
      'Welcome to MNet',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Emp ID: %s`
  String get emp_id {
    return Intl.message(
      'Emp ID: %s',
      name: 'emp_id',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Notices`
  String get notices {
    return Intl.message(
      'Notices',
      name: 'notices',
      desc: '',
      args: [],
    );
  }

  /// `Circulars`
  String get circulars {
    return Intl.message(
      'Circulars',
      name: 'circulars',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Helpline`
  String get helpline {
    return Intl.message(
      'Helpline',
      name: 'helpline',
      desc: '',
      args: [],
    );
  }

  /// `Recent Notices`
  String get recent_notices {
    return Intl.message(
      'Recent Notices',
      name: 'recent_notices',
      desc: '',
      args: [],
    );
  }

  /// `Archieves`
  String get archieves {
    return Intl.message(
      'Archieves',
      name: 'archieves',
      desc: '',
      args: [],
    );
  }

  /// `Punch In`
  String get punch_in {
    return Intl.message(
      'Punch In',
      name: 'punch_in',
      desc: '',
      args: [],
    );
  }

  /// `Punch Out`
  String get punch_out {
    return Intl.message(
      'Punch Out',
      name: 'punch_out',
      desc: '',
      args: [],
    );
  }

  /// `Leave Status`
  String get leave_status {
    return Intl.message(
      'Leave Status',
      name: 'leave_status',
      desc: '',
      args: [],
    );
  }

  /// `MTB Circulars`
  String get mtb_circulars {
    return Intl.message(
      'MTB Circulars',
      name: 'mtb_circulars',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get see_more {
    return Intl.message(
      'See More',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get waiting {
    return Intl.message(
      'Waiting',
      name: 'waiting',
      desc: '',
      args: [],
    );
  }

  /// `Leaves`
  String get leaves {
    return Intl.message(
      'Leaves',
      name: 'leaves',
      desc: '',
      args: [],
    );
  }

  /// `OD/OT/WFH`
  String get od_ot {
    return Intl.message(
      'OD/OT/WFH',
      name: 'od_ot',
      desc: '',
      args: [],
    );
  }

  /// `Apply Now`
  String get apply_now {
    return Intl.message(
      'Apply Now',
      name: 'apply_now',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
