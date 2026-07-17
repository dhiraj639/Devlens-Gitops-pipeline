def call(String sonarServer,
         String projectKey,
         String projectName) {

    withSonarQubeEnv(sonarServer) {

        sh """
            sonar-scanner \
            -Dsonar.projectKey=${projectKey} \
            -Dsonar.projectName=${projectName} \
            -Dsonar.sources=.
        """

    }

}