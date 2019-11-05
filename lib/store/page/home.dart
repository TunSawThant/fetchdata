import 'package:fetchdata/store/page/details.dart';
import 'package:fetchdata/store/resources/store_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class StoreHome extends StatefulWidget {
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        automaticallyImplyLeading: false,
        title: Text("Store List.." ,style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert,color: Colors.black,), onPressed: (){})
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: getStore(http.Client()),
            builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blueAccent,value:30.0 ,),
              ) ;
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical:8 ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 2.0,
                      child: InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(26.0),
                                topRight: Radius.circular(26.0)
                              ),
                              child: CachedNetworkImage(
                                  imageUrl: "https://source.unsplash.com/random/400x400",
                                placeholder: (context, url) =>SizedBox(
                                  height: 320,
                                  width:300 ,
                                  child: Shimmer.fromColors(
                                      child: Container(
                                        color: Colors.yellow,
                                      ),
                                      baseColor: Colors.yellow[300],
                                      highlightColor: Colors.yellow[100]),
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(snapshot.data[index].entityName,style: Theme.of(context).textTheme.title,),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(snapshot.data[index].county,style: TextStyle(
                                        color: Colors.grey,fontSize: 18.0
                                      ),),
                                      Text(","+snapshot.data[index].state,style: TextStyle(
                                          color: Colors.grey,fontSize: 18.0
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(snapshot.data[index])));
                        },
                      ),

                    ),
                  );
                  }
              );
            }
            }

        ),
      ),
    );
  }
}
