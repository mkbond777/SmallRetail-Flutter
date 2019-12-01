class UnitList {
  final List<Unit> units;

  UnitList({
    this.units,
  });

  factory UnitList.fromJson(List<dynamic> parsedJson) {
    List<Unit> units = new List<Unit>();
    units = parsedJson.map((i) => Unit.fromJson(i)).toList();

    return new UnitList(units: units);
  }
}

class Unit {
  final String id;
  final String name;
  final String description;

  Unit({
    this.id,
    this.name,
    this.description,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return new Unit(
        id: json['id'].toString(),
        name: json['name'],
        description: json['description']);
  }
}
