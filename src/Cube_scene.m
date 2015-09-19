#import <Cocoa/Cocoa.h>
#import <SceneKit/SceneKit.h>
#import <GLKit/GLKit.h>

#include "Cube_scene.h"

@implementation Cube_scene

-(instancetype)init
{
	if (self = [super init]) {
		[self setup_ui];
	}
	return self;
}

-(void)setup_ui
{

	SCNScene *s = [SCNScene new];
	SCNCamera *c = [SCNCamera new];

	SCNNode *camera_node = [SCNNode new];
	SCNNode *light_node = [SCNNode new];
	SCNLight *l = [SCNLight new];
	l.type = SCNLightTypeOmni;
	light_node.light = l;
	light_node.position =  (SCNVector3){.x = 1.5, .y = 1.5, .z = 1.5};
	camera_node.camera = c;
	camera_node.position = (SCNVector3){.x = -3, .y = 2, .z = 2};

	SCNBox *cube_geometry =
		[SCNBox boxWithWidth:1.5
									height:1.5
									length:1.5
					 chamferRadius:0];
	SCNNode *cube_node = [SCNNode nodeWithGeometry:cube_geometry];

	SCNLookAtConstraint *constraint =
		[SCNLookAtConstraint lookAtConstraintWithTarget:cube_node];
	constraint.gimbalLockEnabled = YES;
	camera_node.constraints = @[constraint];

	SCNPlane *plane_geometry =
		[SCNPlane planeWithWidth:50.0 height:50.0];
	SCNNode *plane_node = [SCNNode nodeWithGeometry:plane_geometry];
	plane_node.eulerAngles = (SCNVector3){.x = GLKMathDegreesToRadians(-90),
																				.y = 0,
																				.z = 0};
	[s.rootNode addChildNode:light_node];
	[s.rootNode addChildNode:camera_node];
	[s.rootNode addChildNode:cube_node];
	[s.rootNode addChildNode:plane_node];
	self.scene = s;
}

@end
