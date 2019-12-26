node {
  stage 'Checkout'
  git url: 'https://github.com/helpthx/hello-jenkins'

  stage 'build'
  docker.build('api_hello_dev')

  stage 'deploy'
  sh './run.sh'
}
