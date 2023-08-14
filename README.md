# Inception Project

This project is a web application that uses WordPress and MariaDB. It is designed to be run using Docker Compose.

## Prerequisites

Before you can run this project, you must have [docker](https://www.docker.com/) installed on your system.

## Installation

To install and run this project, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Run the `make` command to start the containers
4. Add local DNS entries for `alopez.42.fr`
  - Exemple (MacOS or Linux): `sudo echo "127.0.0.1  alopez.42.fr" >> /etc/hosts`

5. Open your web browser and navigate to `https://alopez.42.fr` to access the WordPress site.

## Configuration

Run `make setup` to setup the .env file.
Alternatively, you can manually create the .env file by copying the .env.example file and updating the values.

## Usage

To stop the containers, run the following command: `make stop`

To remove the containers and images, run the following command: `make fclean`

## Author

- **Axel Lopez** [*alopez*](https://profile.intra.42.fr/users/alopez)

