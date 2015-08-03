node('docker') {
	stage "Checkout"
	git 'https://github.com/ufz/dockerfiles'

	stage "Building GCC images"
	docker.build "ogs6/gcc-dev-essentials:${env.BUILD_TAG}", "gcc/dev-essentials"
	docker.build "ogs6/gcc-ogs-base:${env.BUILD_TAG}", "gcc/ogs-base"
	docker.build "ogs6/gcc-ogs-cli:${env.BUILD_TAG}", "gcc/ogs-cli"
	docker.build "ogs6/gcc-ogs-gui:${env.BUILD_TAG}", "gcc/ogs-gui"
	docker.build "ogs5/gcc-ogs-base:${env.BUILD_TAG}", "gcc/ogs5-base"

	stage "Building Clang images"
	docker.build "ogs6/clang-dev-essentials:${env.BUILD_TAG}", "clang/dev-essentials"

	stage "Building MinGW images"
	docker.build "ogs6/mingw-dev-essentials:${env.BUILD_TAG}", "mingw/dev-essentials"
	docker.build "ogs5/mingw-ogs-base:${env.BUILD_TAG}", "mingw/ogs5-base"
	docker.build "ogs6/mingw-ogs-gui:${env.BUILD_TAG}", "mingw/ogs-gui"
}
