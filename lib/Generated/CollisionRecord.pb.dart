//
//  Generated code. Do not modify.
//  source: CollisionRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'ProtoOffset.pb.dart' as $0;

class CollisionRecord extends $pb.GeneratedMessage {
  factory CollisionRecord({
    $fixnum.Int64? dotId,
    $fixnum.Int64? time,
    $0.ProtoOffset? location,
  }) {
    final $result = create();
    if (dotId != null) {
      $result.dotId = dotId;
    }
    if (time != null) {
      $result.time = time;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }

  CollisionRecord._() : super();

  factory CollisionRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory CollisionRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CollisionRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'dotId', protoName: 'dotId')
    ..aInt64(2, _omitFieldNames ? '' : 'time')
    ..aOM<$0.ProtoOffset>(3, _omitFieldNames ? '' : 'location', subBuilder: $0.ProtoOffset.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CollisionRecord clone() => CollisionRecord()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CollisionRecord copyWith(void Function(CollisionRecord) updates) =>
      super.copyWith((message) => updates(message as CollisionRecord)) as CollisionRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CollisionRecord create() => CollisionRecord._();

  CollisionRecord createEmptyInstance() => create();

  static $pb.PbList<CollisionRecord> createRepeated() => $pb.PbList<CollisionRecord>();

  @$core.pragma('dart2js:noInline')
  static CollisionRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CollisionRecord>(create);
  static CollisionRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get dotId => $_getI64(0);

  @$pb.TagNumber(1)
  set dotId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDotId() => $_has(0);

  @$pb.TagNumber(1)
  void clearDotId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);

  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);

  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $0.ProtoOffset get location => $_getN(2);

  @$pb.TagNumber(3)
  set location($0.ProtoOffset v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLocation() => $_has(2);

  @$pb.TagNumber(3)
  void clearLocation() => clearField(3);

  @$pb.TagNumber(3)
  $0.ProtoOffset ensureLocation() => $_ensure(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
