# CHON Website Template

CHON is a website template inspired by the elements (C-H-O-N), which are the building blocks of life. This template is built on Laravel 8 and the Voyager admin package and offers a starter kit based on Laravel components.

## Setup

Before run bash scripts, do not forget to give them permissions:

```
sudo chmod u+x *.sh
```

Run the `install.sh` script to start the project. This script installs the necessary dependencies and performs the necessary operations to start the project.

```bash
./install.sh
```

## Shortcuts

The gen.sh script included in the project can be used to manage Laravel components. With this script, you can perform artisan creation operations such as models, controllers and components.

```bash
Usage: ./gen.sh [-option NAME]
    -cnt Creates a controller with the specified name with "Controller" suffix.
    -cmp Creates a component with the specified name.
    -m Creates a model with the specified name.
    -mc Creates a model and controller with the specified name
```

Example usage:

```bash
./gen.sh -m User
```

This command creates a model named User.

## Contribute

We welcome your contributions! For any feedback, suggestions or contributions, contribute to the GitHub repository.
