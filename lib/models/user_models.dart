part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String housenumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.housenumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  @override
  List<Object> get props =>
      [id, name, email, address, housenumber, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 1,
  name: 'John Doe',
  email: 'doe@gmail.com',
  address: '123 Fake Street',
  housenumber: '123',
  phoneNumber: '555-1212',
  city: 'New York',
  picturePath: 'https://picsum.photos/200/300',
);