require 'rails_helper'

RSpec.describe AsteroidsController, type: :controller do
  describe "#GET show" do
    it "gets the instance" do
      mock_asteroid = Asteroid.new(
        id: 1,
        title: 'Apophis',
        description: 'The end of the world!',
        created_at: DateTime.new,
        updated_at: DateTime.new
      )
      allow(Asteroid).to receive(:find).and_return(mock_asteroid)

      get :show, params: {id: 1}
    end
  end

  describe "#POST create" do
    it "creates the valid instance successfully!" do
      new_asteroid = Asteroid.new(title: 'Apophis', description: 'The end of the world!')
      mock_instance = Asteroid.new(new_asteroid.attributes)

      allow(Asteroid).to receive(:new).and_return(mock_instance)
      allow(mock_instance).to receive(:save).and_return(true)
      post :create, params: new_asteroid.attributes
      expect(response).to be_successful
    end

    it "rejects invalid attributes" do
      new_asteroid = Asteroid.new(title: '', description: nil)
      mock_instance = Asteroid.new(new_asteroid.attributes)

      allow(Asteroid).to receive(:new).and_return(mock_instance)
      allow(mock_instance).to receive(:save).and_return(false)

      post :create, params: new_asteroid.attributes
      expect(response).to have_http_status(422)
    end
  end

  describe "#PATCH update" do
    let!(:mock_db_instance) { Asteroid.new({id: 1, title: 'Apophis', description: 'The end of the world!', created_at: DateTime.now })}

    before :each do
      allow(Asteroid).to receive(:find).and_return(mock_db_instance)
    end

    it  "updates the valid instance successfully" do
      update_asteroid = Asteroid.new(title: 'Apophis', description: '2036')
      patch :update, params: update_asteroid.attributes.merge({id: 1})
      expect(response).to be_successful
    end

    it "rejects invalid instance attributes" do
      allow(mock_db_instance).to receive(:update).and_return(false)
      update_asteroid = Asteroid.new(title: 'Apophis', description: '2036')
      patch :update, params: update_asteroid.attributes.merge({id: 1})
      expect(response).to have_http_status(422)
    end
  end

  describe "#DELETE destroy" do
    let!(:mock_db_instance) { Asteroid.new({id: 1, title: 'Apophis', description: 'The end of the world!', created_at: DateTime.now })}

    it "Delete the instance" do
      allow(Asteroid).to receive(:find).and_return(mock_db_instance)
      delete :destroy, params: { id: mock_db_instance.id }
    end
  end
end