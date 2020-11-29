# Open Information Systems Project: group 1: Travelling data and covid-19
Project for the Open Information System course in the first year of the master Computer science at the VUB.

## Manual

This system uses docker and docker-compose to run an H2 database and a SPARQL endpoint on top of this database using the [https://ontop-vkg.org/](Ontop Protégé plugin).
It consists of two docker containers, one containing the database and one containing the Ontop application.

### Installation steps:

- install docker:

  - ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/
  - windows: https://docs.docker.com/docker-for-windows/install/

- install docker-compose: https://docs.docker.com/compose/install/

### Running:

First open a terminal and navigate to the root folder.
Then call following command:

* ubuntu:
        ```
        docker-compose up --build
        ```

* windows:
        ```
        docker-compose up --build
        ```

The ```
    --build
      ``` parameter is only required when running the system for the first time, at later occasions this parameter can be omitted.
If a permission error occurs try running the command with administrator privileges.

### Shutting down:

To shut the server down press ctrl-c in the terminal running it and then call:

* ubuntu:
        ```
        docker-compose down
        ```

* windows:
        ```
        docker-compose down
        ```

If you want to make sure no left-over containers are running in the background call:

* ubuntu:
        ```
        docker system prune
        ```

* windows:
        ```
        docker system prune
        ```

## Usage

