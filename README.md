# DESCRIPTION:

Installs leiningen from the built image on github (http://github.com/technomancy/leiningen/raw/stable/bin/lein)

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
