import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BurgerPage extends StatefulWidget {
  final imgPath,foodName,pricePerItem,heroTag;
  BurgerPage({this.imgPath,this.foodName,this.pricePerItem,this.heroTag});

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var totalPrice=1;
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
                    Stack(
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFE7D6A),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(0.0,3.0),
                                blurRadius: 6.0,
                                spreadRadius: 4.0,
                              ), ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white ,
                            ),
                          ),
                        ),
                        Positioned(
                          top:1.0,
                            right: 4.0,
                            child: Container(
                                width: 12.0,
                                height: 12.0,
                                child: Center(
                                  child: Text('1', style: TextStyle(
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.red,
                                  ),),
                                ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            ),)
                      ],
                    ),
                  ],
                ),
                Text('SUPER ',style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 27.0,
                  fontFamily: 'Cocon',
                  color: Colors.black,

                ),),
                Text(widget.foodName.toString().toUpperCase(),style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 27.0,
                  fontFamily: 'Cocon',
                  color: Colors.black,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Hero(
                      tag: widget.heroTag,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.imgPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 45.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFE7D6A).withOpacity(0.1),
                                    blurRadius: 6.0,
                                    spreadRadius: 6.0,
                                    offset: Offset(5.0,11.0),
                                  ),
                                ]
                              ),
                            ),
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(Icons.favorite_border,color: Color(0xFFFE7D6A),size: 25.0,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35.0,),
                        Stack(
                          children: [
                            Container(
                              height: 45.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFFE7D6A).withOpacity(0.1),
                                      blurRadius: 6.0,
                                      spreadRadius: 6.0,
                                      offset: Offset(5.0,11.0),
                                    ),
                                  ]
                              ),
                            ),
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(Icons.restore,color: Color(0xFFFE7D6A),size: 25.0,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      width: 125.0,
                      color: Colors.white,
                      child: Text(
                        '\$'+(int.parse(widget.pricePerItem)*totalPrice).toString(),
                        style: TextStyle(
                        fontSize: 40.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black.withOpacity(0.7)
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60.0,
                         width: 225.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFE7D6A),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40.0,
                              width: 105.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        adjustQuantity('Minus');
                                        },
                                      icon: Icon(Icons.remove,
                                        color: Color(0xFFFE7D6A),
                                        size: 17.0,
                                      )),
                                  Text(
                                    totalPrice.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        adjustQuantity('PLUS');
                                  },
                                      icon: Icon(Icons.add, color: Color(0xFFFE7D6A),size: 17.0,)),
                                ],
                              ),
                            ),
                            Text('Add to card',
                            style: TextStyle(
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text('FEAUTRED',style: TextStyle( fontFamily:'Cocon',fontSize:15.0,fontWeight: FontWeight.w800,color: Colors.black),),
                SizedBox(height: 35.0,
                ),
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListOrder('Potato', '12', 'images/potato.png',Color(0xFFFADBD8)),
                      _buildListOrder('Katchup', '10', 'images/KAT.png',Color(0xFFFAE5D3)),
                      _buildListOrder('Soda', '20', 'images/Soda.png',Color(0xFFD4EFDF)),
                      ]
                  ),
                ),

              ],
            ),

      ),
    );
  }
  adjustQuantity(pressed){
    switch(pressed){
      case 'PLUS':
        setState(() {
          totalPrice +=1;
        });
        return;
      case 'Minus':
        setState(() {
          if(totalPrice !=0){
          totalPrice -=1;}
        });
        return;
    }
  }

  _buildListOrder(String foodname, String Price,String imgPath,Color bgColor){
    return
        Container(
        width: 210.0,
        child: Row(
          children:[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(7.0),
              ),
                child: Center(
                  child: Image(
                  height: 65.0,
                  width: 65.0,
                  image: AssetImage(imgPath,),
                ),
              ),
          ),
            SizedBox(width: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(foodname,
                  style: TextStyle(
                    color:Colors.black54,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                    fontFamily: 'Cocon',
                  ),
                ),
                Text('\$'+Price,
                  style: TextStyle(
                    color:Color(0xFFF68D7F),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    fontFamily: 'Cocon',
                  ),
                ),
              ],
            ),
      ]),
      );
  }
}
