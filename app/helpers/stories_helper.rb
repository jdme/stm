module StoriesHelper
  def story_states
    Story.state_machine(:status).states.map {|s| [s.name, s.value]}
  end

  def story_users
    User.scoped
  end
end
