import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
//    override func applicationDidFinishLaunching(_ notification: Notification) {
//        let maxSchoolSubMenu = NSApp.mainMenu?.item(withTag: 1)
//
//        let settingsMenu = maxSchoolSubMenu?.submenu?.item(withTag: 1)
//
//        settingsMenu?.isEnabled = true
//        print(settingsMenu?.title)
//    }
}
