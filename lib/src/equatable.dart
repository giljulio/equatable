import 'package:collection/collection.dart';

/// A class that helps implement equality
/// without needing to explicitly override == and [hashCode].
/// Equatables override their own == and [hashCode] based on
/// the provided `properties`.
abstract class Equatable {
  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  final List props;

  /// The constructor takes an optional [List] of `props` (properties) which
  /// will be used to determine whether two [Equatables] are equal.
  /// If no properties are provided, `props` will be initialized to
  /// an empty [List].
  Equatable([this.props = const []]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Equatable &&
          runtimeType == other.runtimeType &&
          ListEquality().equals(props, other.props);

  @override
  int get hashCode => runtimeType.hashCode ^ _propsHashCode;

  int get _propsHashCode {
    int hashCode = 0;

    props.forEach((prop) {
      hashCode = hashCode ^ prop.hashCode;
    });

    return hashCode;
  }

  @override
  String toString() => props.toString();
}
