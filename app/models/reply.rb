class Reply < ActiveRecord::Base

  belongs_to :question
  belongs_to :card_sort
  belongs_to :initiative

  validate :proper_values_by_type

  def before_validation
    # Weed out funky input in short replies
    self.short_answer.downcase! unless self.short_answer.blank?
    self.short_answer.gsub!(/[^a-z0-9 \-']/, "") unless self.short_answer.blank?
    # make sure ridiculously high elapsed times don't skew the average
    self.elapsed_time = MAX_ELAPSED_TIME if self.elapsed_time.to_f > MAX_ELAPSED_TIME
  end

  def animation_time
    anim_time = [self.elapsed_time.to_f, LENGTH_OF_ANIMATION].min 
    anim_time = LENGTH_OF_ANIMATION if anim_time == 0.0
    anim_time
  end

protected

  def proper_values_by_type
    case self.initiative.class.to_s
    when "CardSort"
      errors.add_to_base("Please choose a value.") if self.short_answer.blank?
    when "Quiz"
      errors.add_to_base("Please choose a value.") if self.short_answer.blank?
    when "Pageview"
      errors.add_to_base("Please try again... Something went wrong!") if self.coordinate_x.blank? or self.coordinate_y.blank?
    end
  end
  
end
