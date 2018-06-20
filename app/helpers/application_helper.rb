module ApplicationHelper
  def create_cache_key(model, key_name)
    [key_name, model.profile.id, model.profile.updated_at].join('-')
  end

  def create_politician_key(model, key_name)
    [key_name, model.politician.id, model.politician.updated_at].join('-')
  end

  def state_list
    [['Alabama', 'AL'],
     ['Alaska', 'AK'],
     ['Arizona', 'AZ'],
     ['Arkansas', 'AR'],
     ['California', 'CA'],
     ['Colorado', 'CO'],
     ['Connecticut', 'CT'],
     ['Delaware', 'DE'],
     ['Florida', 'FL'],
     ['Georgia', 'GA'],
     ['Hawaii', 'HI'],
     ['Idaho', 'ID'],
     ['Illinois', 'IL'],
     ['Indiana', 'IN'],
     ['Iowa', 'IA'],
     ['Kansas', 'KS'],
     ['Kentucky', 'KY'],
     ['Louisiana', 'LA'],
     ['Maine', 'ME'],
     ['Maryland', 'MD'],
     ['Massachusetts', 'MA'],
     ['Michigan', 'MI'],
     ['Minnesota', 'MN'],
     ['Mississippi', 'MS'],
     ['Missouri', 'MO'],
     ['Montana', 'MT'],
     ['Nebraska', 'NE'],
     ['Nevada', 'NV'],
     ['New Hampshire', 'NH'],
     ['New Jersey', 'NJ'],
     ['New Mexico', 'NM'],
     ['New York', 'NY'],
     ['North Carolina', 'NC'],
     ['North Dakota', 'ND'],
     ['Ohio', 'OH'],
     ['Oklahoma', 'OK'],
     ['Oregon', 'OR'],
     ['Pennsylvania', 'PA'],
     ['Rhode Island', 'RI'],
     ['South Carolina', 'SC'],
     ['South Dakota', 'SD'],
     ['Tennessee', 'TN'],
     ['Texas', 'TX'],
     ['Utah', 'UT'],
     ['Vermont', 'VT'],
     ['Virginia', 'VA'],
     ['Washington', 'WA'],
     ['West Virginia', 'WV'],
     ['Wisconsin', 'WI'],
     ['Wyoming', 'WY']]
  end
end
