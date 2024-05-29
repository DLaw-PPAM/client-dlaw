import 'dart:convert';
import 'dart:io';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:http/http.dart' show Client;

class ApiServices {
  final String baseUrl = "https://xnxx.com";

  String get urlImage => "$baseUrl/images/";

  Client? client;

  ApiServices({this.client}) {
    client ??= Client();
  }

  // Future<LawyersResult> getLawyers() async {
  //   final response = await client!.get(Uri.parse("$baseUrl/lawyers"));
  //   if (response.statusCode == 200) {
  //     return LawyersResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load lawyers');
  //   }
  // }


  // Future<DetailLawyerResult> getDetailLawyer(int lawyerId) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/lawyers/detail/$lawyerId"));
  //   if (response.statusCode == 200) {
  //     return DetailLawyerResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load detail lawyer');
  //   }
  // }

  // Future<DetailUserResult> getDetailUser(int userId) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/users/detail/$userId"));
  //   if (response.statusCode == 200) {
  //     return DetailUserResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load detail user');
  //   }
  // }

  // Future<CasesResult> getCasesByUserId(int userId) async {
  //   final response = await client!.get(Uri.parse("$baseUrl/cases/$userId"));
  //   if (response.statusCode == 200) {
  //     return CasesResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load cases');
  //   }
  // }

  // Future<DetailCaseResult> getDetailCase(int caseId) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/cases/detail/$caseId"));
  //   if (response.statusCode == 200) {
  //     return DetailCaseResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load detail case');
  //   }
  // }

  // Future<SearchLawyersResult> getLawyersByKeyword(String keyword) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/lawyers/search/$keyword"));
  //   if (response.statusCode == 200) {
  //     return SearchLawyersResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to search lawyers');
  //   }
  // }
  Future<SearchLawyersResult> getLawyersByKeyword(String keyword) async {
    try {
      final responseBody = {
        "error": false,
        "founded": 2,
        "lawyers": [
          {
            "id": "1",
            "clientId": "1",
            "pricePerHour": 100,
            "rating": 4.5,
            "specialities": [
              {
                "name": "Criminal Law"
              },
              {
                "name": "Civil Law"
              },
            ],
            "user": {
              "id": "1",
              "username": "hotmanparis",
              "profilePicture":
                  "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
              "email": "hotman@hotmail.com",
              "password": "123456",
              "fullname": "Hotman Paris",
              "birthdate": "1960-01-01T00:00:00.000",
              "phoneNumber": "08123456789",
              "address": "Jl. Gatot Subroto No. 1",
              "bio": "Lawyer"
            }
          },
          {
            "id": "3",
            "clientId": "2",
            "pricePerHour": 300,
            "rating": 4.0,
            "specialities": [
              {
                "name": "Criminal Law"
              },
              {
                "name": "Civil Law"
              },
              {
                "name": "Family Law"
              },
              {
                "name": "Corporate Law"
              },
            ],
            "user": {
              "id": "2",
              "username": "jokowi",
              "profilePicture":
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Joko_Widodo_2019_official_portrait.jpg/220px-Joko_Widodo_2019_official_portrait.jpg",
              "email": "jokowi@ri.co.id",
              "password": "123456",
              "fullname": "Joko Widodo",
              "birthdate": "1961-06-21T00:00:00.000",
              "phoneNumber": "08123456789",
              "address": "Jl. Gatot Subroto No. 1",
              "bio": "President of Indonesia"
            }
          }
        ]
      };
      return SearchLawyersResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }


  // Future<ReviewResult> getReviewsByLawyerId(int caseId) async {
  //   final response = await client!.get(Uri.parse("$baseUrl/reviews/$caseId"));
  //   if (response.statusCode == 200) {
  //     return ReviewResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load reviews');
  //   }
  // }


  Future<ReviewResult> postReview(
    // time by default is current time
    int lawyerId,
    int userId,
    double rating,
    String description,
  ) async {
    final response = await client!.post(
      Uri.parse("$baseUrl/reviews"),
      body: jsonEncode(
        {
          "lawyerId": lawyerId,
          "clientId": userId,
          "rating": rating,
          "description": description,
        },
      ),
    );
    if (response.statusCode == 200) {
      return ReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post review');
    }
  }

  Future<ReviewResult> postCase(
    // status by default is "pending"
    int lawyerId,
    int userId,
    String subject,
    String media,
    String notes,
    double consultationFee,
    double hourlyFee,
    double additionFee,
  ) async {
    final response = await client!.post(
      Uri.parse("$baseUrl/cases"),
      body: jsonEncode(
        {
          "lawyerId": lawyerId,
          "clientId": userId,
          "subject": subject,
          "media": media,
          "notes": notes,
          "consultationFee": consultationFee,
          "hourlyFee": hourlyFee,
          "additionFee": additionFee,
        },
      ),
    );
    if (response.statusCode == 200) {
      return ReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post case');
    }
  }

  Future<ReviewResult> updateCaseById(
    // status by default is "pending"
    int caseId,
    String subject,
    String media,
    String notes,
    double consultationFee,
    double hourlyFee,
    double additionFee,
  ) async {
    final response = await client!.put(
      Uri.parse("$baseUrl/cases/$caseId"),
      body: jsonEncode(
        {
          "subject": subject,
          "media": media,
          "notes": notes,
          "consultationFee": consultationFee,
          "hourlyFee": hourlyFee,
          "additionFee": additionFee,
        },
      ),
    );
    if (response.statusCode == 200) {
      return ReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update case');
    }
  }

  Future<ReviewResult> updateUserById(
    int clientId,
    String username,
    String profilePicture,
    // String email, // email cannot be updated
    String password,
    String fullname,
    DateTime birthdate,
    String phoneNumber,
    String address,
    String bio,
  ) async {
    final response = await client!.put(
      Uri.parse("$baseUrl/users/$clientId"),
      body: jsonEncode(
        {
          "username": username,
          "profilePicture": profilePicture,
          // "email": email,
          "password": password,
          "fullname": fullname,
          "birthdate": birthdate.toIso8601String(),
          "phoneNumber": phoneNumber,
          "address": address,
          "bio": bio,
        },
      ),
    );
    if (response.statusCode == 200) {
      return ReviewResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }
}
