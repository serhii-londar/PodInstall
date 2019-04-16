import AppKit
import ScriptingBridge

//@objc public protocol SBObjectProtocol: NSObjectProtocol {
//    func get() -> Any!
//}

//@objc public protocol SBApplicationProtocol: SBObjectProtocol {
//    func activate()
//    var delegate: SBApplicationDelegate! { get set }
//    var isRunning: Bool { get }
//}

// MARK: TerminalSaveOptions
@objc public enum TerminalSaveOptions : AEKeyword {
    case yes = 0x79657320 /* 'yes ' */
    case no = 0x6e6f2020 /* 'no  ' */
    case ask = 0x61736b20 /* 'ask ' */
}

// MARK: TerminalPrintingErrorHandling
@objc public enum TerminalPrintingErrorHandling : AEKeyword {
    case standard = 0x6c777374 /* 'lwst' */
    case detailed = 0x6c776474 /* 'lwdt' */
}

// MARK: TerminalGenericMethods
@objc public protocol TerminalGenericMethods {
    @objc optional func closeSaving(_ saving: TerminalSaveOptions, savingIn: Any!) // Close a document.
    @objc optional func saveIn(_ in_: Any!) // Save a document.
    @objc optional func printWithProperties(_ withProperties: Any!, printDialog: Any!) // Print a document.
    @objc optional func delete() // Delete an object.
    @objc optional func duplicateTo(_ to: Any!, withProperties: Any!) // Copy object(s) and put the copies at a new location.
    @objc optional func exists() // Verify if an object exists.
    @objc optional func moveTo(_ to: Any!) // Move object(s) to a new location.
}

// MARK: TerminalApplication
@objc public protocol TerminalApplication: SBApplicationProtocol {
    @objc optional func windows()
    @objc optional var name: Int { get } // The name of the application.
    @objc optional var frontmost: Int { get } // Is this the frontmost (active) application?
    @objc optional var version: Int { get } // The version of the application.
    @objc optional func `open`(_ x: Any!) // Open a document.
    @objc optional func print(_ x: Any!, withProperties: Any!, printDialog: Any!) // Print a document.
    @objc optional func quitSaving(_ saving: TerminalSaveOptions) // Quit the application.
    @objc optional func doScript(_ x: Any!, in in_: Any!) -> TerminalTab // Runs a UNIX shell script or command.
    @objc optional func settingsSets()
    @objc optional var defaultSettings: TerminalSettingsSet { get } // The settings set used for new windows.
    @objc optional var startupSettings: TerminalSettingsSet { get } // The settings set used for the window created on application startup.
    @objc optional func setDefaultSettings(_ defaultSettings: TerminalSettingsSet!) // The settings set used for new windows.
    @objc optional func setStartupSettings(_ startupSettings: TerminalSettingsSet!) // The settings set used for the window created on application startup.
}
extension SBApplication: TerminalApplication {}

// MARK: TerminalWindow
@objc public protocol TerminalWindow: SBObjectProtocol, TerminalGenericMethods {
    @objc optional func tabs()
    @objc optional var name: Int { get } // The full title of the window.
    @objc optional func id() // The unique identifier of the window.
    @objc optional var index: Int { get } // The index of the window, ordered front to back.
    @objc optional var bounds: Int { get } // The bounding rectangle of the window.
    @objc optional var closeable: Int { get } // Whether the window has a close box.
    @objc optional var miniaturizable: Int { get } // Whether the window can be minimized.
    @objc optional var miniaturized: Int { get } // Whether the window is currently minimized.
    @objc optional var resizable: Int { get } // Whether the window can be resized.
    @objc optional var visible: Int { get } // Whether the window is currently visible.
    @objc optional var zoomable: Int { get } // Whether the window can be zoomed.
    @objc optional var zoomed: Int { get } // Whether the window is currently zoomed.
    @objc optional var frontmost: Int { get } // Whether the window is currently the frontmost Terminal window.
    @objc optional var selectedTab: TerminalTab { get }
    @objc optional var position: Int { get } // The position of the window, relative to the upper left corner of the screen.
    @objc optional var origin: Int { get } // The position of the window, relative to the lower left corner of the screen.
    @objc optional var size: Int { get } // The width and height of the window
    @objc optional var frame: Int { get } // The bounding rectangle, relative to the lower left corner of the screen.
    @objc optional func setIndex(_ index: Int) // The index of the window, ordered front to back.
    @objc optional func setBounds(_ bounds: Int) // The bounding rectangle of the window.
    @objc optional func setMiniaturized(_ miniaturized: Int) // Whether the window is currently minimized.
    @objc optional func setVisible(_ visible: Int) // Whether the window is currently visible.
    @objc optional func setZoomed(_ zoomed: Int) // Whether the window is currently zoomed.
    @objc optional func setFrontmost(_ frontmost: Int) // Whether the window is currently the frontmost Terminal window.
    @objc optional func setSelectedTab(_ selectedTab: TerminalTab!)
    @objc optional func setPosition(_ position: Int) // The position of the window, relative to the upper left corner of the screen.
    @objc optional func setOrigin(_ origin: Int) // The position of the window, relative to the lower left corner of the screen.
    @objc optional func setSize(_ size: Int) // The width and height of the window
    @objc optional func setFrame(_ frame: Int) // The bounding rectangle, relative to the lower left corner of the screen.
}
extension SBObject: TerminalWindow {}

// MARK: TerminalSettingsSet
@objc public protocol TerminalSettingsSet: SBObjectProtocol, TerminalGenericMethods {
    @objc optional func id() // The unique identifier of the settings set.
    @objc optional var name: Int { get } // The name of the settings set.
    @objc optional var numberOfRows: Int { get } // The number of rows displayed in the tab.
    @objc optional var numberOfColumns: Int { get } // The number of columns displayed in the tab.
    @objc optional var cursorColor: Int { get } // The cursor color for the tab.
    @objc optional var backgroundColor: Int { get } // The background color for the tab.
    @objc optional var normalTextColor: Int { get } // The normal text color for the tab.
    @objc optional var boldTextColor: Int { get } // The bold text color for the tab.
    @objc optional var fontName: Int { get } // The name of the font used to display the tab’s contents.
    @objc optional var fontSize: Int { get } // The size of the font used to display the tab’s contents.
    @objc optional var fontAntialiasing: Int { get } // Whether the font used to display the tab’s contents is antialiased.
    @objc optional var titleDisplaysDeviceName: Int { get } // Whether the title contains the device name.
    @objc optional var titleDisplaysShellPath: Int { get } // Whether the title contains the shell path.
    @objc optional var titleDisplaysWindowSize: Int { get } // Whether the title contains the tab’s size, in rows and columns.
    @objc optional var titleDisplaysSettingsName: Int { get } // Whether the title contains the settings name.
    @objc optional var titleDisplaysCustomTitle: Int { get } // Whether the title contains a custom title.
    @objc optional var customTitle: Int { get } // The tab’s custom title.
    @objc optional func setName(_ name: Int) // The name of the settings set.
    @objc optional func setNumberOfRows(_ numberOfRows: Int) // The number of rows displayed in the tab.
    @objc optional func setNumberOfColumns(_ numberOfColumns: Int) // The number of columns displayed in the tab.
    @objc optional func setCursorColor(_ cursorColor: Int) // The cursor color for the tab.
    @objc optional func setBackgroundColor(_ backgroundColor: Int) // The background color for the tab.
    @objc optional func setNormalTextColor(_ normalTextColor: Int) // The normal text color for the tab.
    @objc optional func setBoldTextColor(_ boldTextColor: Int) // The bold text color for the tab.
    @objc optional func setFontName(_ fontName: Int) // The name of the font used to display the tab’s contents.
    @objc optional func setFontSize(_ fontSize: Int) // The size of the font used to display the tab’s contents.
    @objc optional func setFontAntialiasing(_ fontAntialiasing: Int) // Whether the font used to display the tab’s contents is antialiased.
    @objc optional func setTitleDisplaysDeviceName(_ titleDisplaysDeviceName: Int) // Whether the title contains the device name.
    @objc optional func setTitleDisplaysShellPath(_ titleDisplaysShellPath: Int) // Whether the title contains the shell path.
    @objc optional func setTitleDisplaysWindowSize(_ titleDisplaysWindowSize: Int) // Whether the title contains the tab’s size, in rows and columns.
    @objc optional func setTitleDisplaysSettingsName(_ titleDisplaysSettingsName: Int) // Whether the title contains the settings name.
    @objc optional func setTitleDisplaysCustomTitle(_ titleDisplaysCustomTitle: Int) // Whether the title contains a custom title.
    @objc optional func setCustomTitle(_ customTitle: Int) // The tab’s custom title.
}
extension SBObject: TerminalSettingsSet {}

// MARK: TerminalTab
@objc public protocol TerminalTab: SBObjectProtocol, TerminalGenericMethods {
    @objc optional var numberOfRows: Int { get } // The number of rows displayed in the tab.
    @objc optional var numberOfColumns: Int { get } // The number of columns displayed in the tab.
    @objc optional var contents: Int { get } // The currently visible contents of the tab.
    @objc optional var history: Int { get } // The contents of the entire scrolling buffer of the tab.
    @objc optional var busy: Int { get } // Whether the tab is busy running a process.
    @objc optional var selected: Int { get } // Whether the tab is selected.
    @objc optional var titleDisplaysCustomTitle: Int { get } // Whether the title contains a custom title.
    @objc optional var customTitle: Int { get } // The tab’s custom title.
    @objc optional var tty: Int { get } // The tab’s TTY device.
    @objc optional var currentSettings: TerminalSettingsSet { get } // The set of settings which control the tab’s behavior and appearance.
    @objc optional var cursorColor: Int { get } // The cursor color for the tab.
    @objc optional var backgroundColor: Int { get } // The background color for the tab.
    @objc optional var normalTextColor: Int { get } // The normal text color for the tab.
    @objc optional var boldTextColor: Int { get } // The bold text color for the tab.
    @objc optional var titleDisplaysDeviceName: Int { get } // Whether the title contains the device name.
    @objc optional var titleDisplaysShellPath: Int { get } // Whether the title contains the shell path.
    @objc optional var titleDisplaysWindowSize: Int { get } // Whether the title contains the tab’s size, in rows and columns.
    @objc optional var titleDisplaysFileName: Int { get } // Whether the title contains the file name.
    @objc optional var fontName: Int { get } // The name of the font used to display the tab’s contents.
    @objc optional var fontSize: Int { get } // The size of the font used to display the tab’s contents.
    @objc optional var fontAntialiasing: Int { get } // Whether the font used to display the tab’s contents is antialiased.
    @objc optional func setNumberOfRows(_ numberOfRows: Int) // The number of rows displayed in the tab.
    @objc optional func setNumberOfColumns(_ numberOfColumns: Int) // The number of columns displayed in the tab.
    @objc optional func setSelected(_ selected: Int) // Whether the tab is selected.
    @objc optional func setTitleDisplaysCustomTitle(_ titleDisplaysCustomTitle: Int) // Whether the title contains a custom title.
    @objc optional func setCustomTitle(_ customTitle: Int) // The tab’s custom title.
    @objc optional func setCurrentSettings(_ currentSettings: TerminalSettingsSet!) // The set of settings which control the tab’s behavior and appearance.
    @objc optional func setCursorColor(_ cursorColor: Int) // The cursor color for the tab.
    @objc optional func setBackgroundColor(_ backgroundColor: Int) // The background color for the tab.
    @objc optional func setNormalTextColor(_ normalTextColor: Int) // The normal text color for the tab.
    @objc optional func setBoldTextColor(_ boldTextColor: Int) // The bold text color for the tab.
    @objc optional func setTitleDisplaysDeviceName(_ titleDisplaysDeviceName: Int) // Whether the title contains the device name.
    @objc optional func setTitleDisplaysShellPath(_ titleDisplaysShellPath: Int) // Whether the title contains the shell path.
    @objc optional func setTitleDisplaysWindowSize(_ titleDisplaysWindowSize: Int) // Whether the title contains the tab’s size, in rows and columns.
    @objc optional func setTitleDisplaysFileName(_ titleDisplaysFileName: Int) // Whether the title contains the file name.
    @objc optional func setFontName(_ fontName: Int) // The name of the font used to display the tab’s contents.
    @objc optional func setFontSize(_ fontSize: Int) // The size of the font used to display the tab’s contents.
    @objc optional func setFontAntialiasing(_ fontAntialiasing: Int) // Whether the font used to display the tab’s contents is antialiased.
}
extension SBObject: TerminalTab {}

