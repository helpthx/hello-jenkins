node {
  stage 'Checkout'
  git url: 'https://github.com/helpthx/hello-jenkins'

  stage 'build'
  checkout scm
  def customImage = docker.build('api_hello_dev')
  customImage.inside {
        sh './run.sh'
    }
		
}
