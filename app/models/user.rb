class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :repos, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :looking_fors, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :jobs, dependent: :destroy

  enum role: [:employee, :employer, :admin]
  has_many :skills, dependent: :destroy
  has_many :educations, dependent: :destroy

  def self.from_omniauth(auth_hash)
    # find_or_create_by ensures we don't create a user multiple times
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    # user.location = get_social_location_for user.provider, auth_hash['info']['location']
    user.linkedin_url = auth_hash['info']['linkedin_url']
    user.avatar = auth_hash['info']['avatar']
    user.email = auth_hash['info']['email']
    user.bio = auth_hash['info']['bio']
    user.token = auth_hash['credentials']['token']
    user.save!
    user
  end
  # get_info = AngellistFetcher.new(@current)
  # get_info.get_skills
  # get_info.get_education
  # get_info.get_positions
  # get_info.get_past_positions
  # return @current
# end

private 

  # def get_social_location_for(provider, location_hash)
  #   case provider
  #   when 'angellist'
  #     location_hash['name']
  #   else
  #     location_hash
  #   end
  # end
  
  def current_employer
    employments.where(current: true).first
  end
end





    # def self.create_with_omniauth(auth, code)
    #   @current = create! do |user|
    #     user.provider = auth["provider"]
    #     user.uid = auth["uid"]
    #     user.name = auth["info"]["name"]
    #     user.location = auth["info"]["location"]["name"]
    #     user.linkedin_url = auth["info"]["urls"]["public_profile"]
    #     user.picture_url = auth["info"]["image"]
    #     user.email = auth["info"]["email"]
    #     user.description = auth["info"]["description"]
    #     user.token = auth["credentials"]["token"]
    #   end
    #   get_info = AngellistFetcher.new(@current)
    #   get_info.get_skills
    #   get_info.get_education
    #   get_info.get_positions
    #   get_info.get_past_positions
    #   return @current
    # end

    
