/// Custom abstraction for any serializable class
abstract class ICustomSerializable<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
