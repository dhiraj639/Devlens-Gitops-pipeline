def call(String repoUrl, String branch) {

    git(
        branch: branch,
        credentialsId: 'Github-cred',
        url: repoUrl
    )

}