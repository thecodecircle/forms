# == Schema Information
#
# Table name: forms
#
#  id         :bigint           not null, primary key
#  creator    :string
#  font       :integer
#  payload    :json
#  slug       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_forms_on_slug  (slug) UNIQUE
#
class Form < ApplicationRecord
    extend FriendlyId
    friendly_id :url, use: :slugged

    has_rich_text :thanks
    enum font: [
        :alef,
        :rubik,
        :miriam_libre,
        :heebo,
        :assistant,
    ]
def self.heb_fonts(font)
    heb_fonts = {
        alef: 'אלף',
        rubik: 'רוביק',
        miriam_libre: 'מרים ליבר',
        heebo: 'היבו',
        assistant: 'אסיסטנט',
    }
    heb_fonts[font.to_sym]
end

end
