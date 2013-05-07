require "spec_helper"

describe WaterSample do
  describe "attributes" do
    before :all do
      @water_sample = WaterSample.new
    end

    it "has a site" do
      @water_sample.should respond_to :site
    end

    it "has chloroform" do
      @water_sample.should respond_to :chloroform
    end

    it "has bromoform" do
      @water_sample.should respond_to :bromoform
    end

    it "has bromodichloromethane" do
      @water_sample.should respond_to :bromodichloromethane
    end

    it "has dibromichloromethane" do
      @water_sample.should respond_to :dibromichloromethane
    end
  end

  describe "methods" do
    before :all do
      create(:factor_weight_1)
      @water_sample_1 = build(:water_sample_1)
    end

    context "factor" do
      it "exists" do
        @water_sample_1.should respond_to :factor
      end

      it "returns the value 0.004992 when 1 is passed in" do
        @water_sample_1.factor(1).should == 0.004992
      end
    end
  end

  describe "create" do
    before :each do
      @water_sample = build(:water_sample_1)
    end

    it "requires a site" do
      @water_sample.site = nil
      @water_sample.valid?.should == false
    end
  end
end
