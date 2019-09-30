import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/app/scoped_models/profile_scoped_model.dart';
import 'package:profile/app/ui/profile/profile_avatar.dart';
import 'package:profile/app/ui/profile/profile_form.dart';
import 'package:profile/app/ui/profile/profile_switches.dart';
import 'package:profile/app/utils/app_bar_helper.dart';
import 'package:profile/config/application.dart';
import 'package:profile/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileScopedModel _profileScopedModel;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _profileScopedModel = ProfileScopedModel();
    initialize(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _buildBody())
    );
  }

  void initialize(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: Application.defaultScreenWidth,
      height: Application.defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

  }

  Widget _buildBody() {
    return Container(
      color: ThemeColors.Background,
      child: ScopedModel(
        model: _profileScopedModel,
        child: _buildForm(),
      )
    );
  }

  Widget _buildForm() {
    return ListView(
      children: <Widget>[
        ProfileAvatar(),
        ProfileForm(),
        ProfileSwitches()
      ],
    );
  }


  Widget _buildAppBar() {
    return AppBarHelper.build(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: Application.screen.setWidth(200),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              color: ThemeColors.SecondaryColor,
              onPressed: () {}
              )
        ]
    );
  }
}
