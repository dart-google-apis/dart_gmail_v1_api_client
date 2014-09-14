library gmail_v1_api.console;

import "package:google_oauth2_client/google_oauth2_console.dart" as oauth2;

import 'package:google_gmail_v1_api/src/console_client.dart';

import "package:google_gmail_v1_api/gmail_v1_api_client.dart";

/** The Gmail REST API. */
@deprecated
class Gmail extends Client with ConsoleClient {

  /** OAuth Scope2: View and manage your mail */
  static const String _SCOPE = "https://mail.google.com/";

  /** OAuth Scope2: Manage drafts and send emails */
  static const String GMAIL_COMPOSE_SCOPE = "https://www.googleapis.com/auth/gmail.compose";

  /** OAuth Scope2: View and modify but not delete your email */
  static const String GMAIL_MODIFY_SCOPE = "https://www.googleapis.com/auth/gmail.modify";

  /** OAuth Scope2: View your emails messages and settings */
  static const String GMAIL_READONLY_SCOPE = "https://www.googleapis.com/auth/gmail.readonly";

  final oauth2.OAuth2Console auth;

  Gmail([oauth2.OAuth2Console this.auth]);
}
