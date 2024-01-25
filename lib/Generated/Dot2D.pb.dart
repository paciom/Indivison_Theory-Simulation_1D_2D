//
//  Generated code. Do not modify.
//  source: Dot2D.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'CollisionRecord.pb.dart' as $2;
import 'LocationSwapRecord.pb.dart' as $3;
import 'ProtoOffset.pb.dart' as $0;
import 'google/protobuf/wrappers.pb.dart' as $1;

class Dot2D extends $pb.GeneratedMessage {
  factory Dot2D({
    $fixnum.Int64? id,
    $0.ProtoOffset? position,
    $0.ProtoOffset? direction,
    $1.Int64Value? connectedDotId,
    $core.Iterable<$2.CollisionRecord>? collisions,
    $core.Iterable<$0.ProtoOffset>? locationHistory,
    $core.Iterable<$3.LocationSwapRecord>? locationSwapHistory,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (position != null) {
      $result.position = position;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (connectedDotId != null) {
      $result.connectedDotId = connectedDotId;
    }
    if (collisions != null) {
      $result.collisions.addAll(collisions);
    }
    if (locationHistory != null) {
      $result.locationHistory.addAll(locationHistory);
    }
    if (locationSwapHistory != null) {
      $result.locationSwapHistory.addAll(locationSwapHistory);
    }
    return $result;
  }

  Dot2D._() : super();

  factory Dot2D.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory Dot2D.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Dot2D',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.ProtoOffset>(2, _omitFieldNames ? '' : 'position', subBuilder: $0.ProtoOffset.create)
    ..aOM<$0.ProtoOffset>(3, _omitFieldNames ? '' : 'direction', subBuilder: $0.ProtoOffset.create)
    ..aOM<$1.Int64Value>(4, _omitFieldNames ? '' : 'connectedDotId', protoName: 'connectedDotId', subBuilder: $1.Int64Value.create)
    ..pc<$2.CollisionRecord>(5, _omitFieldNames ? '' : 'collisions', $pb.PbFieldType.PM, subBuilder: $2.CollisionRecord.create)
    ..pc<$0.ProtoOffset>(6, _omitFieldNames ? '' : 'locationHistory', $pb.PbFieldType.PM,
        protoName: 'locationHistory', subBuilder: $0.ProtoOffset.create)
    ..pc<$3.LocationSwapRecord>(7, _omitFieldNames ? '' : 'locationSwapHistory', $pb.PbFieldType.PM,
        protoName: 'locationSwapHistory', subBuilder: $3.LocationSwapRecord.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Dot2D clone() => Dot2D()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Dot2D copyWith(void Function(Dot2D) updates) => super.copyWith((message) => updates(message as Dot2D)) as Dot2D;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Dot2D create() => Dot2D._();

  Dot2D createEmptyInstance() => create();

  static $pb.PbList<Dot2D> createRepeated() => $pb.PbList<Dot2D>();

  @$core.pragma('dart2js:noInline')
  static Dot2D getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dot2D>(create);
  static Dot2D? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ProtoOffset get position => $_getN(1);

  @$pb.TagNumber(2)
  set position($0.ProtoOffset v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);

  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(2)
  $0.ProtoOffset ensurePosition() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.ProtoOffset get direction => $_getN(2);

  @$pb.TagNumber(3)
  set direction($0.ProtoOffset v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);

  @$pb.TagNumber(3)
  void clearDirection() => clearField(3);

  @$pb.TagNumber(3)
  $0.ProtoOffset ensureDirection() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Int64Value get connectedDotId => $_getN(3);

  @$pb.TagNumber(4)
  set connectedDotId($1.Int64Value v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasConnectedDotId() => $_has(3);

  @$pb.TagNumber(4)
  void clearConnectedDotId() => clearField(4);

  @$pb.TagNumber(4)
  $1.Int64Value ensureConnectedDotId() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$2.CollisionRecord> get collisions => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$0.ProtoOffset> get locationHistory => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$3.LocationSwapRecord> get locationSwapHistory => $_getList(6);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
