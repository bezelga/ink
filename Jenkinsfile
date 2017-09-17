node {
  def appName = 'ink'
  def imageTag = "bezelga/${appName}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

  stage 'Clone repo'
  checkout scm

  stage 'Build docker image'
  sh("docker build -t ${imageTag} .")

  stage 'Push to registry'
  sh("docker push ${imageTag}")

  stage 'Deploy'
  switch (env.BRANCH_NAME) {
    case "staging":
        sh("sed -i.bak 's#CHANGE-HERE#${imageTag}#' ./kubernetes/k8s-app.yaml")
        sh("kubectl --namespace=staging apply -f kubernetes/k8s-app.yaml")
        break

    case "master":
        sh("sed -i.bak 's#CHANGE-HERE#${imageTag}#' ./kubernetes/k8s-app.yaml")
        sh("kubectl --namespace=production apply -f kubernetes/k8s-app.yaml")
        break
  }
}