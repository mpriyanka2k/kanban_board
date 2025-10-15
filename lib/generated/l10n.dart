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

  /// `Kanban Board`
  String get appTitle {
    return Intl.message(
      'Kanban Board',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccessful {
    return Intl.message(
      'Login successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeMsg {
    return Intl.message(
      'Welcome',
      name: 'welcomeMsg',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue using Kanban Board`
  String get loginDesMsg {
    return Intl.message(
      'Login to continue using Kanban Board',
      name: 'loginDesMsg',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emailValidationMsg1 {
    return Intl.message(
      'Please enter your email',
      name: 'emailValidationMsg1',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get emailValidationMsg2 {
    return Intl.message(
      'Enter a valid email',
      name: 'emailValidationMsg2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordValidation1 {
    return Intl.message(
      'Please enter your password',
      name: 'passwordValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordValidation2 {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get accountNotPresent {
    return Intl.message(
      'Don’t have an account?',
      name: 'accountNotPresent',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful`
  String get registrationSuccessful {
    return Intl.message(
      'Registration successful',
      name: 'registrationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register to start managing your Kanban Board`
  String get registerScreenMsg {
    return Intl.message(
      'Register to start managing your Kanban Board',
      name: 'registerScreenMsg',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordValidation1 {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordValidation1',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get confirmPasswordValidation2 {
    return Intl.message(
      'Passwords do not match',
      name: 'confirmPasswordValidation2',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get accountPresent {
    return Intl.message(
      'Already have an account?',
      name: 'accountPresent',
      desc: '',
      args: [],
    );
  }

  /// `Update Task`
  String get updateTask {
    return Intl.message(
      'Update Task',
      name: 'updateTask',
      desc: '',
      args: [],
    );
  }

  /// `Add New Task`
  String get newTask {
    return Intl.message(
      'Add New Task',
      name: 'newTask',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get createTask {
    return Intl.message(
      'Create Task',
      name: 'createTask',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message(
      'In Progress',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `To Do`
  String get toDo {
    return Intl.message(
      'To Do',
      name: 'toDo',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to Logout ?`
  String get logoutConfirmationMsg {
    return Intl.message(
      'Do you want to Logout ?',
      name: 'logoutConfirmationMsg',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get dataNotAvailable {
    return Intl.message(
      'No data available',
      name: 'dataNotAvailable',
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
