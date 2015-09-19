frameworks := -framework AppKit -framework Foundation -framework SceneKit
src := src/Cube.m src/main.m

all:
	clang -fobjc-arc $(frameworks) $(src) -o T
