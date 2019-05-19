class Project {
  final String id;
  final String name;
  final String image;

  const Project({
    this.name,
    this.image,
    this.id,
  });
}

List<Project> projectMocks = [
  const Project(
    id: '1q231',
    name: 'Brot für die Welt',
    image: 'assets/projects/bfdw.jpg',
  ),
  const Project(
    id: '1q232311',
    name: 'Unicef',
    image: 'assets/projects/unicef.jpeg',
  ),
  const Project(
    id: '1q2311',
    name: 'WWF',
    image: 'assets/projects/wwf.jpeg',
  ),
];
