require 'rails_helper.rb'

# spec using fixture
describe Movie do
  fixtures :movies
  it 'includes rating and year in full name' do
    movie = movies(:milk_movie)
    expect(movie.name_with_rating).to eq('Milk (R)')
  end

  describe 'searching Tmdb by keyword' do
    context 'with valid API key' do
      it 'calls Tmdb with title keywords' do
        expect(Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    context 'with invalid API key' do
      before(:each) do
        allow(Tmdb::Movie).to receive(:find).and_raise(Tmdb::InvalidApiKeyError)
      end
      it 'raises an InvalidKeyError' do
        expect { Movie.find_in_tmdb('Inception') }.
          to raise_error(Movie::InvalidKeyError)
      end
    end
  end
end


# # spec using factory
# describe Movie do
#   it 'should include rating and year in full name' do
#     # 'build' creates but doesn't save object; 'create' also saves it
#     movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
#     expect(movie.name_with_rating).to eq 'Milk (R)'
#   end
# end
