def call(String sonarServer,
         String projectKey,
         String projectName) {

    def scannerHome = tool 'SonarScanner'

    withSonarQubeEnv(sonarServer) {

        sh """
            ${scannerHome}/bin/sonar-scanner \
            -Dsonar.projectKey=${projectKey} \
            -Dsonar.projectName=${projectName} \
            -Dsonar.sources=.
        """

    }
}
