// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult()';
}


}

/// @nodoc
class $GameResultCopyWith<$Res>  {
$GameResultCopyWith(GameResult _, $Res Function(GameResult) __);
}


/// Adds pattern-matching-related methods to [GameResult].
extension GameResultPatterns on GameResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InProgress value)?  inProgress,TResult Function( _Win value)?  over,TResult Function( _Draw value)?  draw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InProgress() when inProgress != null:
return inProgress(_that);case _Win() when over != null:
return over(_that);case _Draw() when draw != null:
return draw(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InProgress value)  inProgress,required TResult Function( _Win value)  over,required TResult Function( _Draw value)  draw,}){
final _that = this;
switch (_that) {
case _InProgress():
return inProgress(_that);case _Win():
return over(_that);case _Draw():
return draw(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Win value)?  over,TResult? Function( _Draw value)?  draw,}){
final _that = this;
switch (_that) {
case _InProgress() when inProgress != null:
return inProgress(_that);case _Win() when over != null:
return over(_that);case _Draw() when draw != null:
return draw(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inProgress,TResult Function( Tile winner)?  over,TResult Function()?  draw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InProgress() when inProgress != null:
return inProgress();case _Win() when over != null:
return over(_that.winner);case _Draw() when draw != null:
return draw();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inProgress,required TResult Function( Tile winner)  over,required TResult Function()  draw,}) {final _that = this;
switch (_that) {
case _InProgress():
return inProgress();case _Win():
return over(_that.winner);case _Draw():
return draw();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inProgress,TResult? Function( Tile winner)?  over,TResult? Function()?  draw,}) {final _that = this;
switch (_that) {
case _InProgress() when inProgress != null:
return inProgress();case _Win() when over != null:
return over(_that.winner);case _Draw() when draw != null:
return draw();case _:
  return null;

}
}

}

/// @nodoc


class _InProgress implements GameResult {
  const _InProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult.inProgress()';
}


}




/// @nodoc


class _Win implements GameResult {
  const _Win({required this.winner});
  

 final  Tile winner;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WinCopyWith<_Win> get copyWith => __$WinCopyWithImpl<_Win>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Win&&(identical(other.winner, winner) || other.winner == winner));
}


@override
int get hashCode => Object.hash(runtimeType,winner);

@override
String toString() {
  return 'GameResult.over(winner: $winner)';
}


}

/// @nodoc
abstract mixin class _$WinCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory _$WinCopyWith(_Win value, $Res Function(_Win) _then) = __$WinCopyWithImpl;
@useResult
$Res call({
 Tile winner
});




}
/// @nodoc
class __$WinCopyWithImpl<$Res>
    implements _$WinCopyWith<$Res> {
  __$WinCopyWithImpl(this._self, this._then);

  final _Win _self;
  final $Res Function(_Win) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = null,}) {
  return _then(_Win(
winner: null == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Tile,
  ));
}


}

/// @nodoc


class _Draw implements GameResult {
  const _Draw();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Draw);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult.draw()';
}


}




// dart format on
