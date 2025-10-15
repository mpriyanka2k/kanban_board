// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountNotPresent":
            MessageLookupByLibrary.simpleMessage("Don’t have an account?"),
        "accountPresent":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Kanban Board"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmPasswordValidation1": MessageLookupByLibrary.simpleMessage(
            "Please confirm your password"),
        "confirmPasswordValidation2":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
        "createTask": MessageLookupByLibrary.simpleMessage("Create Task"),
        "dataNotAvailable":
            MessageLookupByLibrary.simpleMessage("No data available"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailValidationMsg1":
            MessageLookupByLibrary.simpleMessage("Please enter your email"),
        "emailValidationMsg2":
            MessageLookupByLibrary.simpleMessage("Enter a valid email"),
        "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginDesMsg": MessageLookupByLibrary.simpleMessage(
            "Login to continue using Kanban Board"),
        "loginSuccessful":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutConfirmationMsg":
            MessageLookupByLibrary.simpleMessage("Do you want to Logout ?"),
        "newTask": MessageLookupByLibrary.simpleMessage("Add New Task"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordValidation1":
            MessageLookupByLibrary.simpleMessage("Please enter your password"),
        "passwordValidation2": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerScreenMsg": MessageLookupByLibrary.simpleMessage(
            "Register to start managing your Kanban Board"),
        "registrationSuccessful":
            MessageLookupByLibrary.simpleMessage("Registration successful"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "toDo": MessageLookupByLibrary.simpleMessage("To Do"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "updateTask": MessageLookupByLibrary.simpleMessage("Update Task"),
        "welcomeMsg": MessageLookupByLibrary.simpleMessage("Welcome"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
