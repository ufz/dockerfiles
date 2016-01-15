node('docker') {
	stage "Checkout"
	git 'https://github.com/ufz/dockerfiles'

	docker.withRegistry("", "dockerHubId") {

		stage "Building GCC images"
		def image = docker.build "ogs6/gcc-dev-essentials:latest", "gcc/dev-essentials"
		//image.push()
		image = docker.build "ogs6/gcc-ogs-base:latest", "gcc/ogs-base"
		//image.push()
		image = docker.build "ogs6/gcc-ogs-gui:latest", "gcc/ogs-gui"
		//image.push()
		image = docker.build "ogs5/gcc-ogs-base:latest", "gcc/ogs5-base"
		//image.push()

		stage "Building Clang images"
		image = docker.build "ogs6/clang-dev-essentials:latest", "clang/dev-essentials"
		//image.push()
		image = docker.build "ogs6/clang-ogs-base:latest", "clang/ogs-base"
		//image.push()

		stage "Building MinGW images"
		image = docker.build "ogs6/mingw-dev-essentials:latest", "mingw/dev-essentials"
		//image.push()
		image = docker.build "ogs5/mingw-gcc:latest", "mingw/gcc"
		// image.push()
		image = docker.build "ogs6/mingw-ogs-gui:latest", "mingw/ogs-gui"
		// image.push() // too large for docker hub
		image = docker.build "ogs6/mingw-32-gcc:latest", "mingw-32/gcc"
		// image.push()
		image = docker.build "ogs6/mingw-32-ogs-base:latest", "mingw-32/ogs-base"
		// image.push()

		//stage "Push images"
	}
}
