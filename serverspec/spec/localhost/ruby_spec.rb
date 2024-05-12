require 'spec_helper'

describe command('ruby -v') do
  its(:stdout) { should match /^ruby 3\.3\./ }
end

describe 'Check if gems are installed' do
  gem_names = %w[rubocop minitest]

  gem_names.each do |gem_name|
    it "#{gem_name} should be installed" do
      expect(`gem list --local`).to include(gem_name)
    end
  end
end
