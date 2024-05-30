import 'dart:convert';
import 'package:client_dlaw/data/response/responses.dart';
import 'package:http/http.dart' show Client;

class ApiServices {
  final String baseUrl = "http://127.0.0.1:8080/api/v1";

  String get urlImage => "$baseUrl/images/";

  Client? client;

  ApiServices({this.client}) {
    client ??= Client();
  }

  Future<LawyersResult> getLawyers() async {
    final response = await client!.get(Uri.parse("$baseUrl/lawyers"));
    if (response.statusCode == 200) {
      return LawyersResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load lawyers');
    }
  }
  // Future<LawyersResult> getLawyers() async {
  //   try {
  //     final responseBody = {
  //       "error": false,
  //       "message": "Success",
  //       "lawyers": [
  //         {
  //           "id": "1",
  //           "client_id": "1",
  //           "price_per_hour": 100,
  //           "rating": 4.5,
  //           "Specialties": [
  //             {"name": "Criminal Law"},
  //             {"name": "Civil Law"}
  //           ],
  //           "User": {
  //             "id": "1",
  //             "username": "hotmanparis",
  //             "profile_picture":
  //                 "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
  //             "email": "hotman@hotmail.com",
  //             "password": "123456",
  //             "full_name": "Hotman Paris",
  //             "birth_date": "1960-01-01T00:00:00.000",
  //             "phone_number": "82343765854",
  //             "address": "Jl. Gatot Subroto No. 1",
  //             "bio":
  //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
  //           }
  //         },
  //         {
  //           "id": "3",
  //           "client_id": "2",
  //           "price_per_hour": 300,
  //           "rating": 4.0,
  //           "Specialties": [
  //             {"name": "Criminal Law"},
  //             {"name": "Civil Law"},
  //             {"name": "Family Law"},
  //             {"name": "Corporate Law"}
  //           ],
  //           "User": {
  //             "id": "2",
  //             "username": "jokowi",
  //             "profile_picture":
  //                 "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Joko_Widodo_2019_official_portrait.jpg/220px-Joko_Widodo_2019_official_portrait.jpg",
  //             "email": "jokowi@ri.co.id",
  //             "password": "123456",
  //             "full_name": "Joko Widodo",
  //             "birth_date": "1961-06-21T00:00:00.000",
  //             "phone_number": "82343765854",
  //             "address": "Jl. Gatot Subroto No. 1",
  //             "bio": "President of Indonesia"
  //           }
  //         }
  //       ]
  //     };
  //     return LawyersResult.fromJson(responseBody);
  //   } catch (e) {
  //     throw Exception('An error occurred: $e');
  //   }
  // }

  Future<DetailLawyerResult> getDetailLawyer(String lawyer_id) async {
    final response =
        await client!.get(Uri.parse("$baseUrl/lawyers/$lawyer_id"));
    if (response.statusCode == 200) {
      try {
        final responseBody = json.decode(response.body);

        final lawyer = responseBody['lawyer'];

        final body = {
          "error": false,
          "message": "Success",
          "lawyer": lawyer,
        };

        return DetailLawyerResult.fromJson(body);
      } catch (e) {
        throw Exception('An error occurred while get detail lawyer: $e');
      }
    } else {
      throw Exception('Failed to load detail lawyer');
    }
  }

  // Future<DetailLawyerResult> getDetailLawyer(String lawyer_id) async {
  //   try {
  //     final responseBody = {
  //       "error": false,
  //       "message": "Success",
  //       "Lawyer": {
  //         "id": "1",
  //         "client_id": "1",
  //         "price_per_hour": 100,
  //         "rating": 4.5,
  //         "Specialties": [
  //           {"name": "Criminal Law"},
  //           {"name": "Family Law"}
  //         ],
  //         "User": {
  //           "id": "1",
  //           "username": "hotmanparis",
  //           "profile_picture":
  //               "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
  //           "email": "hotman@hotmail.com",
  //           "password": "123456",
  //           "full_name": "Hotman Paris",
  //           "birth_date": "1960-01-01T00:00:00.000",
  //           "phone_number": "82343765854",
  //           "address": "Jl. Gatot Subroto No. 1",
  //           "bio":
  //               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
  //         },
  //         "Reviews": [
  //           {
  //             "id": "1",
  //             "rating": 4.5,
  //             "description": "Great lawyer, very helpful",
  //             "timestamp": "2024-05-28T00:00:00.000Z",
  //             "lawyer_id": "1",
  //             "client_id": "1",
  //             "client_name": "John Doe"
  //           },
  //           {
  //             "id": "2",
  //             "rating": 3.5,
  //             "description": "Good lawyer, but need to improve",
  //             "timestamp": "2024-05-28T00:00:00.000Z",
  //             "lawyer_id": "2",
  //             "client_id": "2",
  //             "client_name": "John Doe"
  //           },
  //           {
  //             "id": "3",
  //             "rating": 5,
  //             "description": "Excellent lawyer, very professional",
  //             "timestamp": "2024-05-28T00:00:00.000Z",
  //             "lawyer_id": "1",
  //             "client_id": "3",
  //             "client_name": "John Doe"
  //           },
  //           {
  //             "id": "4",
  //             "rating": 4,
  //             "description": "Very helpful lawyer, highly recommended",
  //             "timestamp": "2024-05-28T00:00:00.000Z",
  //             "lawyer_id": "2",
  //             "client_id": "4",
  //             "client_name": "John Doe"
  //           }
  //         ]
  //       }
  //     };
  //     return DetailLawyerResult.fromJson(responseBody);
  //   } catch (e) {
  //     throw Exception('An error occurred: $e');
  //   }
  // }

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
        "User": {
          "id": "1",
          "username": "hotmanparis",
          "profile_picture":
              "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
          "email": "hotman@hotmail.com",
          "password": "123456",
          "full_name": "Hotman Paris",
          "birth_date": "1960-01-01T00:00:00.000",
          "phone_number": "82343765854",
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
            "media": "",
            "notes": "Need help with divorce process",
            "status": "On Going",
            "hour": 2,
            "addition_fee": 0,
            "lawyer_id": "1",
            "client_id": "1",
            "Lawyer": {
              "id": "1",
              "client_id": "1",
              "price_per_hour": 100,
              "rating": 4.5,
              "Specialties": [
                {"name": "Criminal Law"},
                {"name": "Family Law"}
              ],
              "User": {
                "id": "1",
                "username": "hotmanparis",
                "profile_picture":
                    "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
                "email": "hotman@hotmail.com",
                "password": "123456",
                "full_name": "Hotman Paris",
                "birth_date": "1960-01-01T00:00:00.000",
                "phone_number": "82343765854",
                "address": "Jl. Gatot Subroto No. 1",
                "bio":
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
              },
              "Reviews": [
                {
                  "id": "1",
                  "rating": 4.5,
                  "description": "Great lawyer, very helpful",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "1",
                  "client_name": "John Doe"
                },
                {
                  "id": "2",
                  "rating": 3.5,
                  "description": "Good lawyer, but need to improve",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "2",
                  "client_name": "John Doe"
                },
                {
                  "id": "3",
                  "rating": 5,
                  "description": "Excellent lawyer, very professional",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "3",
                  "client_name": "John Doe"
                },
                {
                  "id": "4",
                  "rating": 4,
                  "description": "Very helpful lawyer, highly recommended",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "4",
                  "client_name": "John Doe"
                }
              ]
            }
          },
          {
            "id": "2",
            "subject": "Criminal",
            "media": "",
            "notes": "Need help with criminal case",
            "status": "On Going",
            "hour": 3,
            "addition_fee": 0,
            "lawyer_id": "1",
            "client_id": "2",
            "Lawyer": {
              "id": "1",
              "client_id": "1",
              "price_per_hour": 100,
              "rating": 4.5,
              "Specialties": [
                {"name": "Criminal Law"},
                {"name": "Family Law"}
              ],
              "User": {
                "id": "1",
                "username": "hotmanparis",
                "profile_picture":
                    "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
                "email": "hotman@hotmail.com",
                "password": "123456",
                "full_name": "Hotman Paris",
                "birth_date": "1960-01-01T00:00:00.000",
                "phone_number": "82343765854",
                "address": "Jl. Gatot Subroto No. 1",
                "bio":
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
              },
              "Reviews": [
                {
                  "id": "1",
                  "rating": 4.5,
                  "description": "Great lawyer, very helpful",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "1",
                  "client_name": "John Doe"
                },
                {
                  "id": "2",
                  "rating": 3.5,
                  "description": "Good lawyer, but need to improve",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "2",
                  "client_name": "John Doe"
                },
                {
                  "id": "3",
                  "rating": 5,
                  "description": "Excellent lawyer, very professional",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "3",
                  "client_name": "John Doe"
                },
                {
                  "id": "4",
                  "rating": 4,
                  "description": "Very helpful lawyer, highly recommended",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "4",
                  "client_name": "John Doe"
                }
              ]
            }
          },
          {
            "id": "3",
            "subject": "Business",
            "media": "",
            "notes": "Need help with business law",
            "status": "On Going",
            "hour": 4,
            "addition_fee": 0,
            "lawyer_id": "2",
            "client_id": "3",
            "Lawyer": {
              "id": "1",
              "client_id": "1",
              "price_per_hour": 100,
              "rating": 4.5,
              "Specialties": [
                {"name": "Criminal Law"},
                {"name": "Family Law"}
              ],
              "User": {
                "id": "1",
                "username": "hotmanparis",
                "profile_picture":
                    "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
                "email": "hotman@hotmail.com",
                "password": "123456",
                "full_name": "Hotman Paris",
                "birth_date": "1960-01-01T00:00:00.000",
                "phone_number": "82343765854",
                "address": "Jl. Gatot Subroto No. 1",
                "bio":
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
              },
              "Reviews": [
                {
                  "id": "1",
                  "rating": 4.5,
                  "description": "Great lawyer, very helpful",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "1",
                  "client_name": "John Doe"
                },
                {
                  "id": "2",
                  "rating": 3.5,
                  "description": "Good lawyer, but need to improve",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "2",
                  "client_name": "John Doe"
                },
                {
                  "id": "3",
                  "rating": 5,
                  "description": "Excellent lawyer, very professional",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "3",
                  "client_name": "John Doe"
                },
                {
                  "id": "4",
                  "rating": 4,
                  "description": "Very helpful lawyer, highly recommended",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "4",
                  "client_name": "John Doe"
                }
              ]
            }
          },
          {
            "id": "4",
            "subject": "Family",
            "media": "",
            "notes": "Need help with family law",
            "status": "On Going",
            "hour": 5,
            "addition_fee": 0,
            "lawyer_id": "2",
            "client_id": "4",
            "Lawyer": {
              "id": "1",
              "client_id": "1",
              "price_per_hour": 100,
              "rating": 4.5,
              "Specialties": [
                {"name": "Criminal Law"},
                {"name": "Family Law"}
              ],
              "User": {
                "id": "1",
                "username": "hotmanparis",
                "profile_picture":
                    "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
                "email": "hotman@hotmail.com",
                "password": "123456",
                "full_name": "Hotman Paris",
                "birth_date": "1960-01-01T00:00:00.000",
                "phone_number": "82343765854",
                "address": "Jl. Gatot Subroto No. 1",
                "bio":
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
              },
              "Reviews": [
                {
                  "id": "1",
                  "rating": 4.5,
                  "description": "Great lawyer, very helpful",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "1",
                  "client_name": "John Doe"
                },
                {
                  "id": "2",
                  "rating": 3.5,
                  "description": "Good lawyer, but need to improve",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "2",
                  "client_name": "John Doe"
                },
                {
                  "id": "3",
                  "rating": 5,
                  "description": "Excellent lawyer, very professional",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "1",
                  "client_id": "3",
                  "client_name": "John Doe"
                },
                {
                  "id": "4",
                  "rating": 4,
                  "description": "Very helpful lawyer, highly recommended",
                  "timestamp": "2024-05-28T00:00:00.000Z",
                  "lawyer_id": "2",
                  "client_id": "4",
                  "client_name": "John Doe"
                }
              ]
            }
          }
        ]
      };
      return CasesResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred while get cases: $e');
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
          "media": "",
          "notes": "Need help with divorce process",
          "status": "On Going",
          "hour": 2,
          "addition_fee": 0,
          "lawyer_id": "1",
          "client_id": "1",
          "Lawyer": {
            "id": "1",
            "client_id": "1",
            "price_per_hour": 100,
            "rating": 4.5,
            "Specialties": [
              {"name": "Criminal Law"},
              {"name": "Family Law"}
            ],
            "User": {
              "id": "1",
              "username": "hotmanparis",
              "profile_picture":
                  "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
              "email": "hotman@hotmail.com",
              "password": "123456",
              "full_name": "Hotman Paris",
              "birth_date": "1960-01-01T00:00:00.000",
              "phone_number": "82343765854",
              "address": "Jl. Gatot Subroto No. 1",
              "bio":
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
            },
            "Reviews": [
              {
                "id": "1",
                "rating": 4.5,
                "description": "Great lawyer, very helpful",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyer_id": "1",
                "client_id": "1",
                "client_name": "John Doe"
              },
              {
                "id": "2",
                "rating": 3.5,
                "description": "Good lawyer, but need to improve",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyer_id": "2",
                "client_id": "2",
                "client_name": "John Doe"
              },
              {
                "id": "3",
                "rating": 5,
                "description": "Excellent lawyer, very professional",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyer_id": "1",
                "client_id": "3",
                "client_name": "John Doe"
              },
              {
                "id": "4",
                "rating": 4,
                "description": "Very helpful lawyer, highly recommended",
                "timestamp": "2024-05-28T00:00:00.000Z",
                "lawyer_id": "2",
                "client_id": "4",
                "client_name": "John Doe"
              }
            ]
          }
        }
      };
      return DetailCaseResult.fromJson(responseBody);
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<LawyersResult> getLawyersByKeyword(String keyword) async {
    final response = await client!.get(Uri.parse("$baseUrl/lawyers"));
    if (response.statusCode == 200) {
      try {
        final responseBody = json.decode(response.body);

        final List<dynamic> lawyersList =
            responseBody['lawyers'] as List<dynamic>;

        final filteredLawyers = lawyersList 
            .where((lawyer) =>
                lawyer['User']['full_name']
                    .toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ||
                lawyer['User']['username']
                    .toString()
                    .toLowerCase()
                    .contains(keyword.toLowerCase()))
            .toList();

        final filteredLawyersMap = {
          "error": false,
          "message": "Success",
          "lawyers": keyword.isEmpty ? lawyersList : filteredLawyers,
        };

        return LawyersResult.fromJson(filteredLawyersMap);
      } catch (e) {
        throw Exception('An error occurred while search lawyers: $e');
      }
    } else {
      throw Exception('Failed to search lawyers');
    }
  }

  // Future<LawyersResult> getLawyersByKeyword(String keyword) async {
  //   try {
  //     final responseBody = {
  //       "error": false,
  //       "message": "Success",
  //       "lawyers": [
  //         {
  //           "id": "1",
  //           "client_id": "1",
  //           "price_per_hour": 100,
  //           "rating": 4.5,
  //           "Specialties": [
  //             {"name": "Criminal Law"},
  //             {"name": "Civil Law"}
  //           ],
  //           "User": {
  //             "id": "1",
  //             "username": "hotmanparis",
  //             "profile_picture":
  //                 "https://thumb.viva.co.id/media/frontend/tokoh/2016/10/28/5812f6954260f-hotman-paris_216_287.jpg",
  //             "email": "hotman@hotmail.com",
  //             "password": "123456",
  //             "full_name": "Hotman Paris",
  //             "birth_date": "1960-01-01T00:00:00.000",
  //             "phone_number": "82343765854",
  //             "address": "Jl. Gatot Subroto No. 1",
  //             "bio":
  //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
  //           },
  //           "Reviews": [
  //             {
  //               "id": "1",
  //               "rating": 4.5,
  //               "description": "Great lawyer, very helpful",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "1",
  //               "client_id": "1",
  //               "client_name": "John Doe"
  //             },
  //             {
  //               "id": "2",
  //               "rating": 3.5,
  //               "description": "Good lawyer, but need to improve",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "2",
  //               "client_id": "2",
  //               "client_name": "John Doe"
  //             },
  //             {
  //               "id": "3",
  //               "rating": 5,
  //               "description": "Excellent lawyer, very professional",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "1",
  //               "client_id": "3",
  //               "client_name": "John Doe"
  //             },
  //             {
  //               "id": "4",
  //               "rating": 4,
  //               "description": "Very helpful lawyer, highly recommended",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "2",
  //               "client_id": "4",
  //               "client_name": "John Doe"
  //             }
  //           ]
  //         },
  //         {
  //           "id": "3",
  //           "client_id": "2",
  //           "price_per_hour": 300,
  //           "rating": 4.0,
  //           "Specialties": [
  //             {"name": "Criminal Law"},
  //             {"name": "Civil Law"},
  //             {"name": "Family Law"},
  //             {"name": "Corporate Law"}
  //           ],
  //           "User": {
  //             "id": "2",
  //             "username": "jokowi",
  //             "profile_picture":
  //                 "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Joko_Widodo_2019_official_portrait.jpg/220px-Joko_Widodo_2019_official_portrait.jpg",
  //             "email": "jokowi@ri.co.id",
  //             "password": "123456",
  //             "full_name": "Joko Widodo",
  //             "birth_date": "1961-06-21T00:00:00.000",
  //             "phone_number": "82343765854",
  //             "address": "Jl. Gatot Subroto No. 1",
  //             "bio": "President of Indonesia"
  //           },
  //           "Reviews": [
  //             {
  //               "id": "1",
  //               "rating": 4.5,
  //               "description": "Great lawyer, very helpful",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "1",
  //               "client_id": "1",
  //               "client_name": "John Doe"
  //             },
  //             {
  //               "id": "2",
  //               "rating": 3.5,
  //               "description": "Good lawyer, but need to improve",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "2",
  //               "client_id": "2",
  //               "client_name": "John Doe"
  //             },
  //             {
  //               "id": "3",
  //               "rating": 5,
  //               "description": "Excellent lawyer, very professional",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "1",
  //               "client_id": "3",
  //               "client_name": "John Doe"
  //             },
  //             {
  //               "id": "4",
  //               "rating": 4,
  //               "description": "Very helpful lawyer, highly recommended",
  //               "timestamp": "2024-05-28T00:00:00.000Z",
  //               "lawyer_id": "2",
  //               "client_id": "4",
  //               "client_name": "John Doe"
  //             }
  //           ]
  //         }
  //       ]
  //     };
  //     final List<dynamic> lawyersList =
  //         responseBody['lawyers'] as List<dynamic>;

  //     final filteredLawyers = lawyersList
  //         .where((lawyer) =>
  //             lawyer['User']['full_name']
  //                 .toString()
  //                 .toLowerCase()
  //                 .contains(keyword.toLowerCase()) ||
  //             lawyer['User']['username']
  //                 .toString()
  //                 .toLowerCase()
  //                 .contains(keyword.toLowerCase()))
  //         .toList();

  //     print(filteredLawyers);

  //     final filteredLawyersMap = {
  //       "error": false,
  //       "message": "Success",
  //       "lawyers": filteredLawyers,
  //     };

  //     return LawyersResult.fromJson(filteredLawyersMap);
  //   } catch (e) {
  //     throw Exception('An error occurred while searching: $e');
  //   }
  // }

  // Future<ReviewResult> getReviewsByLawyer_id(String caseId) async {
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
        "Reviews": [
          {
            "id": "1",
            "rating": 4.5,
            "description": "Great lawyer, very helpful",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyer_id": "1",
            "client_id": "1",
            "client_name": "John Doe"
          },
          {
            "id": "2",
            "rating": 3.5,
            "description": "Good lawyer, but need to improve",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyer_id": "2",
            "client_id": "2",
            "client_name": "Jane Doe"
          },
          {
            "id": "3",
            "rating": 5,
            "description": "Excellent lawyer, very professional",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyer_id": "1",
            "client_id": "3",
            "client_name": "John Doe"
          },
          {
            "id": "4",
            "rating": 4,
            "description": "Very helpful lawyer, highly recommended",
            "timestamp": "2024-05-28T00:00:00.000Z",
            "lawyer_id": "2",
            "client_id": "4",
            "client_name": "Jane Doe"
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
    required num rating,
    required String description,
  }) async {
    final response = await client!.post(
      Uri.parse("$baseUrl/reviews"),
      body: jsonEncode(
        {
          "lawyer_id": lawyerId,
          "client_id": userId,
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
    int lawyer_id,
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
          "lawyer_id": lawyer_id,
          "client_id": userId,
          "subject": subject,
          "media": media,
          "notes": notes,
          "consultationFee": consultationFee,
          "hourlyFee": hourlyFee,
          "addition_fee": additionFee,
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
          "addition_fee": additionFee,
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
    int client_id,
    String username,
    String profile_picture,
    // String email, // email cannot be updated
    String password,
    String full_name,
    DateTime birth_date,
    String phone_number,
    String address,
    String bio,
  ) async {
    final response = await client!.put(
      Uri.parse("$baseUrl/users/$client_id"),
      body: jsonEncode(
        {
          "username": username,
          "profile_picture": profile_picture,
          // "email": email,
          "password": password,
          "full_name": full_name,
          "birth_date": birth_date.toIso8601String(),
          "phone_number": phone_number,
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
