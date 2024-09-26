usethis::use_git_config(user.name = 'inibb', user.email='i.banalesbelaunde@uu.nl')
usethis::create_github_token() 
credentials::set_github_pat("YourPAT")

usethis::git_sitrep()
