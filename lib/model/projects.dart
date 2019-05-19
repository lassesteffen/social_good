class Project {
  final String name;
  final String image;

  const Project({
    this.name,
    this.image,
  });
}

List<Project> projectMocks = [
  const Project(
    name: 'Brot für die Welt',
    image: 'assets/projects/bfdw.jpg',
  ),
  const Project(
    name: 'Unicef',
    image: 'assets/projects/unicef.jpeg',
  ),
  const Project(
    name: 'WWF',
    image: 'assets/projects/wwf.jpeg',
  ),
];
