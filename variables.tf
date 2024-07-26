variable "buckets-to-scan" {
  description = "List of bucket names to be scanned by the antivirus"
  type        = list(string)
}

variable "scanner-environment-variables" {
  description = "Custom environment variables for the scanner function"
  type        = map(string)
  default     = {}
}

variable "updater-environment-variables" {
  description = "Custom environment variables for the definitions update function"
  type        = map(string)
  default     = {}
}

variable "antivirus-lambda-code" {
  description = "Optional argument to provide precompiled zip file containing the lambda code, skipping the built in compilation process"
  type        = string
  default     = null
}

variable "allow-public-access" {
  description = "If true, contents of the bucket in which the antivirus definitions are saved will be public. Good for sharing the same definitions across multiple accounts."
  type        = bool
  default     = false
}

variable "antivirus-update-rate" {
  description = "Configures the antivirus update rate. Syntax is the same of cloudwatch rate schedule expression for rules"
  type        = string
  default     = "3 hours"
}

variable "git-revision" {
  description = "Git revision of the lambda code to build"
  type        = string
  default     = "8d9439c"
}

variable "scanner-sns-topics" {
  description = "List of SNS topics the scanner can publish to"
  type        = list(string)
  default     = []
}

variable "env" {
  description = "Instance tag to identify the instance env (i.e. 'core', 'prod')."
  type        = string
  default     = "develop"
}

variable "ephemeral_storage" {
  description = "The amount of ephemeral storage under /tmp in MB"
  type        = number
  default     = 512
}

variable "lambda_runtime" {
  description = "The lambda runtime to deploy with"
  type        = string
  default     = "python3.12"
}
