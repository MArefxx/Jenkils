resource "aws_instance" "this" {
  ami                     = "ami-080e1f13689e07408"
  instance_type           = "t2.micro"

  tags = {
    Name = "My_EC2"
  }
}
output "public_ip" {
  value = aws_instance.this.public_ip
}
resource "local_file" "ip_file" {
  content  = aws_instance.this.public_ip
  filename = "../ansible/inventory"
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6mFo0pid9qphuvIHqHh2EDia0+4yIrq8QvmX4xPLRJYQ3Lm0efG0qzdO0z18Y6eEKafmZmKlnmv7IofIYVFObpMx07f1R31TgET2NZhGsC9qD5P+YI3E1Tu/c6MMYf3u7zEt/clSpu7Lm+wca3WdBsctzDfhLUnsl+PnpWrOEU2QnghrnpMJqMKcBWNZbBQ6XZ0U6lrncggHPA/PA4iv1aGihzlU3gvvGsZ8wvQYe60UR6CTU1Y7AaP+PaOLlI/8kY0NW5PDqE+Cv5oOfWO+R4pyr66C6m9XI2fVCr/A/f7gvxrJqPt3LNNcFf2sGoDPp/MQ1gn99MBNJrzNEInVZNiDDWUw/TMJVFGxX2iMCIRd2HTbP4rBn/njemxOiuzQrF13299fxQpYbrlbJAJ6UUpO4sszVqZWhYASOGMQ0wjdV62mzlZ6XS1D1CKFx9xXK3vS5kPocJiHqZw1tvuwXP1ev+sEnrIePDtZenIRszHQxYb4vajddUaDRcZnHImU= mohamed@mx"
  
}