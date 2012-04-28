require File.expand_path('../../../spec_helper', __FILE__)

describe TestsController do
  render_views

  before { get :index }

  it 'adds ths file path to the partial' do
    response.body.should include "app/views/tests/_partial.erb"
  end

  it 'does not show the path for the view' do
    response.body.should_not include "index.erb"
  end

  it 'renders the view correctly' do
    response.body.should include "I'm a view!"
  end

  it 'renders the partial correctly' do
    response.body.should include "I'm a partial"
  end
end
