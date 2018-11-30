#!/usr/bin/env rundklet
add_note <<~Note
  A lightweight private npm proxy registry 
  https://www.verdaccio.org/
  https://verdaccio.org/docs/en/docker.html
  https://github.com/verdaccio/verdaccio
Note

register_net
register :appname, 'npm-registry'

# 4.x-next, master
register_docker_image "verdaccio/verdaccio:3.8.6"

task :main do
  system_run <<~Desc
    #{dkrun_cmd(named: true)} #{'-d --restart always' if in_prod? } \
      -d \
      -p 4873 \
      -e #{proxy_domain_env_for} \
      -v #{script_path}/conf:/verdaccio/conf \
      -v #{app_volumes}/storage:/verdaccio/storage \
      -v #{app_volumes}/plugins:/verdaccio/plugins \
      #{docker_image}
  Desc
end

custom_commands do
  desc 'test', 'test local registry'
  def test
    system_run <<~Desc
      npm install lodash --registry #{registry_domain}
      #then try after stop networking
    Desc
  end

  desc 'stat', 'stat storage'
  def stat
    system_run <<~Desc
      echo registry domain: #{registry_domain}
      du -sh #{app_volumes}/storage
      ls -lh #{app_volumes}/storage | tail
    Desc
  end

  no_commands do
    def registry_domain
      proxy_domains
    end
  end
end

__END__

## run locally
npm install --global verdaccio && verdaccio
open http://localhost:4873
