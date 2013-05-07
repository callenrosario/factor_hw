FactoryGirl.define do
  factory :factor_weight do
    factory :factor_weight_1 do
      id 1
      chloroform_weight 0.8
      bromoform_weight 1.2
      bromodichloromethane_weight 1.5
      dibromichloromethane_weight 0.7
    end

    factory :factor_weight_2 do
      id 2
      chloroform_weight 1
      bromoform_weight 1
      bromodichloromethane_weight 1
      dibromichloromethane_weight 1
    end

    factory :factor_weight_3 do
      id 3
      chloroform_weight 0.9
      bromoform_weight 1.1
      bromodichloromethane_weight 1.3
      dibromichloromethane_weight 0.6
    end

    factory :factor_weight_4 do
      id 4
      chloroform_weight 0
      bromoform_weight 1
      bromodichloromethane_weight 1
      dibromichloromethane_weight 1.7
    end
  end
end
