node('docker1') {
	stage('Checkout') { checkout scm }
	stage('Build') { sh './build.sh' }
	stage('Push') { sh './push.sh' }
}
