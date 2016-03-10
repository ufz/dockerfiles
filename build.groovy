node('docker') {
	stage "Checkout"
	git 'https://github.com/ufz/dockerfiles'
	sh './build.sh'
}
