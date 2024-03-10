/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Example extends _i1.TableRow {
  Example._({
    int? id,
    required this.text,
  }) : super(id);

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

  static final t = ExampleTable();

  static const db = ExampleRepository._();

  String text;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'text': text,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'text':
        text = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Example>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Example>(
      where: where != null ? where(Example.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<Example?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Example>(
      where: where != null ? where(Example.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Example?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Example>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExampleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Example>(
      where: where(Example.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Example>(
      where: where != null ? where(Example.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ExampleInclude include() {
    return ExampleInclude._();
  }

  static ExampleIncludeList includeList({
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExampleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExampleTable>? orderByList,
    ExampleInclude? include,
  }) {
    return ExampleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Example.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Example.t),
      include: include,
    );
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

class ExampleTable extends _i1.Table {
  ExampleTable({super.tableRelation}) : super(tableName: 'note') {
    text = _i1.ColumnString(
      'text',
      this,
    );
  }

  late final _i1.ColumnString text;

  @override
  List<_i1.Column> get columns => [
        id,
        text,
      ];
}

@Deprecated('Use ExampleTable.t instead.')
ExampleTable tExample = ExampleTable();

class ExampleInclude extends _i1.IncludeObject {
  ExampleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Example.t;
}

class ExampleIncludeList extends _i1.IncludeList {
  ExampleIncludeList._({
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Example.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Example.t;
}

class ExampleRepository {
  const ExampleRepository._();

  Future<List<Example>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExampleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExampleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Example>(
      where: where?.call(Example.t),
      orderBy: orderBy?.call(Example.t),
      orderByList: orderByList?.call(Example.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Example?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExampleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExampleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Example>(
      where: where?.call(Example.t),
      orderBy: orderBy?.call(Example.t),
      orderByList: orderByList?.call(Example.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Example?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Example>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Example>> insert(
    _i1.Session session,
    List<Example> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Example>(
      rows,
      transaction: transaction,
    );
  }

  Future<Example> insertRow(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Example>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Example>> update(
    _i1.Session session,
    List<Example> rows, {
    _i1.ColumnSelections<ExampleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Example>(
      rows,
      columns: columns?.call(Example.t),
      transaction: transaction,
    );
  }

  Future<Example> updateRow(
    _i1.Session session,
    Example row, {
    _i1.ColumnSelections<ExampleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Example>(
      row,
      columns: columns?.call(Example.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Example> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Example>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Example row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Example>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExampleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Example>(
      where: where(Example.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExampleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Example>(
      where: where?.call(Example.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
