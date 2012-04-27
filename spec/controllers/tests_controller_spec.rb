require 'spec_helper'

describe TestsController do
  render_views

  it 'adds ths file path to the partial' do
    pending
    get :index
    response.body.should =~ /_partial.html.erb/
  end
end
