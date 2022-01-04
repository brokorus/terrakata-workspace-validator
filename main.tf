data "assert_test" "workspace_name_is_folder" {
  test = basename(abspath(path.cwd )) == terraform.workspace 
  throw = "Workspace does not match the directory your are attempting to run terraform from"
}

data "assert_test" "workspace_name_in_git_branch_name" {
  test = length(regexall("${path.root}", terraform.workspace)) > 0
  throw = "Git branch and workspace must follow convention and match"
}

output "wscheck" {
  value = "pass"
}
