# DESCRIPTION:

Installs leiningen from the built image on github: https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

Forked from the outdated repo https://github.com/runa-labs/chef-leiningen (see https://github.com/runa-labs/chef-leiningen/pull/3)

# REQUIREMENTS:

none

# ATTRIBUTES:

none

# USAGE:

```
   leiningen_project "Deploy Something" do
      action            [:build]
      s3_wagon_private  true
      s3_username       aws['access_key']
      s3_passphrase     aws['secret_key']
      uberjar_name      jar_name
      source_dir        source_dir
      deploy_user       user
    end
```
