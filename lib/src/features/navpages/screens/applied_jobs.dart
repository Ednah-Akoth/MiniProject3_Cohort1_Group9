import 'package:flutter/material.dart';
import 'package:job_application/src/features/navpages/screens/saved_job_details.dart';

import '../../../constants/colors.dart';
import '../models/mock_data.dart';
import 'myjobs_page.dart';


enum MenuItem { item1, item2, item3 }

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const ListTile(
          title: Center(
            child: Text('Applied Jobs',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor)),
          ),
        ),
        actions: [
          PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.item1) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyJobsPage()));
                } else if (value == MenuItem.item2) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AppliedJobs()));
                } else if (value == MenuItem.item3) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AppliedJobs()));
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: MenuItem.item1,
                      child: Text("Waiting"),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item2,
                      child: Text("Accepted"),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item2,
                      child: Text("Rejected"),
                    ),
                  ])
        ],
        iconTheme: IconThemeData(color: tTextAccentColor, size: 25),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 15),
        child: Column(
          children: [
            for (int i = 0; i < popularJobs.length; i++)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SavedJob()),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10, bottom: 12.0),
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width / 0.5,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5, color: Colors.black12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          child: Image.asset(popularJobs[i].imgUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularJobs[i].position,
                                style: TextStyle(
                                    color: tTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                popularJobs[i].companyName,
                                style: TextStyle(
                                    color: tTextAccentColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                popularJobs[i].location,
                                style: TextStyle(
                                    color: tTextAccentColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "\$ ${popularJobs[i].salary}",
                                style: TextStyle(
                                    color: tTextAccentColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  for (int i = 0; i < 2; i++)
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 8.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        popularJobs[i].type,
                                        style: TextStyle(
                                            color: tTextAccentColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
