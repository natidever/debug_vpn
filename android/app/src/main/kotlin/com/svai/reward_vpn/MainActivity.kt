package com.svai.reward_vpn

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.net.VpnService
import android.content.Intent
import android.app.Activity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.svai.reward_vpn/vpn"
    private val VPN_REQUEST_CODE = 24
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkVpnPermission" -> {
                    val intent = VpnService.prepare(this)
                    result.success(intent == null)
                }
                "requestVpnPermission" -> {
                    requestVpnPermission(result)
                }
                "showVpnPermissionDialog" -> {
                    showVpnPermissionDialog(result)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun requestVpnPermission(result: MethodChannel.Result) {
        val intent = VpnService.prepare(this)
        if (intent != null) {
            pendingResult = result
            startActivityForResult(intent, VPN_REQUEST_CODE)
        } else {
            // VPN permission already granted
            result.success(true)
        }
    }

    private fun showVpnPermissionDialog(result: MethodChannel.Result) {
        val intent = VpnService.prepare(this)
        if (intent != null) {
            pendingResult = result
            startActivityForResult(intent, VPN_REQUEST_CODE)
        } else {
            // VPN permission already granted
            result.success(true)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == VPN_REQUEST_CODE) {
            pendingResult?.let { result ->
                if (resultCode == Activity.RESULT_OK) {
                    result.success(true)
                } else {
                    result.success(false)
                }
                pendingResult = null
            }
        } else {
            super.onActivityResult(requestCode, resultCode, data)
        }
    }
}
