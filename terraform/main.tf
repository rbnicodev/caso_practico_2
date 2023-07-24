terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.10.0"
    }
    /* docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    } */ //No he podido añadir las imágenes al ACR, por lo que dejo el código comentado.
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

/* provider "docker" {
  host = "unix:///var/run/docker.sock"
} */
