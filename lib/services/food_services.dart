part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFoods);
  }
}

// * dibuat class food services untuk munculkan data dari food 
// *  dari api return value di buat list karena food models bentuknya list kemudian tambah asyc
// * karena dari internet kemudian kemablikan mockfood karena belum ada apinya jadi pale mockup
