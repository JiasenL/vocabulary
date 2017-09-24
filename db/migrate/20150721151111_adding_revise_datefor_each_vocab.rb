class AddingReviseDateforEachVocab < ActiveRecord::Migration[5.1]
  def change
    add_column :dictionaries, :revise_phase1, :datetime
    add_column :dictionaries, :revise_phase2, :datetime
    add_column :dictionaries, :revise_phase3, :datetime
    add_column :dictionaries, :revise_phase4, :datetime
  end
end
