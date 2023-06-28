resource "aws_instance" "web" {
    ami = "ami-0f5ee92e2d63afc18"
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "my_key"
    vpc_security_group_ids = [ aws_security_group.web_sg.id]
    subnet_id = module.vpc.public_subnets[0]
    tags = {
      "Name" = "web"
    }

    depends_on = [
      module.vpc,
      aws_security_group.web_sg
    ]

}