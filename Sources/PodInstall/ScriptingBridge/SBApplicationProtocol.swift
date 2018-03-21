//
//  SBApplicationProtocol.swift
//  OpenTerminal
//
//  Created by Serhii Londar on 3/21/18.
//  Copyright © 2018 SLON. All rights reserved.
//

import AppKit
import ScriptingBridge

@objc public protocol SBApplicationProtocol: SBObjectProtocol {
	func activate()
	var delegate: SBApplicationDelegate! { get set }
	var isRunning: Bool { get }
}
