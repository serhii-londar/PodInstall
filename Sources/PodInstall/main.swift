//
//  main.swift
//  PodInstall
//
//  Created by Serhii Londar on 3/21/18.
//  Copyright © 2018 SLON. All rights reserved.
//

import ScriptingBridge

let finder = SBApplication(bundleIdentifier: "com.apple.Finder")! as FinderApplication
let terminal = SBApplication(bundleIdentifier: "com.apple.Terminal")! as TerminalApplication

let selection = finder.selection!
let selectionItems = selection.get() as! Array<AnyObject>

let fileUrls: Array<String>

if selectionItems.isEmpty {
	let window = finder.windows!().firstObject as! FinderFinderWindow
	let container = window.target!
	let item = container.get() as! FinderItem
	fileUrls = [item.URL!]
} else {
	fileUrls = selectionItems.compactMap { $0 as? FinderApplicationFile }.compactMap { $0.URL }
}



fileUrls.compactMap { URL(string: $0) }.forEach { url in
	terminal.activate()
	let path = NSString.path(withComponents: url.pathComponents)
	let script = "cd '\(path)'; clear; pod install"
	
	let terminalWindow = terminal.windows!().object(atLocation: 1) as! TerminalWindow
	let tab = terminalWindow.selectedTab! as TerminalTab
	
	if !terminalWindow.frontmost! || tab.busy! {
		let _ = terminal.doScript!(script, in:nil)
	} else {
		let _ = terminal.doScript!(script, in:terminalWindow)
	}
}

