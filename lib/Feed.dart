import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          //  return Text("sdsdsdsd");
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height*0.16,
                width: width*0.98,
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:
                            Image.asset(
                            "assets/Profile.png",
                            height: height*0.03,
                            width: width * 0.06,
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12),
                            child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vivek bansal",
                                  style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rewarded a surprise badge to ",
                                      style: GoogleFonts.poppins(fontSize: 8,fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "@Team",
                                      style: GoogleFonts.poppins(fontSize: 8,fontWeight: FontWeight.w400,color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Great Job team. Keep up the good work!",
                                  style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )),
                      ClipRRect(
                          child:
                        Image.asset(
                          "assets/BadgeTeam.jpg",
                          height: width * 0.8,
                          width: width * 0.22,
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 24.0,
                    height: 24.0,
                    child: SvgPicture.asset(
                      'assets/heartcircle1.svg',
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 24.0,
                    height: 24.0,
                    child: SvgPicture.asset(
                      'assets/sharecircle.svg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.01,)
            ],
          );
        },
      ),
    );
  }
}
