require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(description: 'Microverse Students Meet')
  end

  test 'event should be valid' do
    assert true
  end

  test 'description should be present' do
    @event.description = ' '
    assert_not @event.valid?
  end
  test 'title should be present' do
    @event.location = ' '
    assert_not @event.valid?
  end
  test 'creator should be present' do
    @event.creator_id = ' '
    assert_not @event.valid?
  end
end
