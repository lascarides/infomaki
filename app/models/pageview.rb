class Pageview < Initiative

  attr_reader :max_clicks
  
  def percents 
    pcts = []
    @max_clicks ||= 1
    self.replies.each do |reply|
      rx = (reply.coordinate_x.to_f / PAGEVIEW_GRID_SIZE).to_i
      ry = (reply.coordinate_y.to_f / PAGEVIEW_GRID_SIZE).to_i
      pcts[rx]     ||= []
      pcts[rx][ry] ||= 0
      pcts[rx][ry] += 1
      @max_clicks = [@max_clicks, pcts[rx][ry]].max
    end
    return pcts
  end

  def average_reply_time
    reply_count = 0
    rep_total = 0.0
    self.replies.each do |reply|
      if reply.elapsed_time.to_f > 0.0
        reply_count += 1
        rep_total += reply.elapsed_time
      end
    end
    if reply_count > 0
      avg = rep_total / reply_count.to_f
    else
      avg = 0.0
    end
    return sprintf("%.2f", avg).to_f
  end

end
