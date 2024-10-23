require 'spec_helper'

describe command('sudo su - yuma -c "ruby -v"') do
  its(:stdout) { should match /^ruby 3\.3\./ }
end

describe 'Check if gems are installed' do
  gem_names = %w[rubocop minitest]

  gem_names.each do |gem_name|
    it "#{gem_name} should be installed" do
      expect(`sudo su - yuma -c "gem list --local"`).to include(gem_name)
    end
  end
end

describe cron do
  it { should have_entry('30 * * * * gem update --system && gem update').with_user('yuma') }
end
