import 'dart:convert';

import 'package:coffee_masters/datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<ProductCategory>? _menu;
  List<ItemInCart> cart = [];
  List<Note> notes = [];

  addNote(Note note) {
    notes.add(note);
  }

  cartAdd(Product p) {
    bool found = false;

    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
    }
    if (!found) {
      cart.add(ItemInCart(product: p, quantity: 1));
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((element) => element.product.id == p.id);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    var sum = 0.0;
    for (var item in cart) {
      sum += item.quantity * item.product.price;
    }
    return sum;
  }

  fetchMenu() async {
    try {
      const url = 'https://firtman.github.io/coffeemasters/api/menu.json';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        _menu = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (var json in decodedData) {
          _menu?.add(ProductCategory.fromJson(json));
        }
      } else {
        throw Exception("Error loading data");
      }
    } catch (e) {
      throw Exception("Error loading data");
    }
  }

  Future<List<ProductCategory>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }
}
