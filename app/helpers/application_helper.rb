module ApplicationHelper
  def create_cache_key(model, key_name)
    [key_name, model.profile.id, model.profile.updated_at].join('-')
  end

  def create_politician_key(model, key_name)
    [key_name, model.politician.id, model.politician.updated_at].join('-')
  end
end
