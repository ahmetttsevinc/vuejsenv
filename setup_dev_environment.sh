#!/bin/bash

# Function to check if Docker is installed
check_docker() {
    if command -v docker &>/dev/null; then
        echo "Docker is installed. Continuing..."
    else
        echo "Docker is not installed. Please install Docker and run the script again."
        exit 1
    fi
}


# Function to build the Dockerfile and run the container
run_dockerfile() {
    docker build -t vuejs-image .
    docker run -it -p 8080:80 --rm --name vuejs-container vuejs-image
    }


# Main function to execute the setup
setup() {
    check_docker
    run_dockerfile
}

# Execute the setup function
setup
