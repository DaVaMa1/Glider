import 'dart:ui';

import 'package:glider/models/theme_base.dart';
import 'package:glider/providers/repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeFutureProvider<ThemeBase?> themeBaseProvider =
    FutureProvider.autoDispose(
  (ProviderReference ref) => ref.read(storageRepositoryProvider).themeBase,
);

final AutoDisposeFutureProvider<Color?> themeColorProvider =
    FutureProvider.autoDispose(
  (ProviderReference ref) => ref.read(storageRepositoryProvider).themeColor,
);

final AutoDisposeFutureProviderFamily<bool, int> visitedProvider =
    FutureProvider.autoDispose.family(
  (ProviderReference ref, int id) =>
      ref.read(storageRepositoryProvider).visited(id: id),
);

final FutureProviderFamily<bool, int> collapsedProvider = FutureProvider.family(
  (ProviderReference ref, int id) =>
      ref.read(storageRepositoryProvider).collapsed(id: id),
);

final AutoDisposeFutureProvider<bool> completedWalkthroughProvider =
    FutureProvider.autoDispose(
  (ProviderReference ref) =>
      ref.read(storageRepositoryProvider).completedWalkthrough,
);

final AutoDisposeFutureProvider<bool> loggedInProvider =
    FutureProvider.autoDispose(
  (ProviderReference ref) => ref.read(authRepositoryProvider).loggedIn,
);

final AutoDisposeFutureProvider<String?> usernameProvider =
    FutureProvider.autoDispose(
  (ProviderReference ref) => ref.read(authRepositoryProvider).username,
);

final AutoDisposeFutureProviderFamily<bool, int> favoritedProvider =
    FutureProvider.autoDispose.family(
  (ProviderReference ref, int id) =>
      ref.read(storageRepositoryProvider).favorited(id: id),
);

final AutoDisposeFutureProviderFamily<bool, int> upvotedProvider =
    FutureProvider.autoDispose.family(
  (ProviderReference ref, int id) =>
      ref.read(storageRepositoryProvider).upvoted(id: id),
);
