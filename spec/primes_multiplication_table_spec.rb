require 'spec_helper'

RSpec.describe PrimesMultiplicationTable do
  let(:matrix_5) do
    [
      ['2|', 4, 6, 10, 14, 22],
      ['3|', 6, 9, 15, 21, 33],
      ['5|', 10, 15, 25, 35, 55],
      ['7|', 14, 21, 35, 49, 77],
      ['11|', 22, 33, 55, 77, 121]
    ]
  end

  it { expect(PrimesMultiplicationTable.output(5)).to eq(matrix_5) }
  it { expect(PrimesMultiplicationTable.output('5abc')).to eq(matrix_5) }
  it { expect(PrimesMultiplicationTable.output(nil)).to be_nil }
  it { expect(PrimesMultiplicationTable.output('param')).to be_nil }
  it { expect(PrimesMultiplicationTable.output('param')).to be_nil }
  it { expect(PrimesMultiplicationTable.output('rt10100')).to be_nil }
  it { expect(PrimesMultiplicationTable.output('')).to be_nil }
  it { expect(PrimesMultiplicationTable.output(0)).to be_nil }
end
