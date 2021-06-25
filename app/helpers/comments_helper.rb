module CommentsHelper

  def get_color_rating(n)
    case n
    when 0..2
      "bg-danger"
    when 2..5
      "bg-warning"
    when 5..10
      "bg-green"
    end
  end

end
