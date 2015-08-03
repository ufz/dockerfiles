node('docker') {
	stage "Checkout"
	git 'https://github.com/ufz/dockerfiles'

	stage "Building images"
	docker.build "ogs6/gcc-dev-essentials:${env.BUILD_TAG}", "gcc/dev-essentials"
	docker.build "ogs6/gcc-ogs-base:${env.BUILD_TAG}", "gcc/ogs-base"
	docker.build "ogs6/gcc-ogs-cli:${env.BUILD_TAG}", "gcc/ogs-cli"
	docker.build "ogs6/gcc-ogs-gui:${env.BUILD_TAG}", "gcc/ogs-gui"
}
