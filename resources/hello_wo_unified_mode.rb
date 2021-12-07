puts "\n\nbegin parsing hello_wo_unified_mode\n\n"

provides :hello_wo_unified_mode

property :person, String, name_property: true, identity: true
property :file, String, default: '/tmp/hello_wo_unified_mode.txt'

action :speak do
  file new_resource.file do
    owner 'root'
    group 'root'
    mode '0755'
    compile_time true
  end

  File.open(new_resource.file, 'a') { |f| f.puts "\n\n01. first hello #{new_resource.person}\n\n" }

  ruby_block "sdf" do
    block do
      File.open(new_resource.file, 'a') { |f| f.puts "\n\n02. middle hello #{new_resource.person}\n\n" }
    end
  end

  File.open(new_resource.file, 'a') { |f| f.puts "\n\n03. last hello #{new_resource.person}\n\n" }
end

puts "\n\nend parsing hello_wo_unified_mode\n\n"
