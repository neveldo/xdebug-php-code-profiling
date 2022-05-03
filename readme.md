# Code profiling of a PHP application with Xdebug (demo project)

This demo repository aims to set up a PHP 8.1 environment with Xdebug ready to perform code profiling on a blank Symfony 6 app. Feel free to take a lot to the related blog post : [How to profile your PHP applications with Xdebug](https://www.vincentbroute.fr/blog/ending-an-open-source-project-mapael/). When running, the app is available at http://localhost:8080. The `master` branch contains only the basic configuration without Xdebug. The `xdebug` branch adds all the configuration needed to run Xdebug profiling.

To run the project with the following `make` commands :

- Build Docker services
```
make build
```

- Run the containers
```
make run
```

- Install Symfony application
```
make init
```

- Stop Docker  containers
```
make stop
```

- Run bash into the php-fpm container
```
make bash
```

# Requirements

- Docker
- Docker-compose

# Author

[Vincent Brouté](https://www.vincentbroute.fr/)