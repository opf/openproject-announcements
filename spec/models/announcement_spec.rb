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

    describe :active_and_current do
      before :each do

      end

      describe "WHEN the announcement is not active" do
        before :each do
          Factory.create(:inactive_announcement)
        end

        it{ Announcement.active_and_current.should be_nil }
      end

      describe "WHEN the announcement is active and today is before show_until" do
        before :each do
          @announcement = Factory.create(:active_announcement,
                                         :show_until => Date.today + 14.days)
        end

        it{ Announcement.active_and_current.should eql @announcement }
      end

      describe "WHEN the announcement is active and today is after show_until" do
        before :each do
          Factory.create(:active_announcement,
                         :show_until => Date.today - 14.days)
        end

        it{ Announcement.active_and_current.should be_nil }
      end

      describe "WHEN the announcement is active and today equals show_until" do
        before :each do
          @announcement = Factory.create(:active_announcement,
                                         :show_until => Date.today)
        end

        it{ Announcement.active_and_current.should eql @announcement }
      end
    end
  end
end