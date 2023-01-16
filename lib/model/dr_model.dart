// To parse this JSON data, do
//
//     final usersModel = usersModelFromMap(jsonString);

import 'dart:convert';

class DRModel {
  DRModel({
    required this.ad,
    required this.soyad,
    required this.email,
    required this.sifre,
    required this.fak,
    required this.uzman,
    required this.hastane,
    required this.klinik,
  });

  final String? ad;
  final String? soyad;
  final String? email;
  final String? sifre;
  final String? fak;
  final String? uzman;
  final String? hastane;
  final String? klinik;

  factory DRModel.fromJson(String str) => DRModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DRModel.fromMap(Map<String, dynamic> json) => DRModel(
    ad: json["doktor_ad"],
    soyad: json["doktor_soyad"],
    email: json["doktor_mail"],
    sifre: json["doktor_sifre"],
    fak: json["doktor_fak"],
    uzman: json["doktor_uzm"],
    hastane: json["doktor_hane"],
    klinik: json["doktor_klinik"],
  );

  Map<String, dynamic> toMap() => {
    "id": ad,
    "name": soyad,
    "username": email,
    "email": sifre,
    "address": fak,
    "phone": uzman,
    "website": hastane,
    "company": klinik,
  };
}