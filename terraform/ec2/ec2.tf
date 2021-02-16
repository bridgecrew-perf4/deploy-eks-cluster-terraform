resource "aws_instance" "ec2-api" {
    ami = "ami-0fc970315c2d38f01"
    instance_type = "t2.micro"    
    subnet_id = aws_subnet.challenge-subnet-public.id    
    vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
    key_name = "challenger-ssh"
    associate_public_ip_address = true
  
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("/.ssh/unique_identifier.pem")}"
      host        = "${self.public_ip}"
    }   
    provisioner "file" {
      source      = "nodejs-server/nodejs-server-server"
      destination = "/tmp/nodejs-server-server"
    }

     provisioner "remote-exec" {
        inline = [
      "sudo amazon-linux-extras install epel -y",
      "sudo yum-config-manager --enable epel",
      "sudo yum -y install nodejs",
      "cd /tmp/nodejs-server-server",
      "sudo npm install -g",
      "sudo npm install -g forever",
      "forever start index.js"
      ]
    }
      tags = {
		  Name = "ec2-api"
	  }

}

