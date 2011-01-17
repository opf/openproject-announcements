require File.dirname(__FILE__) + '/../spec_helper'

describe Announcement do
  it {should respond_to :text}
  it {should respond_to :text=}
  it {should respond_to :show_until}
  it {should respond_to :show_until=}
  it {should respond_to :active?}
  it {should respond_to :active=}
end