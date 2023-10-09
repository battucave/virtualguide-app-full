import 'dart:convert';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtualguide/widgets/constant/alerts/alerts.dart';
import 'package:virtualguide/widgets/constant/loader/flutter_overlay_loader.dart';

class AccountProvider extends ChangeNotifier {
  // FORM KEY
  final personalInfoFormKey = GlobalKey<FormState>();

  // IMAGE PICKER AND CROPPER
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  bool _darkModeEnabled = false;

  bool get darkModeEnabled => _darkModeEnabled;

  void toggleDarkMode({required BuildContext context}) {
    if (AdaptiveTheme.of(context).mode.isLight) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
    _darkModeEnabled = !_darkModeEnabled;

    notifyListeners();
  }

  // Firebase Configure
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  // Check User Data
  String? get displayName => _user?.displayName;
  String? get email => _user?.email;
  String? get phoneNumber => _user?.phoneNumber;

  // Get User Email
  String getUserEmail() {
    _user = _auth.currentUser;
    if (_user != null) {
      _user!.reload();
      return _user!.email != null
          ? _user!.email.toString()
          : _user!.phoneNumber.toString();
    }
    return "unknown user";
  }

  // Get User displayName
  String getUserDisplayName() {
    _user = _auth.currentUser;
    if (_user != null) {
      _user!.reload();
      return _user!.displayName.toString();
    }
    return "Hello User";
  }

  // Get User Photo Url
  String getUserPhotoUrl() {
    _user = _auth.currentUser;
    if (_user != null) {
      _user!.reload();
      return _user!.photoURL.toString();
    }
    return "https://ik.imagekit.io/es1ee6eva/VirtualGuide/blank-profile-picture-973460_1280_356AofKGl.png";
  }

  // Reload Update
  void reloadUserData() {
    _user?.reload();
    notifyListeners();
  }

  // Update Profile
  Future<void> updateProfile(
      {required BuildContext context,
      required String email,
      required String displayName}) async {
    if (personalInfoFormKey.currentState!.validate()) {
      try {
        FlutterOverlayLoader.showLoader(context);
        await _user!.updateEmail(email);
        await _user!.updateDisplayName(displayName);
        FlutterOverlayLoader.hideLoader();
        await _user?.reload().then((value) => Navigator.pop(context, true));
      } catch (e) {
        FlutterOverlayLoader.hideLoader();
        Alerts.showErrorDialog(
            context: context, errorMessage: e.toString(), title: "Error");
      }
    }
  }

  // Image Picker and Cropper
  Future<void> pickAndCropImage({required BuildContext context}) async {
    await _imagePicker
        .pickImage(source: ImageSource.gallery, imageQuality: 40)
        .then((pickedFile) async {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        uploadImage(context, "virtualGuide_${DateTime.now()}", pickedFile);
        notifyListeners();
      }
    });
  }

  // Upload Profile Image
  /*
  Title : Upload Images in cloud
  Method : POST
   */
  Future<void> uploadImage(context, fileName, file) async {
    FlutterOverlayLoader.showLoader(context);
    List<int> anc = await convertImageToList(file);
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('private_o+R3u33D5LnIpVlTbCv9FdKUfRA=:'))}';
    var formData = FormData.fromMap({
      'publicKey': "public_PTHsGm5GrOJzW8H0LJHLZy9an5E=",
      'fileName': "$fileName.png",
      'file': MultipartFile.fromBytes(anc, filename: "$fileName.png"),
    });
    try {
      await Dio()
          .post(
        'https://upload.imagekit.io/API/v1/files/upload',
        data: formData,
        options: Options(headers: {"authorization": basicAuth}),
      )
          .then((value) async {
        await _user!.updatePhotoURL(value.data['url'].toString());
        await _user!.reload().then((value) {
          FlutterOverlayLoader.hideLoader();
          notifyListeners();
        });
      });
    } catch (e) {
      FlutterOverlayLoader.hideLoader();
      Alerts.showErrorDialog(
          context: context, errorMessage: e.toString(), title: "Error");
    }
  }

  Future<List<int>> convertImageToList(XFile imageFile) async {
    final bytes = await imageFile.readAsBytes();
    return bytes.toList();
  }
}
