require File.expand_path('../../spec_helper', __FILE__)
require 'calculator'

describe 'TS03 - Multiply 2 numbers' do
  #---Set variable all TS
  res = nil

  context 'TC03.001 - Multiply 2 integer numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.multiply(4, 3)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//MultiplyResult').text)
    end

    it 'Verify MultiplyResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify MultiplyResultResponse returns result correctly' do
      expect(result).to eq(12)
    end
  end

  context 'TC03.002 - Multiply 2 negative numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.multiply(-2, -2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//MultiplyResult').text)
    end

    it 'Verify MultiplyResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify MultiplyResultResponse returns result correctly' do
      expect(result).to eq(-4)
    end
  end

  context 'TC03.003 - Multiply 1 positive number and 1 negative number' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.multiply(-3, 3)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//MultiplyResult').text)
    end

    it 'Verify MultiplyResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify MultiplyResultResponse returns result correctly' do
      expect(result).to eq(-9)
    end
  end

  context 'TC03.004 - Multiply with float number' do
    before :all do
      res = Calculator.subtract(5, 1.5)
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC03.005 - Multiply with characters input value' do
    before :all do
      res = Calculator.subtract(5, 'abc')
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC03.006 - Multiply with over load input range' do
    before :all do
      res = Calculator.subtract(99999999999, 3)
    end

    it "Verify 'Input value is over load' error responses" do
      expect(res).to eq('Input value is over load')
    end
  end
end