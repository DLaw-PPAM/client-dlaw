import 'dart:convert';
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
  Future<LawyersResult> getLawyers() async {
    try {
      final responseBody = {
        "error": false,
        "message": "Success",
        "lawyers": [
          {
            "id": "1",
            "clientId": "1",
            "pricePerHour": 100,
            "rating": 4.5,
            "specialities": [
              {"name": "Criminal Law"},
              {"name": "Civil Law"}
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
              "phoneNumber": "6282343765854",
              "address": "Jl. Gatot Subroto No. 1",
              "bio":
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
            }
          },
          {
            "id": "3",
            "clientId": "2",
            "pricePerHour": 300,
            "rating": 4.0,
            "specialities": [
              {"name": "Criminal Law"},
              {"name": "Civil Law"},
              {"name": "Family Law"},
              {"name": "Corporate Law"}
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
              "phoneNumber": "6282343765854",
              "address": "Jl. Gatot Subroto No. 1",
              "bio": "President of Indonesia"
            }
          }
        ]
      };
      return LawyersResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Future<DetailLawyerResult> getDetailLawyer(String lawyerId) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/lawyers/detail/$lawyerId"));
  //   if (response.statusCode == 200) {
  //     return DetailLawyerResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load detail lawyer');
  //   }
  // }
  Future<DetailLawyerResult> getDetailLawyer(String lawyerId) async {
    try {
      final responseBody = {
        "error": false,
        "message": "Success",
        "lawyer": {
          "id": "1",
          "clientId": "1",
          "pricePerHour": 100,
          "rating": 4.5,
          "specialities": [
            {"name": "Criminal Law"},
            {"name": "Family Law"}
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
            "phoneNumber": "6282343765854",
            "address": "Jl. Gatot Subroto No. 1",
            "bio":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
          },
          "reviews": [
            {
              "id": "1",
              "rating": 4.5,
              "description": "Great lawyer, very helpful",
              "timestamp": "2024-05-28T00:00:00.000Z",
              "lawyerId": "1",
              "clientId": "1",
              "clientName": "John Doe"
            },
            {
              "id": "2",
              "rating": 3.5,
              "description": "Good lawyer, but need to improve",
              "timestamp": "2024-05-28T00:00:00.000Z",
              "lawyerId": "2",
              "clientId": "2",
              "clientName": "John Doe"
            },
            {
              "id": "3",
              "rating": 5,
              "description": "Excellent lawyer, very professional",
              "timestamp": "2024-05-28T00:00:00.000Z",
              "lawyerId": "1",
              "clientId": "3",
              "clientName": "John Doe"
            },
            {
              "id": "4",
              "rating": 4,
              "description": "Very helpful lawyer, highly recommended",
              "timestamp": "2024-05-28T00:00:00.000Z",
              "lawyerId": "2",
              "clientId": "4",
              "clientName": "John Doe"
            }
          ]
        }
      };
      return DetailLawyerResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Future<DetailUserResult> getDetailUser(String userId) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/users/detail/$userId"));
  //   if (response.statusCode == 200) {
  //     return DetailUserResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load detail user');
  //   }
  // }
  Future<DetailUserResult> getDetailUser(String userId) async {
    try {
      final responseBody = {
        "error": false,
        "message": "Success",
        "user": {
          "id": "1",
          "username": "hotmanparis",
          "profilePicture":
              "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
          "email": "hotman@hotmail.com",
          "password": "123456",
          "fullname": "Hotman Paris",
          "birthdate": "1960-01-01T00:00:00.000",
          "phoneNumber": "6282343765854",
          "address": "Jl. Gatot Subroto No. 1",
          "bio":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        }
      };
      return DetailUserResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Future<CasesResult> getCasesByUserId(String userId) async {
  //   final response = await client!.get(Uri.parse("$baseUrl/cases/$userId"));
  //   if (response.statusCode == 200) {
  //     return CasesResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load cases');
  //   }
  // }
  Future<CasesResult> getCasesByUserId(String userId) async {
    try {
      final responseBody = {
        "error": false,
        "message": "Success",
        "cases": [
          {
            "id": "1",
            "subject": "Divorce",
            "media": "https://www.youtube.com/watch?v=9bZkp7q19f0",
            "notes": "Need help with divorce process",
            "status": "On Going",
            "hour": 2,
            "additionFee": 0,
            "lawyerId": "1",
            "clientId": "1"
          },
          {
            "id": "2",
            "subject": "Criminal",
            "media": "https://www.youtube.com/watch?v=9bZkp7q19f0",
            "notes": "Need help with criminal case",
            "status": "On Going",
            "hour": 3,
            "additionFee": 0,
            "lawyerId": "1",
            "clientId": "2"
          },
          {
            "id": "3",
            "subject": "Business",
            "media": "https://www.youtube.com/watch?v=9bZkp7q19f0",
            "notes": "Need help with business law",
            "status": "On Going",
            "hour": 4,
            "additionFee": 0,
            "lawyerId": "2",
            "clientId": "3"
          },
          {
            "id": "4",
            "subject": "Family",
            "media": "https://www.youtube.com/watch?v=9bZkp7q19f0",
            "notes": "Need help with family law",
            "status": "On Going",
            "hour": 5,
            "additionFee": 0,
            "lawyerId": "2",
            "clientId": "4"
          }
        ]
      };
      return CasesResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Future<DetailCaseResult> getDetailCase(String caseId) async {
  //   final response =
  //       await client!.get(Uri.parse("$baseUrl/cases/detail/$caseId"));
  //   if (response.statusCode == 200) {
  //     return DetailCaseResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load detail case');
  //   }
  // }
  Future<DetailCaseResult> getDetailCase(String caseId) async {
    try {
      final responseBody = {
        "error": false,
        "message": "Success",
        "case": {
          "id": "1",
          "subject": "Divorce",
          "media": "https://www.youtube.com/watch?v=9bZkp7q19f0",
          "notes": "Need help with divorce process",
          "status": "On Going",
          "hour": 2,
          "additionFee": 0,
          "lawyerId": "1",
          "clientId": "1"
        }
      };
      return DetailCaseResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

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
              {"name": "Criminal Law"},
              {"name": "Civil Law"},
            ],
            "reviews": [
              {
                "id": "1",
                "rating": 4.5,
                "description": "Great lawyer, very helpful",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "1",
                "clientId": "1",
                "clientName": "John Doe"
              },
              {
                "id": "2",
                "rating": 3.5,
                "description": "Good lawyer, but need to improve",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "2",
                "clientId": "2",
                "clientName": "John Doe"
              },
              {
                "id": "3",
                "rating": 5,
                "description": "Excellent lawyer, very professional",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "1",
                "clientId": "3",
                "clientName": "John Doe"
              },
              {
                "id": "4",
                "rating": 4,
                "description": "Very helpful lawyer, highly recommended",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "2",
                "clientId": "4",
                "clientName": "John Doe"
              }
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
              "phoneNumber": "6282343765854",
              "address": "Jl. Gatot Subroto No. 1",
              "bio":
                  "Hotman was born on 20 October 1959 in Laguboti, a village in Toba Regency, North Sumatra. He was the sixth of 10 children in a Protestant Batak family.[3] His first name was taken from the Batak word hotma, which means 'steady'. His father ran an intercity bus company called Bintang Utara and often had to live away from home in the North Sumatran capital of Medan. His mother remained at Laguboti and encouraged the children to eat healthily, especially fish and papaya leaves, so they would develop high IQs. Eight of the 10 children became university graduates."
            }
          },
          {
            "id": "3",
            "clientId": "2",
            "pricePerHour": 300,
            "rating": 4.0,
            "specialities": [
              {"name": "Criminal Law"},
              {"name": "Civil Law"},
              {"name": "Family Law"},
              {"name": "Corporate Law"},
            ],
            "reviews": [
              {
                "id": "1",
                "rating": 4.5,
                "description": "Great lawyer, very helpful",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "1",
                "clientId": "1",
                "clientName": "John Doe"
              },
              {
                "id": "2",
                "rating": 3.5,
                "description": "Good lawyer, but need to improve",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "2",
                "clientId": "2",
                "clientName": "John Doe"
              },
              {
                "id": "3",
                "rating": 5,
                "description": "Excellent lawyer, very professional",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "1",
                "clientId": "3",
                "clientName": "John Doe"
              },
              {
                "id": "4",
                "rating": 4,
                "description": "Very helpful lawyer, highly recommended",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyerId": "2",
                "clientId": "4",
                "clientName": "John Doe"
              }
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
              "phoneNumber": "6282343765854",
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

  // Future<ReviewResult> getReviewsByLawyerId(String caseId) async {
  //   final response = await client!.get(Uri.parse("$baseUrl/reviews/$caseId"));
  //   if (response.statusCode == 200) {
  //     return ReviewResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load reviews');
  //   }
  // }
  Future<ReviewsResult> getReviewsByLawyerId(String caseId) async {
    try {
      final responseBody = {
        "error": false,
        "message": "Success",
        "reviews": [
          {
            "id": "1",
            "rating": 4.5,
            "description": "Great lawyer, very helpful",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyerId": "1",
            "clientId": "1",
            "clientName": "John Doe"
          },
          {
            "id": "2",
            "rating": 3.5,
            "description": "Good lawyer, but need to improve",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyerId": "2",
            "clientId": "2",
            "clientName": "Jane Doe"
          },
          {
            "id": "3",
            "rating": 5,
            "description": "Excellent lawyer, very professional",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyerId": "1",
            "clientId": "3",
            "clientName": "John Doe"
          },
          {
            "id": "4",
            "rating": 4,
            "description": "Very helpful lawyer, highly recommended",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyerId": "2",
            "clientId": "4",
            "clientName": "Jane Doe"
          }
        ]
      };
      return ReviewsResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<ReviewsResult> postReview({
    required lawyerId,
    required userId,
    required double rating,
    required String description,
  }) async {
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
      return ReviewsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post review');
    }
  }

  Future<ReviewsResult> postCase(
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
      return ReviewsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post case');
    }
  }

  Future<ReviewsResult> updateCaseById(
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
      return ReviewsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update case');
    }
  }

  Future<ReviewsResult> updateUserById(
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
      return ReviewsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }
}
