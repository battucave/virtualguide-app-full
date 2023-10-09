import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:virtualguide/view/authentication/phone_auth.dart';
import 'package:virtualguide/view/authentication/welcome_screen.dart';
import 'package:virtualguide/view/master/master_screen.dart';
import 'package:virtualguide/widgets/constant/alerts/alerts.dart';
import 'package:virtualguide/widgets/constant/loader/flutter_overlay_loader.dart';

class AuthenticationProvider extends ChangeNotifier {
  // TEXT FORM FIELD CONTROLLER
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // FORM KEY
  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  // FIREBASE
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  // HIDE PASSWORD
  bool hidePassword = true;

  void hidePass(value) {
    hidePassword = !value;
    notifyListeners();
  }

  // REMEMBER ME
  bool isRememberMe = false;

  void rememberMe(value) {
    isRememberMe = value;
    notifyListeners();
  }

  // OTP SEND STATUS
  bool _isSendOtpCode = false;

  bool get isSendOtpCode => _isSendOtpCode;

  set isSendOtpCode(bool value) {
    _isSendOtpCode = value;
    notifyListeners();
  }

  // Verify OPT
  String _verificationId = '';

  String get verificationId => _verificationId;

  set verificationId(dynamic value) {
    _verificationId = value;
    notifyListeners();
  }

  Future<void> verifyOTPWithFirebase({required BuildContext context}) async {
    FlutterOverlayLoader.showLoader(context);
    stopTimer();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpController.text,
    );
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        FlutterOverlayLoader.hideLoader();
        goToHomeScreen(context: context);
      });
    } catch (e) {
      FlutterOverlayLoader.hideLoader();
      otpController.clear();
      phoneController.clear();
      _secondsRemaining = 0;
      _isTimerActive = false;
      verificationId = '';
      isSendOtpCode = false;
      Alerts.showErrorDialog(
          context: context,
          errorMessage: "OTP verification failed",
          title: "Error");
    }
  }

  // OTP Timer
  late Timer _timer;
  int _secondsRemaining = 0;
  bool _isTimerActive = false;

  int get secondsRemaining => _secondsRemaining;
  bool get isTimerActive => _isTimerActive;

  void startTimer() {
    if (!_isTimerActive) {
      _secondsRemaining = 30;
      _isTimerActive = true;

      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          stopTimer();
          // Call a method to resend the code here
        }

        notifyListeners();
      });
    }
  }

  void stopTimer() {
    _timer.cancel();
    _isTimerActive = false;
    notifyListeners();
  }

  // FIREBASE SIGN UP
  Future<void> signUp({required BuildContext context}) async {
    if (signUpFormKey.currentState!.validate()) {
      try {
        FlutterOverlayLoader.showLoader(context);
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passController.text)
            .then((value) => goToHomeScreen(context: context));
        FlutterOverlayLoader.hideLoader();
      } on FirebaseAuthException catch (e) {
        FlutterOverlayLoader.hideLoader();
        Alerts.showErrorDialog(
            context: context,
            errorMessage: e.message.toString(),
            title: e.code.toString());
      } catch (e) {
        FlutterOverlayLoader.hideLoader();
        Alerts.showErrorDialog(
            context: context, errorMessage: e.toString(), title: "Error");
      }
    }
  }

  // FIREBASE SIGN IN
  Future<void> signIn({required BuildContext context}) async {
    if (signInFormKey.currentState!.validate()) {
      try {
        FlutterOverlayLoader.showLoader(context);
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passController.text)
            .then(
              (value) => goToHomeScreen(context: context),
            );
        FlutterOverlayLoader.hideLoader();
      } on FirebaseAuthException catch (e) {
        FlutterOverlayLoader.hideLoader();
        Alerts.showErrorDialog(
            context: context,
            errorMessage: e.message.toString(),
            title: e.code.toString());
      } catch (e) {
        FlutterOverlayLoader.hideLoader();
        Alerts.showErrorDialog(
            context: context, errorMessage: e.toString(), title: "Error");
      }
    }
  }

  // SIGN IN WITH GOOGLE
  Future<void> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        await auth
            .signInWithPopup(authProvider)
            .then((value) => goToHomeScreen(context: context));
      } catch (e) {
        Alerts.showErrorDialog(
            context: context, errorMessage: e.toString(), title: "Error");
      }
    } else {
      FlutterOverlayLoader.showLoader(context);
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        try {
          await auth.signInWithCredential(credential).then((value) {
            FlutterOverlayLoader.hideLoader();
            goToHomeScreen(context: context);
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // Error
            FlutterOverlayLoader.hideLoader();
          } else if (e.code == 'invalid-credential') {
            // Error
            FlutterOverlayLoader.hideLoader();
          }
        } catch (e) {
          // Error
          FlutterOverlayLoader.hideLoader();
        }
      }
    }
  }

  // Phone Authentication
  Future<void> verifyPhoneNumber({required BuildContext context}) async {
    try {
      FlutterOverlayLoader.showLoader(context);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91 ${phoneController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          isSendOtpCode = false;
          verificationId = '';
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            FlutterOverlayLoader.hideLoader();
            goToHomeScreen(context: context);
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          FlutterOverlayLoader.hideLoader();
          Alerts.showErrorDialog(
              context: context,
              errorMessage: e.message.toString(),
              title: e.code.toString());
        },
        codeSent: (String verifyId, int? resendToken) {
          // Save the verification ID and resend token to a shared variable.
          // You'll need to use them later to complete the verification process.
          // You can also present a UI to enter the OTP manually if required.
          // For example, you can navigate to a new screen with an OTP input field.
          // Pass the verification ID and resend token to the new screen.
          FlutterOverlayLoader.hideLoader();
          isSendOtpCode = true;
          verificationId = verifyId;
          startTimer();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          FlutterOverlayLoader.hideLoader();
          Alerts.showErrorDialog(
              context: context,
              errorMessage: "Phone verification timeout",
              title: "Error");
        },
      );
    } on FirebaseAuthException catch (e) {
      FlutterOverlayLoader.hideLoader();
      Alerts.showErrorDialog(
          context: context,
          errorMessage: e.message.toString(),
          title: e.code.toString());
    } catch (e) {
      FlutterOverlayLoader.hideLoader();
      Alerts.showErrorDialog(
          context: context, errorMessage: e.toString(), title: "Error");
    }
  }

  // FIREBASE SIGN OUT
  Future<void> signOut({required BuildContext context}) async {
    try {
      emailController.clear();
      passController.clear();
      phoneController.clear();
      otpController.clear();
      await FirebaseAuth.instance
          .signOut()
          .then((value) => goToWelcomeScreen(context: context));
    } on FirebaseAuthException catch (e) {
      Alerts.showErrorDialog(
          context: context,
          errorMessage: e.message.toString(),
          title: e.code.toString());
    } catch (e) {
      Alerts.showErrorDialog(
          context: context, errorMessage: e.toString(), title: "Error");
    }
  }

  // NAVIGATE HOME SCREEN
  Future<void> goToHomeScreen({required BuildContext context}) async {
    _user = _auth.currentUser;
    if (_user!.displayName == null) {
      _user!.updateDisplayName('Hello User');
    }
    if (_user!.photoURL == null) {
      _user!.updatePhotoURL(
          'https://ik.imagekit.io/es1ee6eva/VirtualGuide/blank-profile-picture-973460_1280_356AofKGl.png');
    }
    _user!.reload();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MasterScreen(),
      ),
    );
  }

  // NAVIGATE HOME SCREEN
  void goToWelcomeScreen({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }

  // NAVIGATE PHONE SCREEN
  void goToPhoneScreen({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PhoneAuthentication(),
      ),
    );
  }
}
