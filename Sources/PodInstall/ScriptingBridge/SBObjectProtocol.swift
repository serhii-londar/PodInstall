//
//  SBObjectProtocol.swift
//  OpenTerminal
//
//  Created by Serhii Londar on 3/21/18.
//  Copyright © 2018 SLON. All rights reserved.
//

import AppKit
import ScriptingBridge

@objc public protocol SBObjectProtocol: NSObjectProtocol {
	func get() -> Any!
}
