module ApplicationHelper
  def create_cache_key(model, key_name)
    [key_name, model.profile.id, model.profile.updated_at].join('-')
  end
end
