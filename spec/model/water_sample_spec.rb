require "spec_helper"

describe WaterSample do
  describe "attribute" do
    before :all do
      @water_sample = WaterSample.new
    end

    it "site exists" do
      @water_sample.should respond_to :site
    end

    it "chloroform exists" do
      @water_sample.should respond_to :chloroform
    end

    it "bromoform exists" do
      @water_sample.should respond_to :bromoform
    end

    it "bromodichloromethane exists" do
      @water_sample.should respond_to :bromodichloromethane
    end

    it "dibromichloromethane exists" do
      @water_sample.should respond_to :dibromichloromethane
    end
  end

  describe "method" do
    before :all do
     (1..4).each do |n|
        create("factor_weight_#{n}")
      end
    end

    context "factor" do
      it "exists" do
        build(:water_sample_1).should respond_to :factor
      end

      (1..4).each do |n|
        context "for water_sample_#{n}" do
          before :all do
            @water_sample = build("water_sample_#{n}")
          end

          (1..4).each do |m|
            it "returns the correct value when #{m} is passed in" do
              result = @water_sample.attributes.except("id", "site").sum { |k,v| v * FactorWeight.find(m)["#{k}_weight"] }
              @water_sample.factor(m).should == result 
            end
          end
        end
      end
    end

    context "to_hash" do
      it "exists" do
        build(:water_sample_1).should respond_to :to_hash
      end

      (1..4).each do |n|
        context "for water_sample_#{n}" do
          before :all do
            @water_sample = build("water_sample_#{n}")
          end

          it "returns the correct hash" do
            result = @water_sample.attributes.symbolize_keys
            @water_sample.to_hash.should == result 
          end

          it "returns the correct hash when including factors" do
            result = @water_sample.attributes
            (1..4).inject(result) { |r, n| r["factor_#{n}"] = @water_sample.factor(n); r; }
            @water_sample.to_hash(true).should == result.symbolize_keys 
          end
        end
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
