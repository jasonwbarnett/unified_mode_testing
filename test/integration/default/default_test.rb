# Chef InSpec test for recipe unified_mode_testing::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe file('/tmp/hello_w_unified_mode.txt') do
  its('content') do
    should eq(<<~EOH
      01. first hello Anonymous
      02. middle hello Anonymous
      03. last hello Anonymous
    EOH
             )
  end
end

describe file('/tmp/hello_wo_unified_mode.txt') do
  its('content') do
    should eq(<<~EOH
      01. first hello Anonymous
      02. middle hello Anonymous
      03. last hello Anonymous
    EOH
             )
  end
end
