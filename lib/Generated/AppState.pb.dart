//
//  Generated code. Do not modify.
//  source: AppState.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'DotData.pb.dart' as $0;
import 'Particle2D.pb.dart' as $2;
import 'UiState.pb.dart' as $1;

class AppState extends $pb.GeneratedMessage {
  factory AppState({
    $0.DotData? data,
    $1.UiState? ui,
    $core.Map<$core.String, $2.Particle2D>? particles,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (ui != null) {
      $result.ui = ui;
    }
    if (particles != null) {
      $result.particles.addAll(particles);
    }
    return $result;
  }

  AppState._() : super();

  factory AppState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory AppState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AppState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..aOM<$0.DotData>(1, _omitFieldNames ? '' : 'data', subBuilder: $0.DotData.create)
    ..aOM<$1.UiState>(2, _omitFieldNames ? '' : 'ui', subBuilder: $1.UiState.create)
    ..m<$core.String, $2.Particle2D>(3, _omitFieldNames ? '' : 'particles',
        entryClassName: 'AppState.ParticlesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.Particle2D.create,
        valueDefaultOrMaker: $2.Particle2D.getDefault,
        packageName: const $pb.PackageName('dottheory'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppState clone() => AppState()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppState copyWith(void Function(AppState) updates) => super.copyWith((message) => updates(message as AppState)) as AppState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppState create() => AppState._();

  AppState createEmptyInstance() => create();

  static $pb.PbList<AppState> createRepeated() => $pb.PbList<AppState>();

  @$core.pragma('dart2js:noInline')
  static AppState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppState>(create);
  static AppState? _defaultInstance;

  @$pb.TagNumber(1)
  $0.DotData get data => $_getN(0);

  @$pb.TagNumber(1)
  set data($0.DotData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);

  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(1)
  $0.DotData ensureData() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.UiState get ui => $_getN(1);

  @$pb.TagNumber(2)
  set ui($1.UiState v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUi() => $_has(1);

  @$pb.TagNumber(2)
  void clearUi() => clearField(2);

  @$pb.TagNumber(2)
  $1.UiState ensureUi() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $2.Particle2D> get particles => $_getMap(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
