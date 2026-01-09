require 'spec_helper'

%w[
  bundler
  minitest
  rubocop
  rake
  ys1
].each do |gem_name|
  describe command(%Q{
    su - user -c '
      export RBENV_ROOT="$HOME/.rbenv"
      export PATH="$RBENV_ROOT/bin:$PATH"
      eval "$(rbenv init -)"
      gem list -i #{gem_name}
    '
  }) do
    its(:stdout) { should match /true/ }
    its(:exit_status) { should eq 0 }
  end
end

