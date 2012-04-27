require File.expand_path('../../../spec_helper', __FILE__)

describe TestsController do
  render_views

  before { get :index }

  it 'adds ths file path to the partial' do
    response.body.should include "app/views/tests/_partial.html.erb"
  end

  it 'does not show the path for the view' do
    response.body.should_not include "index.html.erb"
  end
end
