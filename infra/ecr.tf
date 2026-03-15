resource "aws_ecr_repository" "app" {
  name                 = "cicd-pipeline"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  tags = { Name = "cicd-pipeline" }
}