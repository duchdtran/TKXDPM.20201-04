import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();

  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ecobike_rental.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE Station(station_id INTEGER PRIMARY KEY, address_id INTEGER, contact_name TEXT, email TEXT, phone TEXT, area REAL)');
    await db.execute(
        'CREATE TABLE BikeInStation(station_id INTEGER PRIMARY KEY, bike_id INTEGER, datetime_in TEXT, datetime_out TEXT)');
    await db.execute(
        'CREATE TABLE Bike(bike_id INTEGER PRIMARY KEY, bike_name INTEGER, description TEXT, size REAL, starting_rent INTERGER, hourly_rent INTERGER, bike_type INTERGER, license_plates TEXT, battery_capacity INTERGER, power_drain REAL, deposits INTERGER)');
    await db.execute(
        'CREATE TABLE Address(address_id INTEGER PRIMARY KEY, address_name TEXT, longitude REAL, latitude REAL)');
    await db.execute(
        'CREATE TABLE Transection(transection_id INTEGER PRIMARY KEY, rental_id INTEGER, payment_status TEXT, booked_start_date_time TEXT, book_end_date_time TEXT)');
    await db.execute(
        'CREATE TABLE Rental(rental_id INTEGER PRIMARY KEY, renter_id INTEGER, card_id TEXT, rate_content TEXT, rate_number INTERGER)');
    await db.execute(
        'CREATE TABLE Renter(renter_id INTEGER PRIMARY KEY, renter_name INTEGER)');
    await db.execute(
        'CREATE TABLE Card(card_id INTEGER PRIMARY KEY, renter_id INTEGER, payment_method TEXT, cvv TEXT, expiration_date TEXT)');

  }
}
