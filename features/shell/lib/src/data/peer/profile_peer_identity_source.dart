import 'package:injectable/injectable.dart';
import 'package:peer/peer_connection.dart';
import 'package:shell/shell_domain.dart';

@LazySingleton(as: PeerPlayerIdentitySource)
final class ProfilePeerIdentitySource implements PeerPlayerIdentitySource {
  ProfilePeerIdentitySource(this._profileRepository);

  final ProfileRepository _profileRepository;

  @override
  Future<PeerPlayerIdentity?> getCurrentIdentity() async {
    final PlayerProfile? profile = await _profileRepository.getCurrentPlayer();
    if (profile == null) {
      return null;
    }

    return PeerPlayerIdentity(id: profile.id, displayName: profile.displayName);
  }
}
