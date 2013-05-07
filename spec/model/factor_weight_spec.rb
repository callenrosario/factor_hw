require "spec_helper"

describe FactorWeight do
  describe "attributes" do
    before :each do
      @factor_weight = FactorWeight.new
    end

    it "has chloroform_weight" do
      @factor_weight.should respond_to :chloroform_weight
    end

    it "has bromoform_weight" do
      @factor_weight.should respond_to :bromoform_weight
    end

    it "has bromodichloromethane_weight" do
      @factor_weight.should respond_to :bromodichloromethane_weight
    end

    it "has dibromichloromethane_weight" do
      @factor_weight.should respond_to :dibromichloromethane_weight
    end
  end

  describe "methods" do
    before :each do
      @factor_weight = build(:factor_weight_1)
    end
  end

  describe "create" do
    before :each do
      @factor_weight = build(:factor_weight_1)
    end

    it "requires a chloroform_weight" do
      @factor_weight.chloroform_weight = nil
      @factor_weight.valid?.should == false
    end

    it "requires a bromoform_weight" do
      @factor_weight.bromoform_weight = nil
      @factor_weight.valid?.should == false
    end

    it "requires a bromodichloromethane_weight" do
      @factor_weight.bromodichloromethane_weight = nil
      @factor_weight.valid?.should == false
    end

    it "requires a dibromichloromethane_weight" do
      @factor_weight.dibromichloromethane_weight = nil
      @factor_weight.valid?.should == false
    end
  end
end
