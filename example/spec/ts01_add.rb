require File.expand_path('../../spec_helper', __FILE__)
require 'calculator'

describe 'TS01 - Add 2 numbers' do
  #---Set variable all TS
  res = nil

  context 'TC01.001 - Add 2 integer numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.add(1, 3)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//AddResponse').text)
    end

    it 'Verify Add method responses successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify AddResponse returns result correctly' do
      expect(result).to eq(4)
    end
  end

  context 'TC01.002 - Add 2 negative numbers' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.add(-1, -3)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//AddResponse').text)
    end

    it 'Verify Add method responses successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify AddResponse returns result correctly' do
      expect(result).to eq(-4)
    end
  end

  context 'TC01.003 - Add 1 positive number and 1 negative number' do
    soap_fault = nil
    result = nil
    before :all do
      res_xml = Calculator.add(4, -2)
      soap_fault = res_xml.xpath('//faultcode').count
      result = LFCommon.end_code_result(res_xml.xpath('//AddResponse').text)
    end

    it 'Verify Add method responses successfully' do
      expect(soap_fault).to eq(0)
    end

    it 'Verify AddResponse returns result correctly' do
      expect(result).to eq(2)
    end
  end

  context 'TC01.004 - Add with float number' do
    before :all do
      res = Calculator.add(1.0, 3.5)
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC01.005 - Add with characters input value' do
    before :all do
      res = Calculator.add('abc', 3)
    end

    it "Verify 'Invalid input value' erroe responses" do
      expect(res).to eq('Invalid input')
    end
  end

  context 'TC01.006 - Add with over load input range' do
    before :all do
      res = Calculator.add(99999999999, 3)
    end

    it "Verify 'Input value is over load' erroe responses" do
      expect(res).to eq('Input value is over load')
    end
  end
end