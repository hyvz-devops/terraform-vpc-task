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
       
        # "sudo yum install httpd -y",
        # "sudo systemctl start httpd && sudo systemctl enable httpd",
        # "sudo yum install mariadb mariadb-server -y",
        # "sudo systemctl start mariadb && sudo systemctl enable mariadb",
        # "sudo yum update -y",
        # "sudo yum install epel-release -y",
        # "sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y",
        # "sudo yum-config-manager --enable remi-php70",
        # "sudo yum install php php-gd php-mysql -y",
        # "sudo yum install wget -y",
        # "sudo wget https://wordpress.org/latest.tar.gz",
        # "sudo tar -xf latest.tar.gz",
        # "sudo cp -a wordpress/* /var/www/html",
        # "sudo cp -a /var/www/html/wp-config-sample.php /var/www/html/wp-config.php",
        # "sudo chown -R apache:apache /var/www/html",
        # "sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config",
        # "sudo setenforce 0"
       

        ]
    }
}
