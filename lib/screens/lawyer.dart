import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:lawyers/models/lawyers.dart';
import "package:latlong/latlong.dart" as latLng;

class Lawyer extends StatelessWidget {
  final LawyerModel lawyer;

  const Lawyer({Key key, this.lawyer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.4,
                        image: NetworkImage(lawyer.avatar),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        color: Colors.brown[300].withOpacity(0.9),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        color: Colors.brown[400].withOpacity(0.9),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.brown[800],
                      ),
                      child: _lawyerInfoContainer(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              //Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _statsColumn(context, "Cases won", lawyer.casesWon, Colors.orange),
                  _statsColumn(context, "Experience", lawyer.experience, Colors.blue),
                  _statsColumn(context, "Endorsement", lawyer.endorsement, Colors.green),
                ],
              ),
              SizedBox(height: 20),
              //About
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About Lawyer",
                          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        lawyer.available
                            ? Chip(
                                label: Text(
                                  "Available",
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.greenAccent, fontWeight: FontWeight.w800),
                                ),
                                backgroundColor: Colors.greenAccent.withOpacity(0.09),
                              )
                            : Chip(
                                label: Text(
                                  "Unavailable",
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
                                ),
                              ),
                      ],
                    ),
                    Text(
                      lawyer.about,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Location
              _mapContainer(context),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/"),
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                "Book Appointment",
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _mapContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.width),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Location",
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(height: 20),
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(-1.2921, 36.8219),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: latLng.LatLng(-1.2921, 36.8219),
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _lawyerInfoContainer(BuildContext context) {
    return Column(
      children: [
        Text(
          lawyer.name,
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 8),
        Text(
          "${lawyer.category} Lawyer",
          style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  lawyer.rating.toString(),
                  style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow[600],
                ),
              ],
            ),
            SizedBox(width: 5),
            Container(
              child: Icon(
                Icons.circle,
                color: Colors.white,
                size: 6,
              ),
            ),
            SizedBox(width: 5),
            Text(
              lawyer.firm,
              style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.brown[200]),
            ),
          ],
        ),
      ],
    );
  }

  Column _statsColumn(BuildContext context, String title, int value, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black45, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 10),
        Text(
          title == "Experience" ? '${value.toString()}yrs+' : '${value.toString()}+',
          style: Theme.of(context).textTheme.headline6.copyWith(color: color, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
