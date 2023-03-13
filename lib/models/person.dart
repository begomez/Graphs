import 'package:graphs/models/iserial.dart';

class Person implements ISerial<Person> {
  final int age;
  final String name;

  const Person(this.age, this.name) : super();

  @override
  Person fromJson(Map<String, dynamic> json) => Person(
        json[_PersonProps.age],
        json[_PersonProps.name],
      );

  @override
  Map<String, dynamic> toJson() => {
        _PersonProps.age: age,
        _PersonProps.name: name,
      };

  @override
  bool operator ==(other) {
    if (other is! Person) {
      return false;
    }
    return age == other.age && name == other.name;
  }

  @override
  int get hashCode => age.hashCode ^ name.hashCode;

  @override
  String toString() => "name: $name age: $age";
}

abstract class _PersonProps {
  static final String age = "age";
  static final String name = "name";
}
