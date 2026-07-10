import 'package:flutter_test/flutter_test.dart';
import 'package:peer/src/domain/ports/peer_player_identity_source.dart';
import 'package:shell/src/data/peer/profile_peer_identity_source.dart';
import 'package:shell/src/domain/models/player_profile.dart';

import 'support/shell_test_fakes.dart';

void main() {
  group('ProfilePeerIdentitySource', () {
    late FakeProfileRepository profileRepository;
    late ProfilePeerIdentitySource identitySource;

    setUp(() {
      profileRepository = FakeProfileRepository();
      identitySource = ProfilePeerIdentitySource(profileRepository);
    });

    tearDown(() => profileRepository.dispose());

    test('returns null when profile is absent', () async {
      expect(await identitySource.getCurrentIdentity(), isNull);
    });

    test('maps profile to peer player identity', () async {
      const PlayerProfile profile = PlayerProfile(id: 'player-1', displayName: 'Neo');
      await profileRepository.savePlayer(profile);

      final PeerPlayerIdentity? identity = await identitySource.getCurrentIdentity();

      expect(identity?.id, 'player-1');
      expect(identity?.displayName, 'Neo');
    });
  });
}
