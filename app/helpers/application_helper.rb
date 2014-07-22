module ApplicationHelper

  def difficulty_label(question)
    if question.easy?
      %Q[<span class="label success round">EASY #{question.difficulty}/5</span>].html_safe
    elsif question.normal?
      %Q[<span class="label warning round">NORMAL #{question.difficulty}/5</span>].html_safe
    elsif question.hard?
      %Q[<span class="label alert round">HARD #{question.difficulty}/5</span>].html_safe
    end
  end

end
