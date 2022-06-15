// /*
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
//
// const String _PET_COLORS = 'petColors';
//
// class RemoteConfigService {
//   final RemoteConfig _remoteConfig;
//
//   RemoteConfigService({RemoteConfig remoteConfig})
//       : _remoteConfig = remoteConfig;
//
//   final defaults = <String, dynamic>{
//     _PET_COLORS: "Flutter Firebase",
//   };
//
//   static RemoteConfigService _instance;
//
//   static Future<RemoteConfigService> getInstance() async {
//     if (_instance == null) {
//       _instance = RemoteConfigService(
//         remoteConfig: await RemoteConfig.instance,
//       );
//     }
//     return _instance;
//   }
//
//   // bool get getBoolValue => _remoteConfig.getBool(_BOOLEAN_VALUE);
//   // int get getIntValue => _remoteConfig.getInt(_INT_VALUE);
//   String get getPetColors => _remoteConfig.getString(_PET_COLORS);
//
//   Future initialize() async {
//     try {
//       await _remoteConfig.setDefaults(defaults);
//       await _fetchAndActivate();
//     } on FirebaseException catch (e) {
//       print("Rmeote Config fetch throttled: $e");
//     } catch (e) {
//       print(e);
//       print("Unable to fetch remote config. Default value will be used");
//     }
//   }
//
//   Future _fetchAndActivate() async {
//     await _remoteConfig.ensureInitialized();
//     bool updated = await _remoteConfig.fetchAndActivate();
//     if (updated) {
//       // the config has been updated, new parameter values are available.
//     } else {}
//     // print("boolean::: $getBoolValue");
//     // print("int::: $getIntValue");
//     print("string::: $getPetColors");
//   }
//   Future<RemoteConfig> setupRemoteConfig() async {
//     await Firebase.initializeApp();
//     final RemoteConfig remoteConfig = RemoteConfig.instance;
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//       fetchTimeout: const Duration(seconds: 10),
//       minimumFetchInterval: const Duration(hours: 1),
//     ));
//     await remoteConfig.setDefaults(defaults);
//     remoteConfig.fetchAndActivate();
//     print("string:::"
//         +getPetColors);
//     RemoteConfigValue(null, ValueSource.valueStatic);
//     return remoteConfig;
//   }
// }
// */
