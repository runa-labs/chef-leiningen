action :build do
  if new_resource.s3_wagon_private
    template_variables = {
      :aws_access_key => new_resource.s3_username,
      :aws_secret_access_key => new_resource.s3_passphrase
    }
    
    template "/home/#{new_resource.deploy_user}/.lein/init.clj" do
      owner  new_resource.deploy_user
      group  new_resource.deploy_user
      source "lein_init.clj.erb"
      mode   "0644"
      variables(template_variables)
    end
  end

  if new_resource.pre_build_cmd
    execute "Running pre-build script" do
      user    new_resource.deploy_user
      group   new_resource.deploy_user
      cwd     new_resource.source_dir
      environment({"HOME" => "/home/runa-deploy"})
      command new_resource.pre_build_cmd
    end
  end
  
  execute "setting up lein project" do
    user    new_resource.deploy_user
    group   new_resource.deploy_user
    cwd     new_resource.source_dir
    environment({"HOME" => "/home/#{new_resource.deploy_user}",
                  "ARCHIVA_USERNAME" => new_resource.s3_username,
                  "ARCHIVA_PASSPHRASE" => new_resource.s3_passphrase})
    command "lein clean; lein uberjar"
  end
  
end

# TODO: provide fine-grained control by implementing these

action :compile do 
end

action :jar do
end

action :uberjar do
end

action :s3_deploy do
  # deploys jar to s3
end
