// import 'dart:io'; // For File and Directory
// import 'package:path_provider/path_provider.dart';
// import 'package:isar/isar.dart';
// import 'models.dart';
//
// class IsarService {
//   late Isar _isar;
//
//   // Initialize Isar with the directory path
//   Future<void> init() async {
//     final appDocDir = await _getAppDocumentDirectory();
//
//     // Initialize Isar with the directory path
//     _isar = await Isar.open(
//       schemas: [UserSchema], // Add your model schema here
//       directory: appDocDir.path, // Pass the path to the Isar database location
//       inspector: true, // Optional: enable Isar Inspector in development mode
//     );
//   }
//
//   // Get the application's document directory
//   Future<Directory> _getAppDocumentDirectory() async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory;
//   }
//
//   // Add a new user to the database
//   Future<void> addUser(User user) async {
//     await _isar.writeTxn(() async {
//       await _isar.users.put(user); // Save user to Isar
//     });
//   }
//
//   // Edit an existing user
//   Future<void> updateUser(User user) async {
//     await _isar.writeTxn(() async {
//       await _isar.users.put(user); // If ID exists, it will update the user
//     });
//   }
//
//   // Fetch all users
//   Future<List<User>> getUsers() async {
//     return await _isar.users.where().findAll(); // Get all users
//   }
//
//   // Fetch a user by ID
//   Future<User?> getUserById(int id) async {
//     return await _isar.users.get(id); // Get user by ID
//   }
//
//   // Delete a user by ID
//   Future<void> deleteUser(int id) async {
//     await _isar.writeTxn(() async {
//       await _isar.users.delete(id); // Delete the user by ID
//     });
//   }
//
//   // Close the Isar database (usually when app is exiting)
//   Future<void> close() async {
//     await _isar.close();
//   }
// }
