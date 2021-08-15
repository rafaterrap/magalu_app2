
import 'package:app_magalu/models/listProducts.dart';
import 'package:app_magalu/provider/description_list.dart';
import 'package:app_magalu/style.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.jpg"),
        title: 
        Text(
          "Ofertas do dia"
          ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/linha.jpg",
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: builder,
              itemCount: listOfDescripition.length,
            
            ),
          ),
        ],
      ),
    );
  }

  Widget builder(BuildContext _, int Index) {
    listProducts _listProducts = listOfDescripition.elementAt(Index);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: Image.asset(
          _listProducts.photo,
        ),
        trailing: IconButton(
          icon: (_listProducts.isFavorite)
              ? Icon(
                  Icons.favorite,
                  color: colorPink,
                )
              : Icon(
                  Icons.favorite_outline,
                  color: colorPink,
                ),
          onPressed: () {
            setState(() {
              _listProducts.isFavorite = !_listProducts.isFavorite;
            });
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _listProducts.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                _listProducts.description,
                style: 
                TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _listProducts.price,
                style: 
                TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorBlue,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              _listProducts.installments,
              style: 
              TextStyle(
                color: colorBlue,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
