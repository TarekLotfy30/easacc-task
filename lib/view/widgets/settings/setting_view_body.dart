import 'package:easacc_task/core/routing/app_card.dart';
import 'package:easacc_task/core/shared_components/app_button.dart';
import 'package:easacc_task/core/shared_components/app_text.dart';
import 'package:easacc_task/view/widgets/settings/web_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// translate-me-ignore-all-file
class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  List<String> wifiPrinters = [];
  List<BluetoothDevice> bluetoothDevices = [];

  String? selectedWifiPrinter;
  BluetoothDevice? selectedBluetoothDevice;

  bool loadingWifi = false;
  bool loadingBluetooth = false;

  @override
  void initState() {
    super.initState();
    scanBluetoothPrinters();
  }

  Future<void> scanBluetoothPrinters() async {
    setState(() => loadingBluetooth = true);

    bluetoothDevices.clear();

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      for (var r in results) {
        if (!bluetoothDevices.contains(r.device)) {
          bluetoothDevices.add(r.device);
        }
      }

      setState(() {});
    });

    await FlutterBluePlus.stopScan();

    loadingBluetooth = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            data: "Web View Configuration",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          WebViewCard(),
          const SizedBox(height: 30),
          const AppText(
            data: "Network Devices Access",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(data: "Wifi Printers", fontSize: 20),
                SizedBox(height: 20),
                loadingWifi
                    ? const CircularProgressIndicator()
                    : DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedWifiPrinter,
                        items: wifiPrinters
                            .map(
                              (ip) =>
                                  DropdownMenuItem(value: ip, child: Text(ip)),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() => selectedWifiPrinter = value);
                        },
                      ),
                SizedBox(height: 20),
                AppText(data: "Bluetooth Printers", fontSize: 20),
                SizedBox(height: 20),
                loadingBluetooth
                    ? const CircularProgressIndicator()
                    : DropdownButtonFormField<BluetoothDevice>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedBluetoothDevice,
                        items: bluetoothDevices
                            .map(
                              (device) => DropdownMenuItem(
                                value: device,
                                child: Text(device.platformName),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() => selectedBluetoothDevice = value);
                        },
                      ),
              ],
            ),
          ),
          Spacer(),
          AppButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Saved")));
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
