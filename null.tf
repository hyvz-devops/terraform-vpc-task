resource "null_resource"  "commands1" {
    depends_on = ["aws_instance.vpc_task_db"]
    triggers = {
        always_run = "${timestamp()}"
    }

    provisioner "remote-exec" {
        connection {
        host = "${aws_instance.vpc_task_db.public_ip}"
        type = "ssh"
        user = "ec2-user"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
        "sudo yum install mariadb-server mariadb -y", 
        "sudo systemctl start mariadb", 
        "sudo systemctl enable  mariadb", 
    }
