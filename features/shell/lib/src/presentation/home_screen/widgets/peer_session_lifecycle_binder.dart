import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shell/src/presentation/home_screen/bloc/home_bloc.dart';

class PeerSessionLifecycleBinder extends StatefulWidget {
  const PeerSessionLifecycleBinder({required this.child, super.key});

  final Widget child;

  @override
  State<PeerSessionLifecycleBinder> createState() => _PeerSessionLifecycleBinderState();
}

class _PeerSessionLifecycleBinderState extends State<PeerSessionLifecycleBinder>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    if (!mounted) return;

    context.read<HomeBloc>().add(const HomeEvent.appResumed());
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
