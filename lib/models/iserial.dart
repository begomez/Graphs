abstract class ISerial<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
