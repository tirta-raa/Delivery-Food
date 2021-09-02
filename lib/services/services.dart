import 'dart:convert';
import 'dart:io';

import 'package:deliveryfood/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'food_services.dart';
part 'transaction_services.dart';

//* di buat base url jadi ga usah ngetik url lagi
String baseUrl = 'http://foodmarket-backend.buildwithangga.id/api/';
