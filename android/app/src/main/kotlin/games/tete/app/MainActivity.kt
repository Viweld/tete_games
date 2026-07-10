package games.tete.app

import android.bluetooth.BluetoothAdapter
import android.content.Intent
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private val bluetoothChannelName = "bluetooth_channel"
    private val blePeerForegroundChannelName = "games.tete.app/ble_peer_foreground"
    private val requestEnableBt = 1001

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, bluetoothChannelName).setMethodCallHandler {
                call,
                result ->
            if (call.method == "enableBluetooth") {
                openBluetoothPanel()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, blePeerForegroundChannelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "start" -> {
                        startBlePeerForegroundService()
                        result.success(null)
                    }
                    "stop" -> {
                        stopBlePeerForegroundService()
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun startBlePeerForegroundService() {
        val intent = Intent(this, BlePeerForegroundService::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(intent)
        } else {
            @Suppress("DEPRECATION")
            startService(intent)
        }
    }

    private fun stopBlePeerForegroundService() {
        val intent =
            Intent(this, BlePeerForegroundService::class.java).apply {
                action = BlePeerForegroundService.ACTION_STOP
            }
        startService(intent)
    }

    private fun openBluetoothPanel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startActivity(Intent(Settings.ACTION_BLUETOOTH_SETTINGS))
        } else {
            @Suppress("DEPRECATION")
            startActivityForResult(Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE), requestEnableBt)
        }
    }
}
