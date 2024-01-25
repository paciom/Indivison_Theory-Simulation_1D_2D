//
//  Generated code. Do not modify.
//  source: Connection.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Connection extends $pb.GeneratedMessage {
  factory Connection({
    $fixnum.Int64? aId,
    $fixnum.Int64? bId,
  }) {
    final $result = create();
    if (aId != null) {
      $result.aId = aId;
    }
    if (bId != null) {
      $result.bId = bId;
    }
    return $result;
  }

  Connection._() : super();

  factory Connection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory Connection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Connection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'aId', protoName: 'aId')
    ..aInt64(2, _omitFieldNames ? '' : 'bId', protoName: 'bId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Connection clone() => Connection()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Connection copyWith(void Function(Connection) updates) => super.copyWith((message) => updates(message as Connection)) as Connection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Connection create() => Connection._();

  Connection createEmptyInstance() => create();

  static $pb.PbList<Connection> createRepeated() => $pb.PbList<Connection>();

  @$core.pragma('dart2js:noInline')
  static Connection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Connection>(create);
  static Connection? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get aId => $_getI64(0);

  @$pb.TagNumber(1)
  set aId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAId() => $_has(0);

  @$pb.TagNumber(1)
  void clearAId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bId => $_getI64(1);

  @$pb.TagNumber(2)
  set bId($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBId() => $_has(1);

  @$pb.TagNumber(2)
  void clearBId() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
