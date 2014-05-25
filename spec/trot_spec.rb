require 'trot'

describe 'Danny Dyer' do
	
	context 'stores infinite wisdom in an array' do
		it 'which must be present' do 
			expect(dannys_wisdom).to be_empty
		end
	end
end

describe 'Dannys Loads' do
	it 'opens up his brain' do
		expect(CSV).to receive(:foreach).with('slags.csv')
		
		loads_dannys_wisdom_from('slags.csv')	
	end
	
	it 'pours out all his brain stuff' do
		writing_wisdom('slags.csv')
		loads_dannys_wisdom_from('slags.csv')
		expect(dannys_wisdom).not_to be_empty
	end
end

describe 'Search for dannys wisdom' do
	it 'finds the first appropriate word from danny' do
		loads_dannys_wisdom_from('slags.csv')
		words = 'Bury'
		output = "Tu-pac. Bury me a G. Aggressive sexiness."
		expect(search words).to eq output
	end
	it 'copes when there is no appropriate word from danny' do
		loads_dannys_wisdom_from('slags.csv')
		words = 'waresfdsdfdfhgdfsd'
		output = "I'm not avin any of that. Get fakked."
		expect(search words).to eq output
	end
end