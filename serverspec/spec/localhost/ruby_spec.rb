require 'spec_helper'

describe command('sudo su - user -c "ruby -v"') do
  its(:stdout) { should match /^ruby 4\.0\./ }
end

describe 'Check if gems are installed' do
  gem_names = %w[rubocop minitest]

  gem_names.each do |gem_name|
    it "#{gem_name} should be installed" do
      expect(`sudo su - user -c "gem list --local"`).to include(gem_name)
    end
  end
end

describe cron do
  it { should have_entry('0 18 * * 5 /usr/local/bin/update-rubygems').with_user('user') }
end
