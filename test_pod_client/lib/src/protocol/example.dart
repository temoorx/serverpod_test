/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Example extends _i1.SerializableEntity {
  Example._({
    this.id,
    required this.text,
  });

  factory Example({
    int? id,
    required String text,
  }) = _ExampleImpl;

  factory Example.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Example(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  Example copyWith({
    int? id,
    String? text,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
    };
  }
}

class _Undefined {}

class _ExampleImpl extends Example {
  _ExampleImpl({
    int? id,
    required String text,
  }) : super._(
          id: id,
          text: text,
        );

  @override
  Example copyWith({
    Object? id = _Undefined,
    String? text,
  }) {
    return Example(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
    );
  }
}
