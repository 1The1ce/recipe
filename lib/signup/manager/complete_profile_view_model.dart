import 'package:flutter/material.dart';

import '../../profile/data/models/profile_model.dart';
import '../../profile/data/repositories/profile_repository.dart';


class complateProfileViewModel extends ChangeNotifier{
  complateProfileViewModel({ required ProfileRepository profileRepo}) : _profileRepo = profileRepo{
    load();
  }

  bool loading= true;

  final ProfileRepository _profileRepo;
  late  ProfileModel myProfile;

  Future load() async{
    loading = true;
    notifyListeners();

    myProfile = (await _profileRepo.fetchMyProfile())!;
    loading = false;
    notifyListeners();
  }
}