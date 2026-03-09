// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'9ce5d3a1d8e34e1852c77b7a602fe3158dd8f0ca';

@ProviderFor(gameLocalDatasource)
final gameLocalDatasourceProvider = GameLocalDatasourceProvider._();

final class GameLocalDatasourceProvider
    extends
        $FunctionalProvider<
          GameLocalDatasource,
          GameLocalDatasource,
          GameLocalDatasource
        >
    with $Provider<GameLocalDatasource> {
  GameLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<GameLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GameLocalDatasource create(Ref ref) {
    return gameLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameLocalDatasource>(value),
    );
  }
}

String _$gameLocalDatasourceHash() =>
    r'2e2d395df11b43b0743105a2f5fc41236426447c';

@ProviderFor(gameRepository)
final gameRepositoryProvider = GameRepositoryProvider._();

final class GameRepositoryProvider
    extends $FunctionalProvider<GameRepository, GameRepository, GameRepository>
    with $Provider<GameRepository> {
  GameRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameRepositoryHash();

  @$internal
  @override
  $ProviderElement<GameRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameRepository create(Ref ref) {
    return gameRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameRepository>(value),
    );
  }
}

String _$gameRepositoryHash() => r'958c375316f194932f3d15beb54fdff2a1e0075d';
