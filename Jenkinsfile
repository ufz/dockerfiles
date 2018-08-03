properties([parameters([
  booleanParam(defaultValue: false, description: '', name: 'nocache')
])])

def dockerfiles = [
    'conan/clang39',
    'conan/gcc49',
    'conan/gcc5',
    'conan/gcc6',
    'conan/gcc7',
    'misc/ansible',
    'jenkins/gcc/full'
]
def jobs = [:]
dockerfiles.each {
  jobs["${it}"] = {
    node('docker') {
      checkout scm
      dir ("${it}") {
        def imagename = it.replace("/", "_")
        image = docker.build("ogs6/${imagename}", "--pull .")
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
          image.push()
          // image.push("${env.BUILD_NUMBER}") // second image fails somehow ...
        }
      }
    }
  }
}
parallel jobs
