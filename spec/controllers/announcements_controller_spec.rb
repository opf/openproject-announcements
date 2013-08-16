require 'spec_helper'

describe AnnouncementsController do
  before(:each) do
    @controller.stub!(:check_if_login_required)
    @controller.should_receive(:require_admin)

    @announcement = mock_model Announcement
    Announcement.stub!(:only_one).and_return(@announcement)
    disable_flash_sweep
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
          @announcement.should_receive(:attributes=)
          @announcement.should_receive(:save).and_return(true)
        end

        describe "html" do
          before :each do
            put :update, @params
          end

          it{assigns(:announcement).should eql @announcement}
          it{response.should render_template 'edit'}
          it{flash[:notice].should eql I18n.t(:notice_successful_update)}
        end
      end
    end
  end
end
