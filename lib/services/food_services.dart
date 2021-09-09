part of 'services.dart';

// * dibuat class food services untuk munculkan data dari food
// *  dari api return value di buat list karena food models bentuknya list kemudian tambah asyc
// * karena dari internet kemudian kemablikan mockfood karena belum ada apinya jadi pale mockup
// class FoodServices {
//   static Future<ApiReturnValue<List<Food>>> getFoods() async {
//     await Future.delayed(Duration(milliseconds: 500));

//     return ApiReturnValue(value: mockFoods);
//   }
// }

//! kode di bawah digunakan ketika akan di sambungkan ke api

//* di buat class dengan nama food servides yang berisi
//* static future of api return value of list of food kemudian di buat fungsi getFoods
//* yang berisi parameter hhtp.client client kemudian asingkronus
//* jika clien sama dengan null maka return http. client()
class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    //* di buat string url dengan baseUrl di tambah food sesuai dengan url api
    //* di buat variabel dengan nama response yang akan menunggu client nge get (tipe apinya GET maka di ambil get)
    //* uri parse url di tambah dengan parameter food
    String url = baseUrl + 'food';
    var response = await client.get(Uri.parse(url));

    //* if jika respon status tidak sama dengan 200 maka kembalikan please try again
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'please try again');
    }

    //* di buat var dengan nama data yang mengandung json.decode(response.body)
    var data = json.decode(response.body);

    //* di buat parameter foods dari List of food yang mengandung var data dari colom data dan tabel data yang dapat di akses secara berutan (iretable)
    //* di map yang berkaitan dengan food models dengan kunci fromJson e to list
    //* kembalika api return value dengan value foods
    //? fromJson akan error kalau ga di buat dulu factory di food models
    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
