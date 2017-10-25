require 'json'
require 'sinatra'

class Patient
  #instantiate patient with necessary attributes
  def initialize(name, org, gender, conds)
    @name = name
    @org = org
    @gender = gender
    @conds = conds
  end

  #set attribute readers so to access
  attr_reader :name, :org, :gender, :conds, :n_conds
end

get "/" do
  #read in json
  file = File.read('./patient.json')

  #unmarshal json to hash
  p_hash = JSON.parse(file)

  #assign necessary hash parameters to variables
  name = p_hash["name"]["family"] + ", " + p_hash["name"]["given"]
  org = p_hash["managingOrganization"]["display"]
  gender = p_hash["gender"]
  conds = p_hash["conditions"]

  #instantiate patient
  @patient = Patient.new(name, org, gender, conds)

  #render views/home.erb
  erb :home
end
