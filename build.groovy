node('docker') {
	stage "Checkout"
	git 'https://github.com/ufz/dockerfiles'
	stage "Build"
	sh './build.sh'
}
