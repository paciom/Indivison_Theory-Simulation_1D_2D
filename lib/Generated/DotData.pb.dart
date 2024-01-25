//
//  Generated code. Do not modify.
//  source: DotData.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Dot2D.pb.dart' as $0;

class DotData extends $pb.GeneratedMessage {
  factory DotData({
    $core.double? initialAreaWidth,
    $core.double? initialAreaHeight,
    $core.double? collisionRadius,
    $fixnum.Int64? seed,
    $fixnum.Int64? numberOfDots,
    $fixnum.Int64? time,
    $core.Map<$fixnum.Int64, $0.Dot2D>? dots,
  }) {
    final $result = create();
    if (initialAreaWidth != null) {
      $result.initialAreaWidth = initialAreaWidth;
    }
    if (initialAreaHeight != null) {
      $result.initialAreaHeight = initialAreaHeight;
    }
    if (collisionRadius != null) {
      $result.collisionRadius = collisionRadius;
    }
    if (seed != null) {
      $result.seed = seed;
    }
    if (numberOfDots != null) {
      $result.numberOfDots = numberOfDots;
    }
    if (time != null) {
      $result.time = time;
    }
    if (dots != null) {
      $result.dots.addAll(dots);
    }
    return $result;
  }

  DotData._() : super();

  factory DotData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory DotData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DotData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'initialAreaWidth', $pb.PbFieldType.OD, protoName: 'initialAreaWidth')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'initialAreaHeight', $pb.PbFieldType.OD, protoName: 'initialAreaHeight')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'collisionRadius', $pb.PbFieldType.OD, protoName: 'collisionRadius')
    ..aInt64(4, _omitFieldNames ? '' : 'seed')
    ..aInt64(5, _omitFieldNames ? '' : 'numberOfDots', protoName: 'numberOfDots')
    ..aInt64(6, _omitFieldNames ? '' : 'time')
    ..m<$fixnum.Int64, $0.Dot2D>(7, _omitFieldNames ? '' : 'dots',
        entryClassName: 'DotData.DotsEntry',
        keyFieldType: $pb.PbFieldType.O6,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $0.Dot2D.create,
        valueDefaultOrMaker: $0.Dot2D.getDefault,
        packageName: const $pb.PackageName('dottheory'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DotData clone() => DotData()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DotData copyWith(void Function(DotData) updates) => super.copyWith((message) => updates(message as DotData)) as DotData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DotData create() => DotData._();

  DotData createEmptyInstance() => create();

  static $pb.PbList<DotData> createRepeated() => $pb.PbList<DotData>();

  @$core.pragma('dart2js:noInline')
  static DotData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DotData>(create);
  static DotData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get initialAreaWidth => $_getN(0);

  @$pb.TagNumber(1)
  set initialAreaWidth($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInitialAreaWidth() => $_has(0);

  @$pb.TagNumber(1)
  void clearInitialAreaWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get initialAreaHeight => $_getN(1);

  @$pb.TagNumber(2)
  set initialAreaHeight($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInitialAreaHeight() => $_has(1);

  @$pb.TagNumber(2)
  void clearInitialAreaHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get collisionRadius => $_getN(2);

  @$pb.TagNumber(3)
  set collisionRadius($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCollisionRadius() => $_has(2);

  @$pb.TagNumber(3)
  void clearCollisionRadius() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get seed => $_getI64(3);

  @$pb.TagNumber(4)
  set seed($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSeed() => $_has(3);

  @$pb.TagNumber(4)
  void clearSeed() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get numberOfDots => $_getI64(4);

  @$pb.TagNumber(5)
  set numberOfDots($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNumberOfDots() => $_has(4);

  @$pb.TagNumber(5)
  void clearNumberOfDots() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get time => $_getI64(5);

  @$pb.TagNumber(6)
  set time($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);

  @$pb.TagNumber(6)
  void clearTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.Map<$fixnum.Int64, $0.Dot2D> get dots => $_getMap(6);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
