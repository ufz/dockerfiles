node('docker') {
	stage "Checkout"
	git 'https://github.com/ufz/dockerfiles'

	stage "Building GCC images"
	docker.build "ogs6/gcc-dev-essentials:latest", "gcc/dev-essentials"
	docker.build "ogs6/gcc-ogs-base:latest", "gcc/ogs-base"
	docker.build "ogs6/gcc-ogs-cli:latest", "gcc/ogs-cli"
	docker.build "ogs6/gcc-ogs-gui:latest", "gcc/ogs-gui"
	docker.build "ogs5/gcc-ogs-base:latest", "gcc/ogs5-base"

	stage "Building Clang images"
	docker.build "ogs6/clang-dev-essentials:latest", "clang/dev-essentials"

	stage "Building MinGW images"
	docker.build "ogs6/mingw-dev-essentials:latest", "mingw/dev-essentials"
	docker.build "ogs5/mingw-ogs-base:latest", "mingw/ogs5-base"
	docker.build "ogs6/mingw-ogs-gui:latest", "mingw/ogs-gui"
}
