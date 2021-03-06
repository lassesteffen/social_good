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
      name: 'Konstantin',
      image: 'assets/kkjdprofile.jpg',
      address: 'Stahnsdorfer Str.',
      city: 'Potsdam',
      country: 'Germany',
      supportedProjects: projectMocks),
  User(
      id: '1',
      name: 'Lasse',
      image: 'assets/lasseprofile.jpg',
      address: 'Charlottenweg',
      city: 'Berlin',
      country: 'Germany',
      supportedProjects: projectMocks),
  User(
      id: '2',
      name: 'Simon',
      image: 'assets/profile.jpeg',
      supportedProjects: projectMocks),
  User(
      id: '3',
      name: 'Jack',
      image: 'assets/amk2.jpg',
      supportedProjects: projectMocks),
  User(
      id: '4',
      name: 'Jan',
      image: 'assets/amk3.jpg',
      supportedProjects: projectMocks),
  User(
      id: '5',
      name: 'Kris',
      image: 'assets/amk4.jpg',
      supportedProjects: projectMocks),
  User(
      id: '6',
      name: 'Tom',
      image: 'assets/amk1.jpg',
      supportedProjects: projectMocks),
];
