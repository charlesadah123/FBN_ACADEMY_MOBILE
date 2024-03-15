import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService{

  final LocalAuthentication auth = LocalAuthentication();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  @override
  Future<bool> fingerPrintAuth() async {
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      if (canCheckBiometrics) {
        List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

        if (availableBiometrics.contains(BiometricType.strong)) {
          bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to take attendance',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
            ), // Prevents the dialog from being dismissed automatically
          );
          return didAuthenticate;
        }
        else {
          // Fingerprint not available
          print('Fingerprint not available');
          return false;
        }
      } else {
        print('Biometrics not available');
        // Biometrics not available
        return false;
      }
    } on PlatformException catch (e) {
      // Handle platform exceptions
      print('PlatformException: $e');
      return false;
    } catch (e) {
      // Handle other exceptions
      print('Error performing fingerprint authentication: $e');
      return false;
    }
  }

  @override
  Future<bool> faceIDAuth() async {
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;

      if (canCheckBiometrics) {

        List<BiometricType> availableBiometrics =

        await auth.getAvailableBiometrics();

        if (availableBiometrics.contains(BiometricType.weak)) {
          bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to take attendance',

            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
            ), // Prevents the dialog from being dismissed automatically
          );
          return didAuthenticate;
        } else {
          // FaceID not available
          return false;
        }
      }
      else {
        // Biometrics not available
        return false;
      }
    } on PlatformException catch (e) {
      // Handle platform exceptions
      print('PlatformException: $e');
      return false;
    } catch (e) {
      // Handle other exceptions
      print('Error performing face authentication: $e');
      return false;
    }

  }

}