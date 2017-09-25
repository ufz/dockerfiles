properties([parameters([
  booleanParam(defaultValue: false, description: '', name: 'nocache')
])])

node('docker1') {
	stage('Checkout') { checkout scm }
	stage('Build') {
    if(params.nocache)
      sh './build.sh --no-cache'
    else
      sh './build.sh'
  }
	stage('Push') { sh './push.sh' }
}
