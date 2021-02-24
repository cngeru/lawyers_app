import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.8],
          colors: [
            Color(0xFF8C1F85),
            Color(0xFF581954),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Getting a lawyer near you just got easier.",
                      style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Now you can be heard. Find a lawyer near you.",
                      style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, "/"),
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Text(
                            "Getting Started",
                            style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
