class User {
  final String id;
  final String name;
  final String image;

  const User({
    this.id,
    this.name,
    this.image,
  });
}

List<User> userMocks = [
  const User(
    id: '1',
    name: 'Paul',
    image: 'assets/profile.jpeg',
  )
];
