require 'spec_helper'

describe Announcement do
  it {is_expected.to respond_to :text}
  it {is_expected.to respond_to :text=}
  it {is_expected.to respond_to :show_until}
  it {is_expected.to respond_to :show_until=}
  it {is_expected.to respond_to :active?}
  it {is_expected.to respond_to :active=}

  describe "class methods" do
    before :each do

    end

    describe :only_one do
      before :each do

      end

      context "WHEN no announcement exists" do
        before :each do

        end

        it {expect(Announcement.only_one.text).to eql "Announcement"}
        it {expect(Announcement.only_one.show_until).to eql(Date.today + 14.days)}
        it {expect(Announcement.only_one.active).to eql false}

      end

      context "WHEN an announcement exists" do
        before :each do
          @announcement = FactoryGirl.create(:announcement)
        end

        it{expect(Announcement.only_one).to eql @announcement}
      end
    end

    describe :active_and_current do
      describe "WHEN no announcement is active" do
        before :each do
          FactoryGirl.create(:inactive_announcement)
        end

        it{ expect(Announcement.active_and_current).to be_nil }
      end

      describe "WHEN the one announcement is active and today is before show_until" do
        before :each do
          @announcement = FactoryGirl.create(:active_announcement,
                                         :show_until => Date.today + 14.days)
        end

        it{ expect(Announcement.active_and_current).to eql @announcement }
      end

      describe "WHEN the one announcement is active and today is after show_until" do
        before :each do
          FactoryGirl.create(:active_announcement,
                         :show_until => Date.today - 14.days)
        end

        it{ expect(Announcement.active_and_current).to be_nil }
      end

      describe "WHEN the one announcement is active and today equals show_until" do
        before :each do
          @announcement = FactoryGirl.create(:active_announcement,
                                         :show_until => Date.today)
        end

        it{ expect(Announcement.active_and_current).to eql @announcement }
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

        it { expect(@announcement.active).to eq(active) }
        it { expect(@announcement.show_until).to eq(show_until) }
        it { expect(@announcement.text).to eq(text) }
        it { expect(@announcement.id).not_to eq(id) }
        it { expect(@announcement.created_at).not_to eq(created_at) }
        it { expect(@announcement.updated_at).not_to eq(updated_at) }
      end

      describe :active_and_current? do
        describe "WHEN the announcement is not active" do
          before :each do
            @announcement = FactoryGirl.build(:inactive_announcement)
          end

          it{ expect(@announcement.active_and_current?).to be_falsey }
        end

        describe "WHEN the announcement is active and today is before show_until" do
          before :each do
            @announcement = FactoryGirl.build(:active_announcement,
                                           :show_until => Date.today + 14.days)
          end

          it{ expect(@announcement.active_and_current?).to be_truthy }
        end

        describe "WHEN the announcement is active and today is after show_until" do
          before :each do
            @announcement = FactoryGirl.build(:active_announcement,
                           :show_until => Date.today - 14.days)
          end

          it{ expect(@announcement.active_and_current?).to be_falsey }
        end

        describe "WHEN the announcement is active and today equals show_until" do
          before :each do
            @announcement = FactoryGirl.build(:active_announcement,
                                           :show_until => Date.today)
          end

          it{ expect(@announcement.active_and_current?).to be_truthy }
        end
      end


    end
  end
end
