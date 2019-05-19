import 'projects.dart' show projectMocks, Project;

class User {
  final String id;
  final String name;
  final String image;
  List<Project> supportedProjects;
  final String city;
  final String country;
  final String address;

  User({
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
  User(
    id: '1',
    name: 'Paul',
    image: 'assets/profile.jpeg',
    address: 'Sinini St',
    city: 'Harare',
    country: 'Zimbabwe',
    supportedProjects: projectMocks
  ),
  User(
    id: '2',
    name: 'Pascal',
    image: 'assets/amk1.jpg',
  ),
  User(
    id: '3',
    name: 'Lasse',
    image: 'assets/amk2.jpg',
  ),
  User(
    id: '4',
    name: 'Jan',
    image: 'assets/amk3.jpg',
  ),
  User(
    id: '5',
    name: 'Kris',
    image: 'assets/amk4.jpg',
  ),
];
