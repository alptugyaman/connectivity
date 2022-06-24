import 'package:flutter/material.dart';
import 'package:offlinebar/network_connectivity_service.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final NetworkConnectivityManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkConnectivityManager();
    waitForScreen(() => _networkChange.handleNetworkChange(_updateView));
  }

  void _updateView(NetworkResult result) {
    setState(() => _networkResult = result);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      crossFadeState: _networkResult == NetworkResult.online
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: const SizedBox(),
      secondChild: Container(
        padding: const EdgeInsets.only(top: 10),
        alignment: Alignment.topCenter,
        height: kToolbarHeight,
        color: Colors.red,
        child: const Text(
          'You are currently Offline',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
