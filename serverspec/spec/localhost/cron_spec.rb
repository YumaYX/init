require 'spec_helper'

describe cron do
  it { should have_entry('0 4 * * * dnf -y update') }
end
