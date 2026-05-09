import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // 1. Setup the view controller and channel
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
    let deviceInfoChannel = FlutterMethodChannel(
        name: "platformchannel.companyname.com/deviceinfo", 
        binaryMessenger: flutterViewController.binaryMessenger
    )
    
    // 2. Listen for incoming method calls
    deviceInfoChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      
      // Check if the incoming call matches our expected method
      if (call.method == "getDeviceInfo") {
        self.getDeviceInfo(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // 3. Native Swift function to query iOS hardware
  private func getDeviceInfo(result: FlutterResult) {
    let device = UIDevice.current
    var deviceInfo: String = ""
    
    deviceInfo += "\nName: \(device.name)"
    deviceInfo += "\nModel: \(device.model)"
    deviceInfo += "\nSystem: \(device.systemName) \(device.systemVersion)"
    deviceInfo += "\nProximity Monitoring Enabled: \(device.isProximityMonitoringEnabled)"
    deviceInfo += "\nMultitasking Supported: \(device.isMultitaskingSupported)"
    
    // Return the formatted string back to Flutter
    result(deviceInfo)
  }
}