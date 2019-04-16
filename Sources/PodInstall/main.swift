//
//  main.swift
//  PodInstall
//
//  Created by Serhii Londar on 3/21/18.
//  Copyright © 2018 SLON. All rights reserved.
//

import ScriptingBridge

let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")
terminal?.activate()
let finder = SBApplication(bundleIdentifier: "com.apple.Finder") as? FinderApplication 
//let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal") as! TerminalApplication

let selection = finder?.selection!
let selectionItems = selection?.get() as? Array<AnyObject>

let fileUrls: Array<String>

if (selectionItems?.isEmpty)! {
	let window = finder?.windows().firstObject as! FinderFinderWindow
	let container = window.target!
	let item = container.get() as! FinderItem
	fileUrls = [item.url!]
} else {
	fileUrls = selectionItems?.compactMap { $0 as? FinderApplicationFile }.compactMap { $0.url } ?? []
}



fileUrls.compactMap { URL(string: $0) }.forEach { url in
	terminal?.activate()
	let path = NSString.path(withComponents: url.pathComponents)
	let script = "cd '\(path)'; clear; ls -la; pod install"
	
	let terminalWindow = (terminal as! TerminalApplication).windows().object(atLocation: 1) as! TerminalWindow
	let tab = terminalWindow.selectedTab! as TerminalTab
	
	if !terminalWindow.frontmost || tab.busy {
		let _ = (terminal as! TerminalApplication).doScript(script, in:nil)
	} else {
		let _ = (terminal as! TerminalApplication).doScript(script, in:terminalWindow)
	}
}

