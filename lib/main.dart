import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'profile_screen.dart';
import 'category_screen.dart';

//import 'package:google_fonts/google_fonts.dart';

void main() {
 runApp(const MyApp());
 runApp(const SearchBarApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POPSHOP',
      // style: TextStyle(
      //         fontWeight: FontWeight.bold, // Set the font weight to bold
      //       ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 121)),
          //useMaterial3: true,
      ),
      home: const SearchBarApp(),
    );
  }
}

class SearchBarApp extends StatefulWidget 
{
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  int _currentIndex = 1;
  final List<Widget> _screens = [
    CategoryScreen(),// Add your other screens here
    Container(), // Placeholder for the home screen
    ProfileScreen(),
  ];

  final List<String> images = [
      'assets/laptop.jpg',
      'assets/img4.jpg',
      'assets/Image6.jpg',
      'assets/img5.jpg',
      'assets/Image7.jpg',
  ];
  
  final List<String> gridImages = [
    'assets/Image.jpg',
    'assets/Image1.jpg',
    'assets/Image2.jpg',
    'assets/Image3.jpg',
    'assets/Image4.jpg',
    'assets/Image5.jpg',
    'assets/Image2.jpg',
    'assets/iphone2.jpeg',
    'assets/Image1.jpg',
    'assets/Image.jpg',
    'assets/Image3.jpg',
    'assets/img1.jpg',
    'assets/iphone2.jpeg',
    'assets/img1.jpg',
    'assets/img3.jpg',
    'assets/iphone2.jpeg',
    'assets/img4.jpg',
    'assets/img1.jpg',

  ];
  final List<String> itemNames = [
    'SONY Camera',
    'Logitech Mouse',
    'HP bage',
    'Girls Froksuit',
    'ASUS ProArt TV',
    'Remote control car',
    'bage',
    'I phone 14',
    'Mouse',
    'SONY Camera',
    'Girls Dress',
    'Item 12',
    'Item 13',
    'Item 14',
    'Item 15',
    'Item 16',
    'Item 17',
    'Item 18',
    'Item 19',
  ];

  final List<String> itemNames1 = [
    'From ₹29,999',
    'From ₹499',
    'From ₹889', 
    'From ₹200',
    'From ₹19,999',
    'From ₹599',
    'From ₹999',
    'From ₹60,999',
    'From ₹699',
    'From ₹',
    'From',
    'Item 12',
    'Item 13',
    'Item 14',
    'Item 15',
    'Item 16',
    'Item 17',
    'Item 18',
    'Item 19',
  ];
  //double get radius => 15.0;

  List<Widget> generateImagesTiles(){
    return images.map((Element) =>ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(Element,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    )) .toList();
  }
  get options => null;
  
  get callbackFunction => null;

 // bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light);
         // _screens[_currentIndex];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 198, 247),
        bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 198, 247),
        items: const [
        Icon(Icons.category_outlined, color: Color.fromARGB(255, 248, 6, 212), size: 40,),
        Icon(Icons.home, color: Color.fromARGB(255, 248, 6, 212), size: 40,),
        Icon(Icons.account_circle, color: Color.fromARGB(255, 248, 6, 212), size: 40,),
        
      ],
      
      onTap: (index) {
            setState(() {
              _currentIndex = index;
            }
            );
            _screens[_currentIndex];
          },
          index: _currentIndex,
       ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 198, 247),
          title: Text(
            '   POPSHOP 🛒',
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 198, 247),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 14.0,
                  color: Color.fromARGB(255, 248, 6, 212),
                ),
              ],
              // fontStyle: GoogleFonts.acme(),
              fontWeight: FontWeight.bold, // Set the font weight to bold
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                  color: Color.fromARGB(255, 248, 6, 212), size: 45,
              ),
              onPressed: () {
                // do something
              },
            )
          ] ,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
              // _screens[_currentIndex],
              SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar  (
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 15.0)),
                    //textAlign: TextAlign.center,
                    hintText: 'Search Your Product',
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                       leading: const Icon(Icons.search,size: 30,),
                          trailing: <Widget>[
                            Tooltip(
                              message: 'Change brightness mode',
                            child: IconButton(
                              //isSelected: isDark,
                              onPressed: () {
                                setState(() {
                                  //isDark = !isDark;
                                });
                              },
                                icon: const Icon(Icons.mic,size: 25,),
                                 // selectedIcon: const Icon(Icons.brightness_2_outlined),
                              ),
                            )
                          ],
                    );
                }, 
              suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                          return ListTile(
                              title: Text(item),
                                onTap: () {
                                  setState(() {
                                    controller.closeView(item);
                                  });
                              },
                          );
                        }
                      );
            }),
              
             const SizedBox(height: 15),
             //  Center(
                //    child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),itemCount: 6 ,itemBuilder: (context,index){
              //     Text("Hello $index");
             //    },),
             //  ),
             //Padding(padding: EdgeInsets.all(20)),
            CarouselSlider(
              items: generateImagesTiles(),
            
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 2.0,
                  viewportFraction: 0.96,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  
                  alignment: Alignment.bottomLeft,
                  child: 
                  Text( 'Deals for you....',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),),
                  
                ),
              ),
              
              //const SizedBox(height: 8),
              
               Padding(
                  padding: const EdgeInsets.all(8.0),
                
                  child: GridView.builder(
                
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 13.0,
                      mainAxisSpacing: 13.0,
                    ),
                      itemCount: gridImages.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          
                          color: Colors.white,
                          // child:
                          //       Image.asset(gridImages[index]),  
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Image.asset(
                                gridImages[index],
                                height: 75,
                                width: double.infinity,
                                fit: BoxFit.contain,
                                //fit: BoxFit.fill,
                                //fit: applyBoxFit(100, inputSize, outputSize),
                               // fit: BoxFit.scaleDown,
                                ),
                                
                              const SizedBox(height: 5),
                              Text(
                               // textAlign: TextAlign.center,
                                itemNames[index],  // Use the corresponding name for each container
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                itemNames1[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color:Color.fromARGB(255, 18, 118, 21),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );     
                      }
                  ),
                )
               //Image.asset("assets/img4.jpg"),
  
              // GridView.count(crossAxisCount: 2,
              //   children: [
              //     Container(
              //       //color: Color(2),
              //     )
              //   ],
              // const SizedBox(height: 100),
              // MyGridView(),
          //               // )
          // SizedBox(height: 100,),
          //     GridView.count(
          //   primary: false,
          //   //padding: const EdgeInsets.all(20),
          //   //crossAxisSpacing: 5,
          //   mainAxisSpacing: 5,
          //   crossAxisCount: 2,
          //   childAspectRatio: 0.75,
          //   physics: NeverScrollableScrollPhysics(),
          //   children: <Widget>[
          //     Container(
          //       height: 20,
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[100],
          //       child: const Text("He'd have you all unravel at the"),
          //     ),
          //     Container(
          //       height: 20,
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[200],
          //       child: const Text('Heed not the rabble'),
          //     ),
          //     Container(
          //       height: 20,
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[300],
          //       child: const Text('Sound of screams but the'),
          //     ),
          //     Container(
          //       height: 20,
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[400],
          //       child: const Text('Who scream'),
          //     ),
          //     Container(
          //       height: 20,
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[500],
          //       child: const Text('Revolution is coming...'),
          //     ),
          //     Container(
          //       height: 20,
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[600],
          //       child: const Text('Revolution, they...'),
          //     ),
          //   ],
          // )
          
               //Column(
                
              //   children: [
              //     Container(
              //         height: 150,
              //         width: 150,
              //          child:Image.asset("assets/img3.jpg"),
              //       ),
              //       Container(
              //         height: 150,
              //         width: 150,
              //          child:Image.asset("assets/img3.jpg"),
              //       ),
              //       Container(
              //         height: 150,
              //         width: 150,
              //          child:Image.asset("assets/img3.jpg"),
              //       ),
              //       Container(
              //         height: 150,
              //         width: 150,
              //          child:Image.asset("assets/img3.jpg"),
              //       ),
              //   ],
              // )
          
            //     Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // children:[
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            //   Image.asset("assets/img3.jpg"),
            // ]
            
            //     )
              // GridView.count(
              //   crossAxisCount: 3,
              //   mainAxisSpacing: 8.0,
              //   physics: NeverScrollableScrollPhysics(),
              //   childAspectRatio: 0.75,
              //   children: const [
              //     Text("Hello",selectionColor: Colors.amber,)
              //   ],
              //   )
              // Center(
              //   child: Container
              //   (
              //    width: 200,
              //    height: 200,
              //    decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.all(Radius.circular(25)),
              //     color: const Color.fromARGB(255, 246, 150, 236),
              //     boxShadow: [
              //       BoxShadow(color: const Color.fromARGB(255, 32, 34, 22).withOpacity(0.5), //color of shadow
              //       spreadRadius: 8, //spread radius
              //       blurRadius: 25, // blur radius
              //       offset: const Offset(7,15),)
              //         ],
              //           ),
                        
              //         //color: Colors.black,
              //     child: const Center
              //     (
              //       child: Text
              //       ('   Hello \nSudeep \n    Bro',
              //         style: TextStyle
              //         (
              //           color: Colors.white,
              //           fontSize: 25,
              //           fontWeight: FontWeight.w700, 
              //         ),
              //       ),
              //     ),
              //   ),
              // )
              ]
          
              
            ),
          ),

        ),
        
      ),
    );
  }
  void main() {
  runApp(const SearchBarApp());
}
}

