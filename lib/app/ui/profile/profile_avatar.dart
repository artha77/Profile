import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/app/scoped_models/profile_scoped_model.dart';
import 'package:profile/app/utils/dialog_helper.dart';
import 'package:profile/app/utils/modal_popup_helper.dart';
import 'package:profile/config/application.dart';
import 'package:profile/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileAvatar extends StatefulWidget {
  final formKey;

  ProfileAvatar({Key key, this.formKey}) : super(key: key);

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  ProfileScopedModel _profileScopedModel;
  double _avatarBlocPadding = Application.screen.setHeight(40);
  double _avatarRadius = Application.screen.setWidth(70);


  @override
  Widget build(BuildContext context) {
    _profileScopedModel = ScopedModel.of<ProfileScopedModel>(context, rebuildOnChange: true);

    return _buildAvatarBloc();
  }

  _onAddAvatarButtonPressed() {
    if (Platform.isIOS)
      _showIosModal();
    else
      _showAndroidModal();
  }

  _showIosModal() {
    List<CupertinoActionSheetAction> actions = [
      CupertinoActionSheetAction(child: Text("Depuis l'appareil photo"), onPressed: _takePhotoFromCamera),
      CupertinoActionSheetAction(child: Text("Depuis la gallerie"), onPressed: _takePhotoFromGallery)
    ];

    CupertinoActionSheetAction cancelButton = CupertinoActionSheetAction(
        onPressed: () {Navigator.pop(context);},
        child: Text("Annuler"),
        isDefaultAction: true);

    ModalPopupHelper.showIos(context, actions: actions, cancelButton: cancelButton);
  }

  _showAndroidModal() {
    List<ListTile> actions = [
      ListTile(title: Text("Depuis l'appareil photo"), onTap: _takePhotoFromCamera),
      ListTile(title: Text("Depuis la gallerie"), onTap: _takePhotoFromGallery)
    ];

    ModalPopupHelper.showAndroid(context, actions: actions);
  }

  Future<void> _takePhotoFromCamera() async {
    Navigator.pop(context);

    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (image == null) {
      DialogHelper.info(context,
          "Informations",
          "Aucune image ajoutée");
    }
    else
      _profileScopedModel.setAvatar(image);
  }

  Future<void> _takePhotoFromGallery() async {
    Navigator.pop(context);

    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      DialogHelper.info(context,
          "Informations",
          "Aucune image ajoutée");
    }
    else
      _profileScopedModel.setAvatar(image);
  }


  Widget _buildAvatarBloc() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(top: _avatarBlocPadding, bottom: _avatarBlocPadding),
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: <Widget>[
                  _buildAvatar(),
                  _buildAddAvatarButton()
                ],
              ),
            )
        )
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
        child: ClipOval(
            child: (_profileScopedModel.avatar == null)
                ? null
                : Image.file(
              _profileScopedModel.avatar,
              fit: BoxFit.cover,
              width: _avatarRadius * 2,
              height: _avatarRadius * 2,
            )
        ),
        radius: _avatarRadius,
    );
  }

  Widget _buildAddAvatarButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: CircleAvatar(
        backgroundColor: ThemeColors.SecondaryColor,
        child: IconButton(icon: Icon(Icons.add), color: ThemeColors.TextColor ,onPressed: _onAddAvatarButtonPressed),
      ),
    );
  }


}
