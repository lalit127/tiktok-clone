import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'Successfully Select Profile Image');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != Null) {
        // save user to authentication and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image!);

        model.User user = model.User(
            email: email,
            name: username,
            profilePhoto: downloadUrl,
            uid: cred.user!.uid);
        await firebaseStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error Creating An Account', 'Please Enter All Field');
      }
    } catch (e) {
      Get.snackbar('Error Creating An Account', e.toString());
    }
  }
}
