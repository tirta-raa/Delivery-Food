part of 'models.dart';

class FoodModels {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  FoodModels(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate});
}

List<FoodModels> mockFoods = [
  FoodModels(
    id: 1,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  FoodModels(
    id: 2,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  FoodModels(
    id: 3,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  FoodModels(
    id: 4,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  FoodModels(
    id: 5,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  FoodModels(
    id: 6,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
];
