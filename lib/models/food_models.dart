part of 'models.dart';

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

// * kode di atas sebelumnya belum di tambah equatable. equatable berfungsi sebagai alat testing nantinya
// * kemudian nanti di tambah overide parameter yang akan di bandingkan

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate});

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  Food(
    id: 2,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  Food(
    id: 3,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  Food(
    id: 4,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  Food(
    id: 5,
    picturePath: 'https://picsum.photos/200/300',
    name: 'Makanan Khas Sunda',
    description:
        'Nasi uduk adalah makan paling terkenal di tanah Sunda. Nasi uduk ini dibuat dari bahan bahan pilihan',
    ingredients: 'Nasi, Bawang merah, Kelapa, Bawang Goreng',
    price: 10000,
    rate: 4.2,
  ),
  Food(
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
