require File.expand_path('../../spec_helper', __FILE__)
require 'calculator'

describe 'TS04 - Divide 2 numbers' do
  #---Set variable all TS
  res = nil

  context 'TC04.001 - Divide 2 integer numbers (4/2)' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.divide(4, 2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//DivideResult').text)
    end

    it 'Verify DivideResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify DivideResultResponse returns result correctly' do
      expect(result).to eq(2)
    end
  end

  context 'TC04.002 - Divide 2 integer numbers (5/2)' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.divide(5, 2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//DivideResult').text)
    end

    it 'Verify DivideResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify DivideResultResponse returns result correctly' do
      expect(result).to eq(2.5)
    end
  end

  context 'TC04.003 - Divide 2 integer numbers (0/2)' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.divide(5, 2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//DivideResult').text)
    end

    it 'Verify DivideResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify DivideResultResponse returns result correctly' do
      expect(result).to eq(0)
    end
  end

  context 'TC04.004 - Divide 0 (5/0)' do
    before :all do
      res = Calculator.subtract(5, 0)
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC04.005 - Divide 2 negative numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.divide(4, -2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//DivideResult').text)
    end

    it 'Verify DivideResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify DivideResultResponse returns result correctly' do
      expect(result).to eq(-2)
    end
  end

  context 'TC04.006 - Divide 1 positive number and 1 negative number' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.divide(-3, 3)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//DivideResult').text)
    end

    it 'Verify DivideResult service calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify DivideResultResponse returns result correctly' do
      expect(result).to eq(-1)
    end
  end

  context 'TC04.007 - Divide with float number' do
    before :all do
      res = Calculator.subtract(5, 2.5)
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC04.008 - Divide with characters input value' do
    before :all do
      res = Calculator.subtract(5, 'abc')
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC04.009 - Divide with over load input range' do
    before :all do
      res = Calculator.subtract(99999999999, 3)
    end

    it "Verify 'Input value is over load' error responses" do
      expect(res).to eq('Input value is over load')
    end
  end
end