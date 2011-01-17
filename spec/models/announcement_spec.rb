require File.dirname(__FILE__) + '/../spec_helper'

describe Announcement do
  it {should respond_to :text}
  it {should respond_to :text=}
  it {should respond_to :show_until}
  it {should respond_to :show_until=}
  it {should respond_to :active?}
  it {should respond_to :active=}

  describe "class methods" do
    before :each do

    end

    describe :only_one do
      before :each do

      end

      context "WHEN no announcement exists" do
        before :each do

        end

        it {Announcement.only_one.text.should eql "Announcement"}
        it {Announcement.only_one.show_until.should eql(Date.today + 14.days)}
        it {Announcement.only_one.active.should eql false}

      end

      context "WHEN an announcement exists" do
        before :each do
          @announcement = Factory.create(:announcement)
        end

        it{Announcement.only_one.should eql @announcement}
      end
    end
  end
end