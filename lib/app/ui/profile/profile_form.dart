import 'package:profile/app/scoped_models/profile_scoped_model.dart';
import 'package:profile/app/utils/input_helper.dart';
import 'package:flutter/material.dart';
import 'package:profile/config/application.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileForm extends StatefulWidget {
  final formKey;

  ProfileForm({Key key, this.formKey}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  ProfileScopedModel _profileScopedModel;
  double _textFieldLength = Application.screen.setWidth(225);
  double _formPadding = 25;
  TextStyle _formTextStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: Application.screen.setSp(14));


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _profileScopedModel = ScopedModel.of<ProfileScopedModel>(context, rebuildOnChange: true);

    return Padding(
      padding: EdgeInsets.only(right: Application.screen.setWidth(_formPadding),
          left: Application.screen.setWidth(_formPadding),
          bottom: Application.screen.setHeight(_formPadding)),
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
      key: widget.formKey,
      child: _buildFormFields(),
    );
  }

  Widget _buildFormFields() {
    return Wrap(
      runSpacing: Application.screen.setWidth(25),
      children: <Widget>[
        _buildUsernameField(),
        _buildLastNameField(),
        _buildFirstNameField(),
        _buildEmailField()
      ],
    );
  }

  Widget _buildUsernameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("USERNAME", style: _formTextStyle),
        Flexible(
          child: Container(
            width: _textFieldLength,
            child: InputHelper.textFormField(
                hint: "johndoe",
                onSaved: (content) => _profileScopedModel.profile.username = content
            ),
          )
        ),
      ],
    );
  }

  Widget _buildLastNameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("NOM", style: _formTextStyle),
        Flexible(
            child: Container(
              width: _textFieldLength,
              child: InputHelper.textFormField(
                  hint: "Doe",
                  onSaved: (content) => _profileScopedModel.profile.lastName = content
              ),
            )
        ),
      ],
    );
  }

  Widget _buildFirstNameField() {
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("PRENOM", style: _formTextStyle),
        Flexible(
            child: Container(
              width: _textFieldLength,
              child: InputHelper.textFormField(
                  hint: "John",
                  onSaved: (content) => _profileScopedModel.profile.firstName = content
              ),
            )
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("EMAIL", style: _formTextStyle),
        Flexible(
            child: Container(
              width: _textFieldLength,
              child: InputHelper.textFormField(
                  hint: "john@johndoe.com",
                  onSaved: (content) => _profileScopedModel.profile.email = content
              ),
            )
        ),
      ],
    );
  }

}
