require 'spec_helper'
describe Organization do
  # pending "add some examples to (or delete) /Users/apprentice/iris/organeyez/Rakefile"
  let(:dd) {Organization.create(name: "Dream Defenders", email: "dd@gmail.com", password: "1234")}


    it 'has a name' do
      expect(dd.name).to eq("Dream Defenders")
    end

end
