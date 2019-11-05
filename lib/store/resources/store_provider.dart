import 'package:fetchdata/store/model/store.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<List<Store>> getStore(http.Client client) async{
  final  response=await client.get("http://switchip.herokuapp.com/stores");
  if(response.statusCode==200){
    var jsonbody=json.decode(response.body);
    List<Store> stores=[];
    for(var data in jsonbody){
      Store store=Store.fromJson(data);
      stores.add(store);
    }
    return stores;
  }
  else{
    throw Exception("Fail to load ..");
  }
}