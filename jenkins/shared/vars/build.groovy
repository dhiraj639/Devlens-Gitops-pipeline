def call(String imageName, String tag, String dockerHubUsername) {

    sh """
        docker build \
        -t ${dockerHubUsername}/${imageName}:${tag} .
    """

}