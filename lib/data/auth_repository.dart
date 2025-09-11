import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:helmet_customer/models/response_model.dart';
import 'package:helmet_customer/models/user_model.dart';
import 'package:helmet_customer/models/notification_model.dart';

class AuthRepository {
  static final DatabaseReference _collectionReference =
      FirebaseDatabase.instance.ref("Users");

  Future<ResponseModel> createAccount(UserModel userModel) async {
    ResponseModel temp = ResponseModel();
    UserModel userInvite = UserModel.fromJson({});
    bool invFlag = false;
    if (userModel.invitedBy!.isNotEmpty) {
      await _collectionReference.child(userModel.invitedBy!).get().then(
        (value) {
          if (value.exists) {
            userInvite =
                UserModel.fromJson(value.value as Map<String, dynamic>);
            userInvite.coins = userInvite.coins! + 1;
            invFlag = true;
            updateAccount(userInvite);
          }
        },
      );
    }

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userModel.email!, password: userModel.password!)
        .then((value) async {
      temp.state = true;
      userModel.uid = value.user!.uid;
      userModel.registerDate = DateTime.now().toString();
      userModel.lastLoginDate = DateTime.now().millisecondsSinceEpoch;
      userModel.referralCode = value.user!.uid;
      if (invFlag) {
        userModel.coins = 1;
        userInvite.coins = userInvite.coins! + 1;

        await _collectionReference
            .child(userInvite.uid!)
            .set(userInvite.toJson())
            .then((value) {});

        NotificationModel d = NotificationModel.fromJson({});
        d.uid = userInvite.uid!;
        d.arDesc = "لقد حصلت على ${1} coins مقابل دعوة صديق";
        d.enDesc = "You have ${1} coins by invite friend";
        d.type = "1";
        d.arTitle = "عمل رائع";
        d.enTitle = "Good Work";

        NotificationModel d2 = NotificationModel.fromJson({});
        d2.uid = userModel.uid!;
        d2.arDesc = "لقد حصلت على ${1} coins مقابل دعوة صديق";
        d2.enDesc = "You have ${1} coins by invite friend";
        d2.type = "1";
        d2.arTitle = "عمل رائع";
        d2.enTitle = "Good Work";
      }

      await _collectionReference
          .child(userModel.uid!)
          .set(userModel.toJson())
          .then((value) {});
    }, onError: (e) {
      // temp.arMessage = "البرد الالكتروني مستخدم مسبقأ يرجى المحاولة ببريد اخر" ;
      // temp.enMessage = "This email is already in used please try with other email";
      temp.enMessage = e.toString();
      temp.arMessage = e.toString();
      temp.state = false;
    });
    return temp;
  }

  Future<ResponseModel> updateAccount(UserModel userModel) async {
    ResponseModel temp = ResponseModel();

    await _collectionReference
        .child(userModel.uid!)
        .update(userModel.toJson())
        .then((value) {
      temp.state = true;
    });
    return temp;
  }

  Future<ResponseModel> login(
      {required String username, required String password}) async {
    ResponseModel responseModel = ResponseModel();

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password)
        .then((value) {
      responseModel.state = true;
    }, onError: (e) {
      responseModel.enMessage = "invalid username or password";
      responseModel.arMessage = "خطأ في اسم المستخدم او كلمة المرور";
      responseModel.state = false;
    });
    return responseModel;
  }

  static Future<UserModel> getCurrentUserInfo(String uid) async {
    UserModel userModel = UserModel();
    try {
      DataSnapshot snapshot = await _collectionReference.child(uid).get();

      if (snapshot.exists) {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);
        userModel = UserModel.fromJson(data);
        if (userModel.uid != null) {
          log("yesssssssssssssssssss");
        }
      } else {
        FirebaseAuth.instance.signOut();
      }
    } catch (e) {

    }
    return userModel;
  }
   static Future<List<UserAddresses>> getCurrentUserAdresses(String uid) async {
    //UserAddresses userAddresses = UserAddresses();
      
      DataSnapshot snapshot = await _collectionReference.child(uid).child("UserAddresses").get();

      if (snapshot.exists) {
        try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(snapshot.value as Map);
        final List<UserAddresses> addresses = data.entries.map((entry) {
          final address =
              UserAddresses.fromJson(Map<String, dynamic>.from(entry.value));
          return address;
        }).toList();
        log("mkmasri");
        for (UserAddresses s in addresses) {
          print(s.toString());
        }
        return addresses;
      } catch (e) {
        log('Error fetching wash packages: $e');
      }
      }
    return [];
  }

  bool isAlreadyLogin() {
    if (FirebaseAuth.instance.currentUser == null ||
        FirebaseAuth.instance.currentUser!.uid.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
