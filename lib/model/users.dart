class User {
  final String id;
  final String name;
  final String image;
  final List<String> supportedProjects;
  final String city;
  final String country;
  final String address;

  const User({
    this.id,
    this.name,
    this.image,
    this.supportedProjects,
    this.address,
    this.city,
    this.country,
  });
}

List<User> userMocks = [
  const User(
    id: '1',
    name: 'Paul',
    image: 'assets/profile.jpeg',
    address: 'Sinini St',
    city: 'Harare',
    country: 'Zimbabwe',
    supportedProjects: ['Water for Africa', 'Brot für die Welt']
  ),
  const User(
    id: '2',
    name: 'Pascal',
    image: 'assets/amk1.jpg',
  ),
  const User(
    id: '3',
    name: 'Lasse',
    image: 'assets/amk2.jpg',
  ),
  const User(
    id: '4',
    name: 'Jan',
    image: 'assets/amk3.jpg',
  ),
  const User(
    id: '5',
    name: 'Kris',
    image: 'assets/amk4.jpg',
  ),
];
