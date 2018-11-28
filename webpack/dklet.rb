#!/usr/bin/env rundklet
add_note <<~Note
Note

write_dockerfile <<~Desc
  FROM alpine:3.7
  LABEL <%=image_labels%>
Desc

task :main do
  system_run <<~Desc
    #{dkrun_cmd(named: true)} -d #{docker_image} sleep 1d
  Desc
end

custom_commands do
  desc 'try', 'try'
  def try
    system_run <<~Desc
      #{dktmprun} echo hi container #{container_name}
    Desc
  end
end

__END__
