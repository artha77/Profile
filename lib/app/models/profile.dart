import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

class Profile {
  String username;
  String email;
  String firstName;
  String lastName;
  File avatar;
  bool wantNotification=false;
  bool hasAcceptedCGU=false;

  Profile();

  Profile.fromJson(Map<String, dynamic> data)
      : username = data['username'],
        email = data['email'],
        firstName = data['first_name'],
        lastName = data['last_name'],
        hasAcceptedCGU = data['has_accepted_cgu'],
        wantNotification = data['want_notification'],
        avatar = _avatarFromByte(base64.decode(data['avatar']));

  toJson() => {
    "username": username,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "want_notification": wantNotification,
    "has_accepted_CGU": hasAcceptedCGU,
    "avatar": base64Encode(avatar.readAsBytesSync())
  };

  static File _avatarFromByte(Uint8List rawData) {
    var avatar = File('avatar.jpg');
    avatar.writeAsBytesSync(rawData);

    return avatar;
  }

}