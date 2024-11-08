import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../models/events_model.dart'; // Ensure this path is correct


class IsarService {
  static Isar? _isar;


  static Future<void> init() async {
    if (_isar != null) return;
    try {
      final appDocDir = await _getAppDocumentDirectory();
      _isar = await Isar.open(
        [EventSchema],
        directory: appDocDir.path,
        inspector: true,
      );
      print('Isar initialized successfully');
    } catch (e) {
      print("Error initializing Isar database: $e");
    }
  }

  // Get the application's document directory
  static Future<Directory> _getAppDocumentDirectory() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return directory;
    } catch (e) {
      print("Error getting app document directory: $e");
      rethrow; // Optionally rethrow if you want to propagate the error
    }
  }

  // Create or update an Event
  static Future<void> saveEvent(Event event) async {
    if (_isar == null) {
      print("Isar is not initialized");
      return;
    }

    try {
      await _isar!.writeTxn(() async {
        await _isar!.events.put(event);
        print('Event added or updated');
      });
    } catch (e) {
      print("Error saving event: $e");
    }
  }

  // Add a new Event
  static Future<void> addEvent(Event event) async {
    try {
      await saveEvent(event); // Reuse the saveEvent function for adding an event
      print('Event added');
    } catch (e) {
      print("Error adding event: $e");
    }
  }

  // Fetch all Events
  static Future<List<Event>> getAllEvents() async {
    if (_isar == null) {
      print("Isar is not initialized");
      return [];
    }

    try {
      return await _isar!.events.where().findAll();
    } catch (e) {
      print("Error fetching all events: $e");
      return []; // Return an empty list on error
    }
  }

  // Fetch a specific Event by ID
  static Future<Event?> getEventById(int id) async {
    if (_isar == null) {
      print("Isar is not initialized");
      return null;
    }

    try {
      return await _isar!.events.get(id);
    } catch (e) {
      print("Error fetching event by ID: $e");
      return null; // Return null if there's an error
    }
  }

  // Delete an Event by ID
  static Future<void> deleteEventById(int id) async {
    if (_isar == null) {
      print("Isar is not initialized");
      return;
    }

    try {
      await _isar!.writeTxn(() async {
        await _isar!.events.delete(id);
        print('Event deleted');
      });
    } catch (e) {
      print("Error deleting event: $e");
    }
  }

  // Delete all events
  static Future<void> deleteAllEvents() async {
    if (_isar == null) {
      print("Isar is not initialized");
      return;
    }

    try {
      await _isar!.writeTxn(() async {
        await _isar!.events.clear();
        print('All events deleted');
      });
    } catch (e) {
      print("Error deleting all events: $e");
    }
  }

  // Close the Isar database
  static Future<void> close() async {
    if (_isar == null) {
      print("Isar is not initialized");
      return;
    }

    try {
      await _isar!.close();
      print('Isar closed');
    } catch (e) {
      print("Error closing Isar database: $e");
    }
  }
}
