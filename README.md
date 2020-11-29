# Open Information Systems Project: group 1: Travelling data and covid-19
Final project for the Open Information System course in the first year of the Computer science master at the VUB.

## Manual

The system uses docker and docker-compose to run a [H2](https://www.h2database.com/html/main.html) database and a SPARQL endpoint on top of the database using the [Ontop Protégé plugin](https://ontop-vkg.org/).
It consists of two docker containers, one containing the H2 database and one containing the Ontop application.

### Installation steps:

- Install docker:

  - ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/
  - windows: https://docs.docker.com/docker-for-windows/install/

- Install docker-compose: https://docs.docker.com/compose/install/

### Running:

First open a terminal and navigate to the root folder.
Then call following command:

* Ubuntu/Windows:
        ```
        docker-compose up --build
        ```
        
The ```
    --build
      ``` parameter is only required when running the system for the first time, at later occasions this parameter can be omitted.
If a permission error occurs try running the command with administrator privileges.

### Shutting down:

To shut the server down press ctrl-c in the terminal running it and then call:

* Ubuntu/Windows:
        ```
        docker-compose down
        ```

If you want to make sure no left-over containers are running in the background call:

* Ubuntu/Windows:
        ```
        docker system prune
        ```

## Usage

