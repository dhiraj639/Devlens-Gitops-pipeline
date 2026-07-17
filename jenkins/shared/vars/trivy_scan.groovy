def call() {

    sh """
        trivy fs \
        --severity HIGH,CRITICAL \
        --exit-code 0 \
        .
    """

}