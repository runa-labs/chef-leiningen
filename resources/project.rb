actions :compile, :jar, :uberjar, :deploy, :setup, :build

attribute :s3_wagon_private
attribute :s3_username      ,:kind_of => String
attribute :s3_passphrase    ,:kind_of => String
attribute :uberjar_name     ,:kind_of => String
attribute :source_dir       ,:kind_of => String
attribute :deploy_user      ,:kind_of => String
attribute :pre_build_cmd    ,:kind_of => String
