#
# Cookbook:: unified_mode_testing
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright:: 2021, Jason Barnett
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'spec_helper'

shared_examples 'common behavior' do
  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'speaks in unified mode as expected' do
    expect(chef_run).to speak_hello_w_unified_mode('First Pass').with(
                          person: 'SYSTEM'
                        )
  end

  it 'speaks in legacy mode as expected' do
    expect(chef_run).to speak_hello_wo_unified_mode('Second Pass').with(
                          person: 'SYSTEM'
                        )
  end
end

describe 'unified_mode_testing::override' do
  context 'When all person attribute is overridden, on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/main/PLATFORMS.md
    platform 'ubuntu', '20.04'

    it_behaves_like('common behavior')
  end

  context 'When person attribute is overridden, on CentOS 8' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/main/PLATFORMS.md
    platform 'centos', '8'

    it_behaves_like('common behavior')
  end
end
