class CatalogModel {
  static final items = [
    Item(
        imageUrl: "assets/images/avatar.png",
        name: "John Martin",
        desc: "Director,Product Design MLSE"),
    Item(
        imageUrl: "assets/images/avatar_1.png",
        name: "Devi Jyoti",
        desc: "Frontend Engineer,Microsoft London"),
    Item(
        imageUrl: "assets/images/avatar_2.png",
        name: "Sakshi Sharma",
        desc: "UI/UX Amazon,Usa"),
    Item(
        imageUrl: "assets/images/avatar_3.png",
        name: "Rama Sachdev",
        desc: "Freelancer,Full Stackm Engineer Codeblocks")
  ];
}

class Item {
  final String imageUrl;
  final String name;
  final String desc;

  Item({
    required this.imageUrl,
    required this.name,
    required this.desc,
  });
}
