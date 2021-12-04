puts "\n\nbegin parsing hello_wo_unified_mode\n\n"

provides :hello_wo_unified_mode

action :speak do
  puts "\n\n01. first hello #{new_resource.name}\n\n"

  ruby_block "sdf" do
    block do
      puts "\n\n02. middle hello #{new_resource.name}\n\n"
    end
  end

  puts "\n\n03. last hello #{new_resource.name}\n\n"
end

puts "\n\nend parsing hello_wo_unified_mode\n\n"
