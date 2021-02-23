require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @event = Event.create(description: "MeetnGreet")
  end

  test "should get events index" do
    get events_path
    assert_response :success
  end
end
