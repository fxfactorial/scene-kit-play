#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>

#import <Cocoa/Cocoa.h>
#import <SceneKit/SceneKit.h>
#import <Foundation/Foundation.h>

#include "Cube.h"

int main (int argc, char **argv)
{
	NSApplication *app = [NSApplication sharedApplication];
	// Critical to have this so that you can add menus
	[NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
	Cube_app *gar_app = [Cube_app new];
	app.delegate = gar_app;
	[NSApp run];
}
