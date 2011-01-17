require File.dirname(__FILE__) + '/../spec_helper'

describe AnnouncementsController do
  describe :get do
    before :each do
      @announcement = mock_model Announcement
    end

    describe :edit do
      before :each do
        @params = {"id" => "1"}
      end

      describe "WITH an announcement existing" do
        before :each do
          Announcement.stub!(:find).with("1").and_return(@announcement)
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

      describe "WITHOUT an announcement existing" do
        before :each do
          Announcement.should_receive(:create).and_return(@announcement)
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
  end

  describe :put do
    before :each do
      @params = {"announcement" => {"until_date" => "2011-01-11", "text" => "announcement!!!"}}
    end


  end
end