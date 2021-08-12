import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'humberger_screen.dart';

void main() {
  runApp(HomeScreen());
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Deliver(),
    );
  }
}

class Deliver extends StatefulWidget {
  @override
  _DeliverState createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.black87,

                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFC6E7FE),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(0.0,3.0),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                          ), ],
                        image: DecorationImage(
                          image: AssetImage('images/i am in vacation.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'SEARCH FOR',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 27.0,
                    fontFamily: 'Cocon',
                    color: Colors.black,

                  ),
                ),
                Text(
                  'RECIPES',
                  style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 27.0,
                    fontFamily: 'Cocon',
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontFamily: 'Cocon',
                        fontSize: 14.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.5),
                      prefixIcon: Icon(Icons.search,color: Colors.grey,),
                    ),
                  ),
                ),
                Text(
                  'Recommended',
                  style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                    fontFamily: 'Cocon',
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListItem('Soda', 'images/Soda.png', '20', Color(0xFFFADBD8), Color(0xFFB03A2E )),
                      SizedBox(width: 10.0,),
                      _buildListItem('Hamburger', 'images/ham.png', '25', Color(0xFFFAE5D3), Color(0xFFA04000)),
                      SizedBox(width: 10.0,),
                      _buildListItem('Pizza', 'images/pizza_a.png', '20', Color(0xFFD4EFDF), Color(0xFF239B56 )),
                      SizedBox(width: 10.0,),
                      _buildListItem('Hotdog', 'images/hotdog.png', '20', Color(0xFFD6EAF8 ), Color(0xFF2874A6)),
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                TabBar(
                    tabs: [Tab(child: Text('Feautred'),), Tab(child: Text('Drinks')), Tab(child: Text('ArabicFood')),Tab(child: Text('salad')),
                    ],
                    controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  labelStyle: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    fontFamily: 'Cocon',
                  ),
                  unselectedLabelStyle: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    fontFamily: 'Cocon',
                  ),
                ),
                Container(height:200.0,child: TabBarView(
                  controller: tabController,
                  children: [
                    FoodTab(),
                    FoodTab(),
                    FoodTab(),
                    FoodTab(),
                  ],
                ),)
              ],
            ),
          ),
        );
  }

  _buildListItem(String foodName,String imgPath,String price,Color bgColor,Color textColor){
    return InkWell(
      child: Container(
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: foodName, child: Container(
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                //shape: BoxShape.circle,
              ),
              child: Center(
                child: Image(image: AssetImage(imgPath)),

              ),
            ),),
            SizedBox(height: 25.0,),
            Text(foodName,style: TextStyle(
              color:textColor,
              fontSize: 17.0,
              fontFamily: 'Cocon',
            ),),
            Text('\$'+price,style: TextStyle(
              color:textColor,
              fontSize: 17.0,
              fontFamily: 'Cocon',
            ),),
          ],
        ),
      ),
      onTap: (){
        setState(() {
          Navigator.push(
              context,MaterialPageRoute(
              builder: (context)=>BurgerPage(imgPath: imgPath,foodName: foodName,pricePerItem: price,heroTag: foodName,)
              )
          );
        });

        },
    );
  }

}

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  final double rating=5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListOrder('SUPER HAMBURG', 4.0,'25','images/ham.png'),
          _buildListOrder('DELICOUS HOTDOG', 5.0,'20','images/hotdog.png'),
          _buildListOrder('SUPER PIZZA', 3.0,'25','images/pizza_a.png'),
          _buildListOrder('COLD SODA', 3.0,'25','images/Soda.png'),
        ],
      ),
    );
  }
  _buildListOrder(String foodname, rating, String Price,String imgPath){
   return Padding(
     padding: const EdgeInsets.all(10.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         Expanded(
           child: Row(
             children: <Widget>[
               Container(
                 width: 75.0,
                 height: 75.0,
                 decoration: BoxDecoration(
                   color: Color(0xFFFADBD8),
                   borderRadius: BorderRadius.circular(7.0),
                 ),
                 child: Center(
                   child: Image(
                     height: 50.0,
                     width: 50.0,
                     image: AssetImage(imgPath,),
                   ),
                 ),
               ),
               SizedBox(width: 20.0,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(foodname,
                   style: TextStyle(
                     color:Colors.black,
                     fontWeight: FontWeight.w400,
                     fontSize: 14.0,
                     fontFamily: 'Cocon',
                   ),
                   ),
                   SmoothStarRating(
                     allowHalfRating: false,
                     onRated: (v){},
                     starCount: rating.toInt(),
                     rating: rating,
                     defaultIconData: Icons.star_border,
                     size: 15.0,
                     spacing: 0.0,
                     color: Color(0xFFFFD143),
                   ),
                   Row(
                    children: <Widget>[
                      Text('\$'+Price,
                        style: TextStyle(
                          color:Color(0xFFF68D7F),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          fontFamily: 'Cocon',
                        ),
                      ),
                      SizedBox(width: 3.0,),
                      Text('\$'+'30',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color:Colors.grey.withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          fontFamily: 'Cocon',

                        ),
                      ),
                    ],
                   ),
                 ],
               ),
             ],
           ),
         ),
         FloatingActionButton(
           heroTag: foodname,
           mini: true,
           onPressed: (){},
          child: Center(
            child: Icon(Icons.add, color: Colors.white,),
          ),
           backgroundColor: Color(0xFFFE7D6A),
         ),
       ],
     ),
   );
  }
}
