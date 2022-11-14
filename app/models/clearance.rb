class Clearance < ApplicationRecord
  validates :degree, :session, :link, presence: true
  belongs_to :user

  enum status: { pending: "Pending", successful: "successful", rejected: "Rejected"}
  enum degree: { "ND Morning": "National Diploma (Morning)", "ND Evening": "National Diploma (Evening)", "HND Morning": "Higher National Diploma (Morning)", "HND Evening": "Higher National Diploma (Evening)" }
end
