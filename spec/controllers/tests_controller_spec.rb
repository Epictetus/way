require 'spec_helper'

describe TestsController do
  it 'finds the action' do
    get :index
    response.should be_success
  end
end