
import 'dart:io';

import '../../models/User.dart';

abstract class UserRepo {

  // Create a new user
  Future<void> createUser(AUser user);

  // Retrieve a user by ID
  Future<AUser?> getUserById(int id);

  // Update an existing user
  Future<void> updateUser(AUser user);

  // Update an existing user
  Future<String> uploadUserImage(File ImageFile);

  // Delete a user by ID
  Future<void> deleteUser(int id);
}
