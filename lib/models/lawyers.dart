import 'package:flutter/material.dart';

class LawyerModel {
  int lawyerID;
  String avatar;
  String name;
  String category;
  String firm;
  double rating;
  String about;
  int casesWon;
  int experience;
  int endorsement;
  bool available;
  LawyerModel({
    @required this.lawyerID,
    @required this.avatar,
    @required this.name,
    @required this.category,
    @required this.firm,
    @required this.rating,
    @required this.about,
    @required this.casesWon,
    @required this.experience,
    @required this.endorsement,
    @required this.available,
  });
}

final List<LawyerModel> topLawyers = [
  LawyerModel(
    lawyerID: 1,
    avatar: "https://i.pravatar.cc/150?img=1",
    name: "Annette Black",
    category: "Criminal",
    firm: "East Dakota",
    rating: 4.2,
    about:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    casesWon: 430,
    experience: 7,
    endorsement: 50,
    available: false,
  ),
  LawyerModel(
    lawyerID: 2,
    avatar: "https://i.pravatar.cc/150?img=3",
    name: "Ralph Edwards",
    category: "Intellectual",
    firm: "Ayale Law Firm",
    rating: 4.6,
    about:
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    casesWon: 650,
    experience: 7,
    endorsement: 100,
    available: true,
  ),
  LawyerModel(
    lawyerID: 3,
    avatar: "https://i.pravatar.cc/150?img=7",
    name: "Brooklyn Simmons",
    category: "Child Protection",
    firm: "Barney Firm",
    rating: 4.3,
    about:
        " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    casesWon: 300,
    experience: 4,
    endorsement: 60,
    available: true,
  ),
  LawyerModel(
    lawyerID: 4,
    avatar: "https://i.pravatar.cc/150?img=8",
    name: "John Smith",
    category: "Criminal",
    firm: "Barney Firm",
    rating: 4.7,
    about:
        "Vel pharetra vel turpis nunc eget. Viverra suspendisse potenti nullam ac. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    casesWon: 250,
    experience: 2,
    endorsement: 30,
    available: false,
  ),
];
