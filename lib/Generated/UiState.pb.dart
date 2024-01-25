//
//  Generated code. Do not modify.
//  source: UiState.proto
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
import 'ProtoSize.pb.dart' as $1;

class UiState extends $pb.GeneratedMessage {
  factory UiState({
    $core.double? scale,
    $core.double? dotPaintRadius,
    $0.ProtoOffset? scaleCenter,
    $0.ProtoOffset? panCenter,
    $fixnum.Int64? maxTrailAge,
    $core.bool? running,
    $core.bool? showConnection,
    $1.ProtoSize? size,
    $core.bool? showPositionHistory,
  }) {
    final $result = create();
    if (scale != null) {
      $result.scale = scale;
    }
    if (dotPaintRadius != null) {
      $result.dotPaintRadius = dotPaintRadius;
    }
    if (scaleCenter != null) {
      $result.scaleCenter = scaleCenter;
    }
    if (panCenter != null) {
      $result.panCenter = panCenter;
    }
    if (maxTrailAge != null) {
      $result.maxTrailAge = maxTrailAge;
    }
    if (running != null) {
      $result.running = running;
    }
    if (showConnection != null) {
      $result.showConnection = showConnection;
    }
    if (size != null) {
      $result.size = size;
    }
    if (showPositionHistory != null) {
      $result.showPositionHistory = showPositionHistory;
    }
    return $result;
  }

  UiState._() : super();

  factory UiState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory UiState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UiState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'scale', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'dotPaintRadius', $pb.PbFieldType.OD, protoName: 'dotPaintRadius')
    ..aOM<$0.ProtoOffset>(3, _omitFieldNames ? '' : 'scaleCenter', protoName: 'scaleCenter', subBuilder: $0.ProtoOffset.create)
    ..aOM<$0.ProtoOffset>(4, _omitFieldNames ? '' : 'panCenter', protoName: 'panCenter', subBuilder: $0.ProtoOffset.create)
    ..aInt64(5, _omitFieldNames ? '' : 'maxTrailAge', protoName: 'maxTrailAge')
    ..aOB(6, _omitFieldNames ? '' : 'running')
    ..aOB(7, _omitFieldNames ? '' : 'showConnection', protoName: 'showConnection')
    ..aOM<$1.ProtoSize>(8, _omitFieldNames ? '' : 'size', subBuilder: $1.ProtoSize.create)
    ..aOB(9, _omitFieldNames ? '' : 'showPositionHistory', protoName: 'showPositionHistory')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UiState clone() => UiState()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UiState copyWith(void Function(UiState) updates) => super.copyWith((message) => updates(message as UiState)) as UiState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UiState create() => UiState._();

  UiState createEmptyInstance() => create();

  static $pb.PbList<UiState> createRepeated() => $pb.PbList<UiState>();

  @$core.pragma('dart2js:noInline')
  static UiState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UiState>(create);
  static UiState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get scale => $_getN(0);

  @$pb.TagNumber(1)
  set scale($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScale() => $_has(0);

  @$pb.TagNumber(1)
  void clearScale() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get dotPaintRadius => $_getN(1);

  @$pb.TagNumber(2)
  set dotPaintRadius($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDotPaintRadius() => $_has(1);

  @$pb.TagNumber(2)
  void clearDotPaintRadius() => clearField(2);

  @$pb.TagNumber(3)
  $0.ProtoOffset get scaleCenter => $_getN(2);

  @$pb.TagNumber(3)
  set scaleCenter($0.ProtoOffset v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScaleCenter() => $_has(2);

  @$pb.TagNumber(3)
  void clearScaleCenter() => clearField(3);

  @$pb.TagNumber(3)
  $0.ProtoOffset ensureScaleCenter() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.ProtoOffset get panCenter => $_getN(3);

  @$pb.TagNumber(4)
  set panCenter($0.ProtoOffset v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPanCenter() => $_has(3);

  @$pb.TagNumber(4)
  void clearPanCenter() => clearField(4);

  @$pb.TagNumber(4)
  $0.ProtoOffset ensurePanCenter() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get maxTrailAge => $_getI64(4);

  @$pb.TagNumber(5)
  set maxTrailAge($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMaxTrailAge() => $_has(4);

  @$pb.TagNumber(5)
  void clearMaxTrailAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get running => $_getBF(5);

  @$pb.TagNumber(6)
  set running($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRunning() => $_has(5);

  @$pb.TagNumber(6)
  void clearRunning() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get showConnection => $_getBF(6);

  @$pb.TagNumber(7)
  set showConnection($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShowConnection() => $_has(6);

  @$pb.TagNumber(7)
  void clearShowConnection() => clearField(7);

  @$pb.TagNumber(8)
  $1.ProtoSize get size => $_getN(7);

  @$pb.TagNumber(8)
  set size($1.ProtoSize v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSize() => $_has(7);

  @$pb.TagNumber(8)
  void clearSize() => clearField(8);

  @$pb.TagNumber(8)
  $1.ProtoSize ensureSize() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.bool get showPositionHistory => $_getBF(8);

  @$pb.TagNumber(9)
  set showPositionHistory($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasShowPositionHistory() => $_has(8);

  @$pb.TagNumber(9)
  void clearShowPositionHistory() => clearField(9);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
