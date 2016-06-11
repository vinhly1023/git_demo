require File.expand_path('../../spec_helper', __FILE__)
require 'calculator'

describe 'TS02 - Subtract 2 numbers' do
  #---Set variable all TS
  res = nil

  context 'TC02.001 - Subtract 2 integer numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.subtract(4, 3)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//SubtractResult').text)
    end

    it 'Verify Subtract method calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify AddResponse returns result correctly' do
      expect(result).to eq(1)
    end
  end

  context 'TC01.002 - Subtract 2 negative numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.subtract(-3, -7)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//SubtractResult').text)
    end

    it 'Verify Subtract method calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify AddResponse returns result correctly' do
      expect(result).to eq(4)
    end
  end

  context 'TC01.003 - Subtract 1 positive number and 1 negative number' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.subtract(-3, 2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//SubtractResult').text)
    end

    it 'Verify Subtract method calls successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify AddResponse returns result correctly' do
      expect(result).to eq(-5)
    end
  end

  context 'TC01.004 - Subtract with float number' do
    before :all do
      res = Calculator.subtract(5, 3.5)
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC01.005 - Subtract with characters input value' do
    before :all do
      res = Calculator.subtract(5, 'abc')
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC01.006 - Subtract with over load input range' do
    before :all do
      res = Calculator.subtract(99999999999, 3)
    end

    it "Verify 'Input value is over load' erroe responses" do
      expect(res).to eq('Input value is over load')
    end
  end
end