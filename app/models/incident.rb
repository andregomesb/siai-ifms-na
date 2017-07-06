# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  user_id       :integer
#  institution   :integer
#  description   :text
#  date_incident :date
#  soluction     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :integer
#  time_incident :time
#  assistant_id  :integer
#

class Incident < ApplicationRecord
  include SearchCop

  validates :student, :user, :assistant, :institution, :description,
	    :date_incident, :time_incident, presence: true

  enum institution: [:ifms, :ufms]

  belongs_to :student
  belongs_to :user
  belongs_to :course
  belongs_to :assistant, class_name: 'User', foreign_key: 'id'

  # Delegates
  delegate :name, :to => :student, prefix: true

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :student => "student.name"
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de ocorrencias
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Estudante",'student_id'], ["Instituição",'institution'],
     ["Data",'date_incident']]
  end
end
