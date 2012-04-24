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
      describe "WHEN no announcement is active" do
        before :each do
          Factory.create(:inactive_announcement)
        end

        it{ Announcement.active_and_current.should be_nil }
      end

      describe "WHEN the one announcement is active and today is before show_until" do
        before :each do
          @announcement = Factory.create(:active_announcement,
                                         :show_until => Date.today + 14.days)
        end

        it{ Announcement.active_and_current.should eql @announcement }
      end

      describe "WHEN the one announcement is active and today is after show_until" do
        before :each do
          Factory.create(:active_announcement,
                         :show_until => Date.today - 14.days)
        end

        it{ Announcement.active_and_current.should be_nil }
      end

      describe "WHEN the one announcement is active and today equals show_until" do
        before :each do
          @announcement = Factory.create(:active_announcement,
                                         :show_until => Date.today)
        end

        it{ Announcement.active_and_current.should eql @announcement }
      end
    end

    describe "instance methods" do
      describe "mass assignment protected" do
        let(:id) { 100 }
        let(:active) { true }
        let(:show_until) { "2011-01-03".to_date }
        let(:text) { "lorem ipsum" }
        let(:created_at) { "2011-01-01".to_date }
        let(:updated_at) { "2012-01-02".to_date }

        before do
          @announcement = Announcement.new
          @announcement.safe_attributes = {
            :id => id,
            :active => active,
            :show_until => show_until,
            :text => text,
            :created_at => created_at,
            :updated_at => updated_at
          }
        end

        it { @announcement.active.should == active }
        it { @announcement.show_until.should == show_until }
        it { @announcement.text.should == text }
        it { @announcement.id.should_not == id }
        it { @announcement.created_at.should_not == created_at }
        it { @announcement.updated_at.should_not == updated_at }
      end

      describe :active_and_current? do
        describe "WHEN the announcement is not active" do
          before :each do
            @announcement = Factory.build(:inactive_announcement)
          end

          it{ @announcement.active_and_current?.should be_false }
        end

        describe "WHEN the announcement is active and today is before show_until" do
          before :each do
            @announcement = Factory.build(:active_announcement,
                                           :show_until => Date.today + 14.days)
          end

          it{ @announcement.active_and_current?.should be_true }
        end

        describe "WHEN the announcement is active and today is after show_until" do
          before :each do
            @announcement = Factory.build(:active_announcement,
                           :show_until => Date.today - 14.days)
          end

          it{ @announcement.active_and_current?.should be_false }
        end

        describe "WHEN the announcement is active and today equals show_until" do
          before :each do
            @announcement = Factory.build(:active_announcement,
                                           :show_until => Date.today)
          end

          it{ @announcement.active_and_current?.should be_true }
        end
      end


    end
  end
end
