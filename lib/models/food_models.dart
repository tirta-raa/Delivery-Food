part of 'models.dart';

enum FoodType { new_food, popular, recomended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

// * kode di atas sebelumnya belum di tambah equatable. equatable berfungsi sebagai alat testing nantinya
// * kemudian nanti di tambah overide parameter yang akan di bandingkan

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
    // * di buat types list kosong karena akan di isi sesuai dengan keadaan
  });

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      name: 'Makanan Khas Sunda',
      description: 'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
      ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
      price: 69000,
      rate: 3.4,
      types: [FoodType.popular, FoodType.recomended, FoodType.new_food]),
  Food(
      id: 2,
      picturePath:
          'https://images.unsplash.com/photo-1612392061787-2d078b3e573c?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=802&q=80',
      name: 'Makanan Khas jawa',
      description: 'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
      ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
      price: 19000,
      rate: 4.2,
      types: [FoodType.popular, FoodType.recomended]),
  Food(
      id: 3,
      picturePath:
          'https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
      name: 'Makanan Khas bali',
      description: 'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
      ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
      price: 49000,
      rate: 5,
      types: [FoodType.recomended]),
  Food(
      id: 4,
      picturePath:
          'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80',
      name: 'Makanan Khas bandung',
      description: 'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
      ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
      price: 86000,
      rate: 1.9,
      types: [FoodType.popular, FoodType.recomended]),
  Food(
      id: 5,
      picturePath:
          'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      name: 'Makanan Khas sumatra',
      description: 'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
      ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
      price: 24000,
      rate: 2,
      types: [FoodType.recomended]),
  Food(
    id: 6,
    picturePath:
        'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    name: 'Makanan Khas papua',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 50000,
    rate: 5,
  ),
];
