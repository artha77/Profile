import 'package:profile/app/scoped_models/profile_scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:profile/config/application.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileSwitches extends StatefulWidget {

  ProfileSwitches({Key key}) : super(key: key);

  @override
  _ProfileSwitchesState createState() => _ProfileSwitchesState();
}

class _ProfileSwitchesState extends State<ProfileSwitches> {
  ProfileScopedModel _profileScopedModel;
  double _formPadding = 25;
  TextStyle _TextStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: Application.screen.setSp(14));
  TextStyle _switchTextStyle = TextStyle(fontSize: Application.screen.setSp(11));


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _profileScopedModel = ScopedModel.of<ProfileScopedModel>(context, rebuildOnChange: true);

    return Padding(
      padding: EdgeInsets.only(right: _formPadding, left: _formPadding, top: _formPadding),
      child: _buildSwicthes(),
    );
  }

  Widget _buildSwicthes() {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        runSpacing: 25,
        children: <Widget>[
          _buildNotificationBloc(),
          _buildCGUBloc()
        ],
      )
    );
  }

  Widget _buildNotificationBloc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("NOTIFICATIONS", textAlign: TextAlign.end, style: _TextStyle,),
        _buildNotificationSwitch()
      ],
    );
  }

  Widget _buildNotificationSwitch() {
    return Row(
      children: <Widget>[
        Switch(
          value: _profileScopedModel.notifications,
          onChanged: (value) {
            _profileScopedModel.setNotifications(value);
          },
        ),
        Text("J'accepte de recevoir des notifications de l'application", style: _switchTextStyle)
      ],
    );
  }

  Widget _buildCGUBloc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("CGU", textAlign: TextAlign.end, style: _TextStyle,),
        _buildCGUSwitch()
      ],
    );
  }

  Widget _buildCGUSwitch() {
    return Row(
      children: <Widget>[
        Switch(
          value: _profileScopedModel.CGU,
          onChanged: (value) {
            _profileScopedModel.setCGU(value);
          },
        ),
        _buildCGUSwitchLabel()
      ],
    );
  }

  Widget _buildCGUSwitchLabel() {
    return Text.rich(
      TextSpan(
        text: "J'ai lu et j'accepte les ",
        style: TextStyle(fontSize: Application.screen.setSp(10)),
        children: <TextSpan>[
          TextSpan(
              text: "condtion d'utilisation",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: Application.screen.setSp(10)
              )),
          TextSpan(
              text: " de Get In Shoot",
              style: TextStyle(fontSize: Application.screen.setSp(10))
          ),
        ],
      ),
    );
  }

}
