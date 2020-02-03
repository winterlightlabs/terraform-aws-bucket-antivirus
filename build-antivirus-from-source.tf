resource "null_resource" "build-antivirus-from-source" {
  count = (
    var.antivirus-lambda-code == null
    ? 1
    : 0
  )

  triggers = {
    git_revision = "${var.git-revision}"
  }

  provisioner "local-exec" {
    command = "REVISION=${var.git-revision} bash ${path.module}/scripts/build-antivirus-from-source.sh"
  }
}

resource "aws_s3_bucket_object" "antivirus-code" {
  depends_on = [null_resource.build-antivirus-from-source]

  bucket = aws_s3_bucket.antivirus-code.bucket
  key    = "lambda-${var.git-revision}.zip"

  source = (
    var.antivirus-lambda-code == null
    ? "~/bucket-antivirus-function/build/lambda.zip"
    : pathexpand(var.antivirus-lambda-code)
  )
}
