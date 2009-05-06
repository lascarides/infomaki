class ReportsController < ApplicationController

  def index
  end
  
  def daily
    @total_replies = Reply.count(:all)
    @respondents = Reply.count(:all, :select => "DISTINCT session_id")
    @replies = Reply.count(:all, :group => "DATE(created_at)", :order => "count_all DESC")
    if @replies.size > 0 
      @replies.collect! { |r| [r[0], r[1] ]}
    end
  end

end
