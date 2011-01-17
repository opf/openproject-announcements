require File.dirname(__FILE__) + '/../spec_helper'

describe AnnouncementsController do
  before(:each) do
    @announcement = mock_model Announcement
    Announcement.stub!(:only_one).and_return(@announcement)
  end

  describe :get do
    before :each do

    end

    describe :edit do
      before :each do
        @params = {}
      end

      describe "SUCCESS" do
        describe "html" do
          before :each do
            get :edit, @params
          end

          it{assigns(:announcement).should eql @announcement}
          it{response.should be_success}
        end
      end
    end
  end

  describe :put do
    before :each do
    end

    describe :update do
      before :each do
        @params = {"announcement" => {"until_date" => "2011-01-11",
                                      "text" => "announcement!!!",
                                      "active" => "1"}}
      end

      describe "SUCCESS" do
        before :each do
          @announcement.should_receive(:update_attributes).and_return(true)
        end

        describe "html" do
          before :each do
            put :update, @params
          end

          it{assigns(:announcement).should eql @announcement}
          it{response.should render_template 'edit'}
        end
      end
    end
  end
end