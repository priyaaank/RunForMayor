require 'spec_helper'

describe AccessConfig do

  it { should respond_to :access_token   }
  it { should respond_to :city           }
  it { should respond_to :webhook_secret }

end


