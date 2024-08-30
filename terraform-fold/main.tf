provider "docker" {}
resource "local_file" "create-file"{
  filename= "/home/sahil/Downloads/terraform-fold/demo.txt"
  content= "Hi terraform created file"
}

resource "docker_image" "nginx-img"{
  name= "nginx:latest"
  keep_locally= false

}

resource "docker_container" "nginx-ctr"{

 name= "my-nginx-container"
 image= docker_image.nginx-img.name
   ports {
     internal = 80
     external = 80
}

}  

