import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkError {
  static void handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      Get.snackbar("Error", "Connection Timeout");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      Get.snackbar("Error", "Receive Timeout");
    } else if (e.type == DioExceptionType.badResponse) {
      switch (e.response!.statusCode) {
        case 400:
          Get.snackbar("Error", "Bad Request");
          break;
        case 401:
          Get.snackbar("Error", "Unauthorized",
              backgroundColor: Colors.red, colorText: Colors.white);
          break;
        case 403:
          Get.snackbar("Error", "Forbidden");
          break;
        case 404:
          Get.snackbar("Error", "Not Found");
          break;
        case 500:
          Get.snackbar("Error", "Internal Server Error");
          break;
        case 502:
          Get.snackbar("Error", "Bad Gateway");
          break;
        case 503:
          Get.snackbar("Error", "Service Unavailable");
          break;
        default:
          Get.snackbar("Error", "Something went wrong");
      }
    } else if (e.type == DioExceptionType.cancel) {
      Get.snackbar("Error", "Request Cancelled");
    } else if (e.type == DioExceptionType.unknown) {
      Get.snackbar("Error", "Unknown Error");
    } else if (e.type == DioExceptionType.badCertificate) {
      Get.snackbar("Error", "Bad Certificate");
    } else if (e.type == DioExceptionType.connectionError) {
      Get.snackbar("Error", "Connection Error");
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
