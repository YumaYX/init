require 'spec_helper'

describe command('ruby -v') do
  its(:stdout) { should match /^ruby 3\.3\./ }
end

