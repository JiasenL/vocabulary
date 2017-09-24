class ReviseController < ApplicationController

  def update
    revised_vocab = Dictionary.find(params[:revised])
    puts revised_vocab
    if (revised_vocab != nil)
      if (revised_vocab.revise_phase1 == nil)
        revised_vocab.update_attribute(:revise_phase1,Time.now)
      elsif (revised_vocab.revise_phase2 == nil)
        revised_vocab.update_attribute(:revise_phase2,Time.now)
      elsif (revised_vocab.revise_phase3 == nil)
        revised_vocab.update_attribute(:revise_phase3,Time.now)
      elsif (revised_vocab.revise_phase4 == nil)
        revised_vocab.update_attribute(:revise_phase4,Time.now)
      end

      redirect_to revise_index_path
    end
  end

  def index
    @dictionary = Dictionary.all
    @revise_phase0 = []
    @revise_phase1 = []
    @revise_phase1_1 = []
    @revise_phase2 = []
    @revise_phase2_1 = []
    @revise_phase3 = []
    @revise_phase4 = []

    # puts @dictionary
    @dictionary.each do |node|
      if (node.revise_phase1 == nil)
        if ( Time.now - node.created_at > 1.day)
          @revise_phase1.push(node)
        else
          @revise_phase0.push(node)
        end
      elsif (node.revise_phase2 == nil)
        if ( Time.now - node.revise_phase1 > 7.days)
          @revise_phase2.push(node)
        elsif ( Time.now - node.revise_phase1 < 2.days)
          @revise_phase1_1.push(node)
        end
      elsif (node.revise_phase3 == nil)
          if ( Time.now - node.revise_phase2 > 1.month)
            @revise_phase3.push(node)
          elsif ( Time.now - node.revise_phase2 < 8.days)
            @revise_phase2_1.push(node)
          end
      elsif (node.revise_phase4 == nil)
        if ( Time.now - node.revise_phase3 > 3.months)
          @revise_phase4.push(node)
        end
      end
    end


  end
end
