//
//  TerminalWrapper.m
//  PodInstall
//
//  Created by Serhii Londar on 2/15/19.
//  Copyright © 2019 SLON. All rights reserved.
//

#import "TerminalWrapper.h"
#import "Terminal.h"

@implementation TerminalWrapper

- (instancetype)init {
	self = [super init];
	if (self) {
		SBApplication *terminal = [SBApplication applicationWithBundleIdentifier:@""];
		[terminal activate];
	}
	return self;
}

@end
