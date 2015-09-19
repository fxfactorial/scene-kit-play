frameworks := -framework AppKit -framework Foundation -framework SceneKit
src := src/Cube_scene.m src/Cube.m src/main.m

all:
	clang -fobjc-arc $(frameworks) \
	$(src) -o Cube
	./Cube
