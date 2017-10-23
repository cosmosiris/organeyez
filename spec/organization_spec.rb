require 'spec_helper'
describe Organization do
  # pending "add some examples to (or delete) /Users/apprentice/iris/organeyez/Rakefile"
  let(:dd) {Organization.find_by(email: "dd@gmail.com")}


    it 'has a name' do
      expect(dd.name).to eq("Dream Defenders")
    end

end
