/// Data Writer
// ignore: one_member_abstracts
abstract class DataWriter<ModelT extends Object> {
  /// Returns raw data given a record.
  dynamic write(ModelT record);
}
