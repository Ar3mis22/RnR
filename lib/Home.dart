import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rnr/Events.dart';
import 'package:rnr/Feed.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin  {

  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, initialIndex: 0, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   flexibleSpace: Stack(
      //     children: [
      //       Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(colors: [
      //           Color(0xff6155F5),
      //           Color(0xff352F7C),
      //         ]),
      //       ),
      //     ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(8.0,32,20,0),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Column(
      //               children: [
      //                  Text("Vivek Bansal",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
      //                 Text("Vivekbansal@earnest.com",style: GoogleFonts.poppins(fontSize: 8,color: Colors.white),)
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ]
      //   ),
      // ),

      body: Stack(
        children: [
          Container(
          height:screenHeight*0.331,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/backgroundHome.png'),fit: BoxFit.cover)
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset('assets/drawerIcon.png'),
                        );
                      },
                    ),
                    Spacer(),
                    Text("Vivek Bansal",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Text("Vivekbansal@earnest.com",style: GoogleFonts.poppins(fontSize: 8,color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.11,),
                Text("Welcome back to the benefitwise R&R",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white)),
                Text("Program",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white)),
                SizedBox(height: screenHeight*0.037,),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12, //New
                            blurRadius: 20,
                          )
                        ],
                      ),
                      // margin: EdgeInsets.all(5),
                      width: screenWidth*0.7,//screenWidth*0.9,
                      height: screenHeight*0.05,//screenHeight*0.06,
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none
                          ),
                          hintText: 'Search for any employee',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                          ),
                          suffixIcon:Icon(
                            Icons.search,color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(width: screenWidth*0.09,),
                    Container(
                      height: screenHeight*0.065,
                      width: screenWidth*0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFDCF9E),
                      ),
                      child:
                      Column(
                        children: [
                          Image(image: AssetImage('assets/logo.png'),),
                          Text("Appreciate",style: GoogleFonts.poppins(fontSize: 8,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight*0.03,),
                TabBar(
                  // isScrollable: true,
                  controller: _controller,
                  tabs:  [
                    SizedBox(
                        width: screenWidth*0.30,
                        child: Align(
                            alignment: Alignment.center,
                            child: Tab(text: 'Feed',))
                    ),
                    SizedBox(
                        width: screenHeight*0.30,
                        child: Align(
                          alignment: Alignment.center,
                            child: Tab(text: 'Events',))
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  labelColor: Color(0xffFF8E0A),
                  unselectedLabelColor: Colors.black,
                  labelStyle: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),
                  unselectedLabelStyle: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffFF8E0A),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        child: TabBarView(
                          controller: _controller,
                          children:  <Widget>[
                            Feed(),
                            Events(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ]
      ),
    );
  }
}
