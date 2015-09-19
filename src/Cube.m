#import <Cocoa/Cocoa.h>
#import <SceneKit/SceneKit.h>

#include "Cube.h"

@implementation Cubes_app

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.window =
		[[NSWindow alloc]
			initWithContentRect:NSMakeRect(50, 10, 500, 600)
								styleMask:NSTitledWindowMask | NSResizableWindowMask
									backing:NSBackingStoreBuffered
										defer:NO];
	NSMenu *menu_bar = [NSMenu new];
	NSMenuItem *app_item = [NSMenuItem new];
	NSMenu *app_menu = [NSMenu new];
	NSString *app_name = [[NSProcessInfo processInfo] processName];
	NSString *quit_title = [@"Quit " stringByAppendingString:app_name];
	NSMenuItem *quit_item =
		[[NSMenuItem alloc]
			initWithTitle:quit_title
						 action:@selector(terminate:) keyEquivalent:@"q"];
	[app_menu addItem:quit_item];
	[menu_bar addItem:app_item];
	[app_item setSubmenu:app_menu];
	[NSApp setMainMenu:menu_bar];
	[self.window makeKeyAndOrderFront:NSApp];
	[NSApp activateIgnoringOtherApps:YES];
}

@end
